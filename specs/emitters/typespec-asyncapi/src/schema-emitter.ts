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
  getPattern,
  isDeprecated,
  isSecret,
  Model,
  ModelProperty,
  Program,
  resolveEncodedName,
  Scalar,
  serializeValueAsJson,
  StringLiteral,
  Type,
  Union,
} from "@typespec/compiler";
import { AsyncAPISchema, SchemaOrRef } from "./types.js";

/** Resolve a (possibly named) type to a schema — a `$ref` for named models/unions, inline otherwise. */
export type RefFn = (type: Type) => SchemaOrRef;

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
function schemaForType(program: Program, t: Type, ref: RefFn): SchemaOrRef {
  return isRefworthy(t) ? ref(t) : typeToSchema(program, t, ref);
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

/**
 * Schema for a model property: resolves the type (honoring `@encode`), then layers on
 * description, constraints, `default`, `examples`, and `deprecated`. These are only
 * merged onto inline schemas — a `$ref` ignores sibling keywords in Draft-07.
 */
export function propertySchema(program: Program, prop: ModelProperty, ref: RefFn): SchemaOrRef {
  const resolved = encodeSchema(program, prop) ?? schemaForType(program, prop.type, ref);
  if ("$ref" in resolved) return resolved;

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

/** Build an inline object schema from a model's OWN properties. */
function ownObjectSchema(program: Program, model: Model, ref: RefFn): AsyncAPISchema {
  const properties: Record<string, SchemaOrRef> = {};
  const required: string[] = [];
  for (const prop of model.properties.values()) {
    const name = encodedPropName(program, prop);
    properties[name] = propertySchema(program, prop, ref);
    if (!prop.optional) required.push(name);
  }
  const schema: AsyncAPISchema = { type: "object", properties };
  if (required.length) schema.required = required;
  const doc = getDoc(program, model);
  if (doc) schema.description = doc;
  if (isDeprecated(program, model)) schema.deprecated = true;
  return schema;
}

function unionInline(program: Program, union: Union, ref: RefFn): AsyncAPISchema {
  const variants = [...union.variants.values()].map((v) => v.type);
  if (variants.length && variants.every((v) => v.kind === "String")) {
    return { type: "string", enum: variants.map((v) => (v as StringLiteral).value) };
  }
  return { oneOf: variants.map((v) => schemaForType(program, v, ref)) };
}

/** Build an inline schema for a type. Named property/element types are delegated to `ref`. */
export function typeToSchema(program: Program, type: Type, ref: RefFn): AsyncAPISchema {
  switch (type.kind) {
    case "Scalar":
      return applyConstraints(program, type, encodeSchema(program, type) ?? scalarSchema(type));
    case "String":
    case "Number":
    case "Boolean":
      return enumSchema([type.value]);
    case "Model": {
      if (type.name === "Array" && type.indexer) {
        return { type: "array", items: schemaForType(program, type.indexer.value, ref) };
      }
      if (type.name === "Record" && type.indexer) {
        return { type: "object", additionalProperties: schemaForType(program, type.indexer.value, ref) };
      }
      return ownObjectSchema(program, type, ref);
    }
    case "Union":
      return unionInline(program, type, ref);
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
 */
export function createSchemaRegistry(program: Program): SchemaRegistry {
  const schemas: Record<string, AsyncAPISchema> = {};

  function refFor(t: Type): SchemaOrRef {
    if (isNamedModel(t)) {
      registerModel(t);
      return { $ref: `#/components/schemas/${t.name}` };
    }
    if (t.kind === "Union" && !!t.name) {
      if (!schemas[t.name]) schemas[t.name] = unionInline(program, t, refFor);
      return { $ref: `#/components/schemas/${t.name}` };
    }
    return typeToSchema(program, t, refFor);
  }

  function registerModel(model: Model): void {
    const name = model.name;
    if (schemas[name]) return;
    schemas[name] = {}; // cycle guard

    const disc = getDiscriminator(program, model);
    if (disc) {
      const base = ownObjectSchema(program, model, refFor);
      base.properties ??= {};
      base.properties[disc.propertyName] ??= { type: "string" };
      base.discriminator = disc.propertyName;
      base.required = Array.from(new Set([...(base.required ?? []), disc.propertyName]));
      schemas[name] = base;
      for (const derived of model.derivedModels) refFor(derived);
      return;
    }

    if (model.baseModel) {
      const baseRef = refFor(model.baseModel);
      const own = ownObjectSchema(program, model, refFor);
      const baseDisc = getDiscriminator(program, model.baseModel)?.propertyName;
      const discProp = baseDisc ? own.properties?.[baseDisc] : undefined;
      const discEnum = discProp && !("$ref" in discProp) ? discProp.enum : undefined;
      if (baseDisc && own.properties && Array.isArray(discEnum) && discEnum.length === 1) {
        // Override the inherited discriminator with the variant's literal value,
        // inferring the JSON-Schema type from the value (string/number/boolean).
        own.properties[baseDisc] = constSchema(discEnum[0]);
      }
      schemas[name] = { allOf: [baseRef, own] };
      return;
    }

    schemas[name] = ownObjectSchema(program, model, refFor);
  }

  return { schemas, refFor };
}
