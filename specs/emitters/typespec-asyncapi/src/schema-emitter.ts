import {
  getDiscriminator,
  getDoc,
  getEncode,
  getExamples,
  getFormat,
  getMaxItems,
  getMaxLength,
  getMaxValue,
  getMaxValueExclusive,
  getMinItems,
  getMinLength,
  getMinValue,
  getMinValueExclusive,
  getNamespaceFullName,
  getPattern,
  getTypeName,
  isDeprecated,
  isSecret,
  Model,
  ModelProperty,
  Namespace,
  Program,
  resolveEncodedName,
  Scalar,
  serializeValueAsJson,
  StringLiteral,
  Type,
  TypeNameOptions,
  Union,
} from "@typespec/compiler";
import { getExcludedTypes, isExcludedType, isSelfExcluded } from "@signalwire/typespec-emit-filter";
import { reportDiagnostic } from "./lib.js";
import { AsyncAPISchema, SchemaOrRef } from "./types.js";

/**
 * Resolve a (possibly named) type to a schema — a `$ref` for named models/unions,
 * inline otherwise. The optional `excluded` scope carries the types stripped by
 * `@excludeFromEmit` down into the named type's own subtree (see {@link augment}).
 */
export type RefFn = (type: Type, excluded?: readonly Type[]) => SchemaOrRef;

/** Shared empty `@excludeFromEmit` scope — the default for every builder. */
const NO_EXCLUSIONS: readonly Type[] = [];

/**
 * Union an inherited exclusion scope with the types a newly-entered model/union/
 * property excludes via `@excludeFromEmit`. Returns the same array unchanged when
 * the new scope adds nothing (the common case — no allocation).
 */
function augment(excluded: readonly Type[], add: readonly Type[]): readonly Type[] {
  return add.length ? [...excluded, ...add] : excluded;
}

/**
 * True if `t` must be dropped from this emit — either by an in-scope scoped
 * `@excludeFromEmit(...types)` or by a bare `@excludeFromEmit` on `t` itself
 * (self-exclusion, honored globally wherever the type appears).
 */
function isDropped(program: Program, scoped: readonly Type[], t: Type): boolean {
  return isExcludedType(scoped, t) || isSelfExcluded(program, t);
}

const SCALAR_MAP: Record<string, AsyncAPISchema> = {
  string: { type: "string" },
  boolean: { type: "boolean" },
  bytes: { type: "string", format: "byte" },
  int8: { type: "integer", format: "int8" },
  int16: { type: "integer", format: "int16" },
  int32: { type: "integer", format: "int32" },
  int64: { type: "integer", format: "int64" },
  integer: { type: "integer" },
  safeint: { type: "integer", format: "int64" },
  float32: { type: "number", format: "float" },
  float64: { type: "number", format: "double" },
  float: { type: "number" },
  numeric: { type: "number" },
  decimal: { type: "number" },
  url: { type: "string", format: "uri" },
  uuid: { type: "string", format: "uuid" },
  plainDate: { type: "string", format: "date" },
  plainTime: { type: "string", format: "time" },
  utcDateTime: { type: "string", format: "date-time" },
  offsetDateTime: { type: "string", format: "date-time" },
  duration: { type: "string", format: "duration" },
};

function scalarSchema(scalar: Scalar): AsyncAPISchema {
  let s: Scalar | undefined = scalar;
  while (s) {
    if (SCALAR_MAP[s.name]) return { ...SCALAR_MAP[s.name] };
    s = s.baseScalar;
  }
  return { type: "string" };
}

/** A model emitted as a named component (excludes Array/Record/anonymous models). */
function isNamedModel(t: Type): t is Model {
  return t.kind === "Model" && !!t.name && t.name !== "Array" && t.name !== "Record" && !t.indexer;
}

/** True for types that should be emitted as a named component and `$ref`'d. */
function isRefworthy(t: Type): boolean {
  return isNamedModel(t) || (t.kind === "Union" && !!t.name);
}

/** JSON-Schema for a set of literal values, inferring `type` from the values. */
function enumSchema(values: unknown[]): AsyncAPISchema {
  if (values.every((v) => typeof v === "string")) return { type: "string", enum: values };
  if (values.every((v) => typeof v === "number")) {
    return { type: values.every((v) => Number.isInteger(v)) ? "integer" : "number", enum: values };
  }
  if (values.every((v) => typeof v === "boolean")) return { type: "boolean", enum: values };
  return { enum: values };
}

/** JSON-Schema for a single constant, inferring `type` from the value. */
function constSchema(value: unknown): AsyncAPISchema {
  if (typeof value === "number") {
    return { type: Number.isInteger(value) ? "integer" : "number", const: value };
  }
  if (typeof value === "boolean") return { type: "boolean", const: value };
  return { type: "string", const: value };
}

/** Map a TypeSpec `@encode` encoding to a JSON-Schema `format` (open vocabulary). */
function encodeFormat(encoding?: string): string | undefined {
  switch (encoding) {
    case "rfc3339":
      return "date-time";
    case "rfc7231":
      return "http-date";
    case "ISO8601":
      return "duration";
    case "base64":
      return "byte";
    case "base64url":
      return "base64url";
    default:
      // unixTimestamp / seconds / milliseconds / base10 string → wire type carries it, no format
      return undefined;
  }
}

/**
 * If `@encode` is present, "decay" to the wire type's schema (per the compiler's
 * encoding guidance) and carry the encoding as a JSON-Schema `format` where known.
 */
function encodeSchema(program: Program, target: ModelProperty | Scalar): AsyncAPISchema | undefined {
  const enc = getEncode(program, target);
  if (!enc) return undefined;
  const base = scalarSchema(enc.type);
  const fmt = encodeFormat(enc.encoding);
  return fmt ? { ...base, format: fmt } : base;
}

/** The JSON wire name of a property, honoring `@encodedName("application/json", ...)`. */
export function encodedPropName(program: Program, prop: ModelProperty): string {
  return resolveEncodedName(program, prop, "application/json");
}

/** Schema for a property/element type: `$ref` if named, inline otherwise. */
function schemaForType(
  program: Program,
  t: Type,
  ref: RefFn,
  excluded: readonly Type[] = NO_EXCLUSIONS,
): SchemaOrRef {
  return isRefworthy(t) ? ref(t, excluded) : typeToSchema(program, t, ref, excluded);
}

/**
 * Merge JSON-Schema validation keywords from a target's TypeSpec constraint
 * decorators (`@minValue`/`@maxValue`/`@minValueExclusive`/`@maxValueExclusive`/
 * `@minLength`/`@maxLength`/`@minItems`/`@maxItems`/`@pattern`/`@format`/`@secret`).
 * AsyncAPI 3.0's Schema Object is a JSON-Schema Draft-07 superset, so these are valid.
 */
function applyConstraints(program: Program, target: Type, schema: AsyncAPISchema): AsyncAPISchema {
  const out: AsyncAPISchema = { ...schema };
  const minimum = getMinValue(program, target);
  if (minimum !== undefined) out.minimum = minimum;
  const maximum = getMaxValue(program, target);
  if (maximum !== undefined) out.maximum = maximum;
  const exclusiveMinimum = getMinValueExclusive(program, target);
  if (exclusiveMinimum !== undefined) out.exclusiveMinimum = exclusiveMinimum;
  const exclusiveMaximum = getMaxValueExclusive(program, target);
  if (exclusiveMaximum !== undefined) out.exclusiveMaximum = exclusiveMaximum;
  const minLength = getMinLength(program, target);
  if (minLength !== undefined) out.minLength = minLength;
  const maxLength = getMaxLength(program, target);
  if (maxLength !== undefined) out.maxLength = maxLength;
  const minItems = getMinItems(program, target);
  if (minItems !== undefined) out.minItems = minItems;
  const maxItems = getMaxItems(program, target);
  if (maxItems !== undefined) out.maxItems = maxItems;
  const pattern = getPattern(program, target);
  if (pattern !== undefined) out.pattern = pattern;
  const format = getFormat(program, target);
  if (format !== undefined) out.format = format;
  if (out.format === undefined && isSecret(program, target)) out.format = "password";
  return out;
}

/** Property-site metadata: `description`, `default`, `examples`, `deprecated`. */
function propertyMetadata(program: Program, prop: ModelProperty): AsyncAPISchema {
  const meta: AsyncAPISchema = {};
  const doc = getDoc(program, prop);
  if (doc) meta.description = doc;
  if (prop.defaultValue) {
    const def = serializeValueAsJson(program, prop.defaultValue, prop.type);
    if (def !== undefined) meta.default = def;
  }
  const examples = getExamples(program, prop);
  if (examples.length) {
    meta.examples = examples.map((e) => serializeValueAsJson(program, e.value, prop.type));
  }
  if (isDeprecated(program, prop)) meta.deprecated = true;
  return meta;
}

/**
 * Schema for a model property: resolves the type (honoring `@encode`), then layers on
 * description, constraints, `default`, `examples`, and `deprecated`. For an inline
 * schema these merge directly; for a `$ref` (named enum/union/model) Draft-07 ignores
 * sibling keywords, so the metadata is attached via an `allOf` wrapper — otherwise a
 * property's description and default would be silently dropped.
 */
export function propertySchema(
  program: Program,
  prop: ModelProperty,
  ref: RefFn,
  excluded: readonly Type[] = NO_EXCLUSIONS,
): SchemaOrRef {
  const resolved = encodeSchema(program, prop) ?? schemaForType(program, prop.type, ref, excluded);
  if ("$ref" in resolved) {
    const meta = propertyMetadata(program, prop);
    return Object.keys(meta).length ? { ...meta, allOf: [resolved] } : resolved;
  }

  let out: AsyncAPISchema = resolved;
  const doc = getDoc(program, prop);
  if (doc) out = { ...out, description: doc };
  out = applyConstraints(program, prop, out);
  if (prop.defaultValue) {
    const def = serializeValueAsJson(program, prop.defaultValue, prop.type);
    if (def !== undefined) out = { ...out, default: def };
  }
  const examples = getExamples(program, prop);
  if (examples.length) {
    out = { ...out, examples: examples.map((e) => serializeValueAsJson(program, e.value, prop.type)) };
  }
  if (isDeprecated(program, prop)) out = { ...out, deprecated: true };
  return out;
}

/**
 * Build an inline object schema from a model's OWN properties. A property is dropped
 * when its type is excluded by an in-scope `@excludeFromEmit` (so a property typed as a
 * bare excluded type disappears); the property's own exclusions are unioned into the
 * scope passed down into its value schema.
 */
function ownObjectSchema(
  program: Program,
  model: Model,
  ref: RefFn,
  excluded: readonly Type[] = NO_EXCLUSIONS,
): AsyncAPISchema {
  // Honor a model-level @excludeFromEmit here, not only in registerModel, so it applies
  // whether the model is emitted as a named component or inlined. Open models (with a
  // `...Record<unknown>` index signature) are never registered — they always inline — so
  // without this their exclusions would be silently ignored.
  const scoped = augment(excluded, getExcludedTypes(program, model));
  const properties: Record<string, SchemaOrRef> = {};
  const required: string[] = [];
  for (const prop of model.properties.values()) {
    const propScoped = augment(scoped, getExcludedTypes(program, prop));
    if (isDropped(program, propScoped, prop.type)) continue;
    const name = encodedPropName(program, prop);
    properties[name] = propertySchema(program, prop, ref, propScoped);
    if (!prop.optional) required.push(name);
  }
  const schema: AsyncAPISchema = { type: "object", properties };
  if (required.length) schema.required = required;
  const doc = getDoc(program, model);
  if (doc) schema.description = doc;
  if (isDeprecated(program, model)) schema.deprecated = true;
  return schema;
}

/**
 * Inline schema for a union. Arms whose type is excluded by an in-scope
 * `@excludeFromEmit` are dropped, then the survivors collapse: none → `{}`; one → that
 * arm's bare schema (no `oneOf` wrapper); all string literals → a single string `enum`;
 * otherwise `oneOf`.
 */
function unionInline(
  program: Program,
  union: Union,
  ref: RefFn,
  excluded: readonly Type[] = NO_EXCLUSIONS,
): SchemaOrRef {
  const scoped = augment(excluded, getExcludedTypes(program, union));
  const variants = [...union.variants.values()]
    .map((v) => v.type)
    .filter((v) => !isDropped(program, scoped, v));
  if (variants.length === 0) return {};
  if (variants.length === 1) return schemaForType(program, variants[0], ref, scoped);
  if (variants.every((v) => v.kind === "String")) {
    return { type: "string", enum: variants.map((v) => (v as StringLiteral).value) };
  }
  return { oneOf: variants.map((v) => schemaForType(program, v, ref, scoped)) };
}

/** Build an inline schema for a type. Named property/element types are delegated to `ref`. */
export function typeToSchema(
  program: Program,
  type: Type,
  ref: RefFn,
  excluded: readonly Type[] = NO_EXCLUSIONS,
): SchemaOrRef {
  switch (type.kind) {
    case "Scalar":
      return applyConstraints(program, type, encodeSchema(program, type) ?? scalarSchema(type));
    case "String":
    case "Number":
    case "Boolean":
      return enumSchema([type.value]);
    case "Model": {
      if (type.name === "Array" && type.indexer) {
        return { type: "array", items: schemaForType(program, type.indexer.value, ref, excluded) };
      }
      if (type.name === "Record" && type.indexer) {
        return {
          type: "object",
          additionalProperties: schemaForType(program, type.indexer.value, ref, excluded),
        };
      }
      return ownObjectSchema(program, type, ref, excluded);
    }
    case "Union":
      return unionInline(program, type, ref, excluded);
    case "Enum":
      return enumSchema([...type.members.values()].map((mem) => mem.value ?? mem.name));
    case "EnumMember":
      return enumSchema([type.value ?? type.name]);
    default:
      return {};
  }
}

export interface SchemaRegistry {
  schemas: Record<string, AsyncAPISchema>;
  /** Register a type if named (returns `$ref`), or return its inline schema. */
  refFor: RefFn;
}

/**
 * Creates a registry that accumulates named component schemas. Models with
 * `@discriminator` are emitted as an AsyncAPI polymorphism base (string
 * discriminator + required); models that `extends` a base are emitted as
 * `allOf`-inheritance — the AsyncAPI-documented (and Fern-safe) form.
 *
 * Component names come from `getTypeName` with the service namespace filtered out, so
 * service-local types stay bare while imported cross-namespace types (e.g. reused SWML
 * models) are qualified (`SWML.Calling.Foo`) and can't collide. A second type wanting an
 * already-emitted name raises a `duplicate-type-name` diagnostic instead of overwriting.
 */
export function createSchemaRegistry(program: Program, serviceNamespace?: Namespace): SchemaRegistry {
  const schemas: Record<string, AsyncAPISchema> = {};
  const emittedNames = new Map<string, Type>();
  const serviceNamespaceName = serviceNamespace ? getNamespaceFullName(serviceNamespace) : undefined;
  const typeNameOptions: TypeNameOptions = {
    // Shorten names by dropping the service namespace; keep any other namespace so
    // cross-namespace imports are qualified and distinct.
    namespaceFilter: (ns) => getNamespaceFullName(ns) !== serviceNamespaceName,
  };

  /** Qualified component name for a type, flagging collisions between distinct types. */
  function nameFor(t: Type): string {
    const name = getTypeName(t, typeNameOptions);
    const prev = emittedNames.get(name);
    if (prev && prev !== t) {
      reportDiagnostic(program, { code: "duplicate-type-name", target: t, format: { value: name } });
    } else if (!prev) {
      emittedNames.set(name, t);
    }
    return name;
  }

  function refFor(t: Type, excluded: readonly Type[] = NO_EXCLUSIONS): SchemaOrRef {
    if (isNamedModel(t)) {
      const name = registerModel(t, excluded);
      return { $ref: `#/components/schemas/${name}` };
    }
    if (t.kind === "Union" && !!t.name) {
      const name = nameFor(t);
      if (!schemas[name]) {
        const u = unionInline(program, t, refFor, excluded);
        // A named union that collapses to a single named survivor resolves to a bare
        // `$ref`; wrap it so the component stays a Schema Object.
        schemas[name] = "$ref" in u ? { allOf: [u] } : u;
      }
      return { $ref: `#/components/schemas/${name}` };
    }
    return typeToSchema(program, t, refFor, excluded);
  }

  function registerModel(model: Model, excluded: readonly Type[] = NO_EXCLUSIONS): string {
    const name = nameFor(model);
    if (schemas[name]) return name;
    schemas[name] = {}; // cycle guard

    // Exclusions threaded into nested base/derived model refs. The model's own object
    // schema gets the inherited `excluded`; ownObjectSchema folds in its own exclusions.
    const scoped = augment(excluded, getExcludedTypes(program, model));

    const disc = getDiscriminator(program, model);
    if (disc) {
      const base = ownObjectSchema(program, model, refFor, excluded);
      base.properties ??= {};
      base.properties[disc.propertyName] ??= { type: "string" };
      base.discriminator = disc.propertyName;
      base.required = Array.from(new Set([...(base.required ?? []), disc.propertyName]));
      schemas[name] = base;
      for (const derived of model.derivedModels) refFor(derived, scoped);
      return name;
    }

    if (model.baseModel) {
      const baseRef = refFor(model.baseModel, scoped);
      const own = ownObjectSchema(program, model, refFor, excluded);
      const baseDisc = getDiscriminator(program, model.baseModel)?.propertyName;
      const discProp = baseDisc ? own.properties?.[baseDisc] : undefined;
      const discEnum = discProp && !("$ref" in discProp) ? discProp.enum : undefined;
      if (baseDisc && own.properties && Array.isArray(discEnum) && discEnum.length === 1) {
        // Override the inherited discriminator with the variant's literal value,
        // inferring the JSON-Schema type from the value (string/number/boolean).
        own.properties[baseDisc] = constSchema(discEnum[0]);
      }
      schemas[name] = { allOf: [baseRef, own] };
      return name;
    }

    schemas[name] = ownObjectSchema(program, model, refFor, excluded);
    return name;
  }

  return { schemas, refFor };
}
