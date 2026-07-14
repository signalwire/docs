// JSON-Schema emission for webhook payloads.
//
// Reads constraint metadata via the canonical compiler/openapi accessors —
// the same ones @typespec/openapi3's schema emitter uses — so payload
// schemas read identically to the rest of the OpenAPI document. Stdlib
// scalars route through a table mirroring the official getSchemaForStdScalars.
//
// Schemas are fully inlined by design: webhook payloads must be self-
// contained, since the OpenAPI 3.1 `webhooks` slot is populated through
// the OpenAPI extension hook and there is no $ref-resolution pass downstream.

import {
  getDoc,
  getFormat,
  getPattern,
  getMinLength,
  getMaxLength,
  getMinItems,
  getMaxItems,
  getMinValue,
  getMaxValue,
  getMinValueForScalar,
  getMaxValueForScalar,
  getMinValueExclusive,
  getMaxValueExclusive,
  getEncode,
  isSecret,
  isArrayModelType,
  isNeverType,
  isTemplateDeclaration,
  getDeprecated,
  getExamples,
  serializeValueAsJson,
  resolveEncodedName,
} from "@typespec/compiler";
import { getExtensions, getExternalDocs, isReadonlyProperty } from "@typespec/openapi";
import { getOneOf } from "@typespec/openapi3";
import { isSelfExcluded } from "@signalwire/typespec-emit-filter";

// Honor the bare `@excludeFromEmit` form (self-exclusion) the same way the
// filter-honoring emitters do: a union arm of (or array of) an excluded type
// is dropped, a property typed as one disappears. Webhook schemas are built
// in $onValidate — before any emitter runs — so this walker must apply the
// filter itself.
function isDroppedType(program, type) {
  if (isSelfExcluded(program, type)) return true;
  if (type.kind === "Model" && isArrayModelType(program, type) && type.indexer?.value) {
    return isDroppedType(program, type.indexer.value);
  }
  return false;
}

// ── Stdlib scalar mapping ─────────────────────────────────────────────
//
// Mirrors @typespec/openapi3/src/std-scalar-schemas.ts. Only TypeSpec
// stdlib scalar names land here; user-defined scalars walk to their
// baseScalar and pick up @format / @pattern / etc. through applyConstraints.
function stdScalarSchema(name) {
  switch (name) {
    case "bytes": return { type: "string", format: "byte" };
    case "numeric": return { type: "number" };
    case "integer": return { type: "integer" };
    case "int8": return { type: "integer", format: "int8" };
    case "int16": return { type: "integer", format: "int16" };
    case "int32": return { type: "integer", format: "int32" };
    case "int64": return { type: "integer", format: "int64" };
    case "safeint": return { type: "integer", format: "int64" };
    case "uint8": return { type: "integer", format: "uint8" };
    case "uint16": return { type: "integer", format: "uint16" };
    case "uint32": return { type: "integer", format: "uint32" };
    case "uint64": return { type: "integer", format: "uint64" };
    case "float": return { type: "number" };
    case "float64": return { type: "number", format: "double" };
    case "float32": return { type: "number", format: "float" };
    case "decimal": return { type: "number", format: "decimal" };
    case "decimal128": return { type: "number", format: "decimal128" };
    case "string": return { type: "string" };
    case "boolean": return { type: "boolean" };
    case "plainDate": return { type: "string", format: "date" };
    case "utcDateTime":
    case "offsetDateTime": return { type: "string", format: "date-time" };
    case "plainTime": return { type: "string", format: "time" };
    case "duration": return { type: "string", format: "duration" };
    case "url": return { type: "string", format: "uri" };
    default: return undefined;
  }
}

// ── Numeric range helpers ─────────────────────────────────────────────
//
// Ports @typespec/openapi3/src/range.ts. The compiler exposes both a
// numeric-shaped @minValue and a scalar-bound @minValue (used when a
// scalar is constrained directly); JSON Schema can only represent
// numeric bounds, so we pull the JS-serialized value via serializeValueAsJson
// and reject anything non-numeric.

function getMinValueAsJson(program, type) {
  const numericValue = getMinValue(program, type);
  if (numericValue !== undefined) return numericValue;
  const scalarValue = getMinValueForScalar(program, type);
  if (scalarValue === undefined) return undefined;
  const result = serializeValueAsJson(program, scalarValue, type);
  return typeof result === "number" ? result : undefined;
}

function getMaxValueAsJson(program, type) {
  const numericValue = getMaxValue(program, type);
  if (numericValue !== undefined) return numericValue;
  const scalarValue = getMaxValueForScalar(program, type);
  if (scalarValue === undefined) return undefined;
  const result = serializeValueAsJson(program, scalarValue, type);
  return typeof result === "number" ? result : undefined;
}

// ── Nullability ───────────────────────────────────────────────────────
//
// Wrap a non-null schema so it accepts null in the form appropriate for
// the target OpenAPI version. 3.0 used `nullable: true`; 3.1+ uses the
// JSON Schema `anyOf` form, matching @typespec/openapi3's emitter output.

function nullSchema(version) {
  return version === "3.0.0" ? { nullable: true } : { type: "null" };
}

function makeNullable(schema, version) {
  if (version === "3.0.0") return { ...schema, nullable: true };
  return { anyOf: [schema, { type: "null" }] };
}

// ── Stdlib detection ──────────────────────────────────────────────────
//
// program.checker.isStdType is the same call openapi3's util.ts wraps;
// the public `@typespec/compiler` doesn't re-export it, so we bind here.
// Used to skip the redundant `format: url` overwrite the legacy stdlib
// would otherwise inject onto the `url` scalar.

function isStdType(program, type) {
  return program.checker?.isStdType?.(type) ?? false;
}

// ── Constraint application ────────────────────────────────────────────
//
// Mirrors @typespec/openapi3/src/schema-emitter.ts:applyConstraints.
// Each accessor → schema-key pair is applied uniformly, with `undefined`
// short-circuiting. Applied at every type level the official emitter
// applies it (Scalar, ModelProperty, Model, Union, Enum) so that
// constraints declared on a user scalar propagate to properties typed
// against it without requiring a redundant decorator on the property.

function applyConstraint(program, type, fn, schema, key) {
  const value = fn(program, type);
  if (value !== undefined) schema[key] = value;
}

function applyConstraints(program, type, schema) {
  applyConstraint(program, type, getMinLength, schema, "minLength");
  applyConstraint(program, type, getMaxLength, schema, "maxLength");
  applyConstraint(program, type, getMinValueAsJson, schema, "minimum");
  applyConstraint(program, type, getMaxValueAsJson, schema, "maximum");
  applyConstraint(program, type, getPattern, schema, "pattern");
  applyConstraint(program, type, getMinItems, schema, "minItems");
  applyConstraint(program, type, getMaxItems, schema, "maxItems");

  // Exclusive ranges are not in the modern schema-emitter's applyConstraints
  // but the legacy applyIntrinsicDecorators in openapi.ts does handle them;
  // we follow the legacy path so @minValueExclusive isn't silently dropped.
  const minExc = getMinValueExclusive(program, type);
  if (minExc !== undefined) {
    schema.minimum = minExc;
    schema.exclusiveMinimum = true;
  }
  const maxExc = getMaxValueExclusive(program, type);
  if (maxExc !== undefined) {
    schema.maximum = maxExc;
    schema.exclusiveMaximum = true;
  }

  // @secret → format: password (the de-facto convention; the official
  // emitter does the same regardless of OpenAPI version).
  if (isSecret(program, type)) schema.format = "password";

  // @format on stdlib `url` is suppressed by the official emitter because
  // the historical stdlib applied `@format("url")` while JSON Schema /
  // OpenAPI use `format: uri`. Preserve that guard for forward-compat
  // even though current TypeSpec stdlib no longer carries `@format("url")`.
  if (!isStdType(program, type) || type.name !== "url") {
    applyConstraint(program, type, getFormat, schema, "format");
  }

  // @encode contentEncoding — primarily for byte-shaped scalars; stdlib
  // `bytes` already gets `format: byte` from stdScalarSchema, this layers
  // on the contentEncoding when explicit.
  const encode = getEncode(program, type);
  if (encode?.encoding) {
    if (encode.encoding === "base64") schema.format = "byte";
    else if (encode.encoding === "base64url") schema.contentEncoding = "base64url";
  }

  if (getDeprecated(program, type) !== undefined) schema.deprecated = true;
}

// ── External docs + extensions ────────────────────────────────────────
//
// Pass-through for @externalDocs and arbitrary @extension decorators on
// the property/type. Mirrors what the openapi3 schema-emitter does in
// modelPropertyLiteral and #applyExternalDocs.

function applyExternalDocs(program, type, schema) {
  const docs = getExternalDocs(program, type);
  if (docs) schema.externalDocs = docs;
}

function applyExtensions(program, type, schema) {
  const extensions = getExtensions(program, type);
  for (const [key, value] of extensions) schema[key] = value;
}

// ── Examples ──────────────────────────────────────────────────────────
//
// OpenAPI 3.0/3.1 schema objects use singular `example`. The plural
// `examples` map belongs on Media Type Objects, not schemas. Match
// @typespec/openapi3's schema-emitter behavior of emitting just the
// first example via serializeValueAsJson.

function applyExamples(program, type, schema) {
  const examples = getExamples(program, type);
  if (!examples || examples.length === 0) return;
  schema.example = serializeValueAsJson(program, examples[0].value, type);
}

// ── Indexers + sealing ────────────────────────────────────────────────
//
// Mirrors @typespec/openapi3's shouldSealSchema + applyModelIndexer.
// Three cases produce an `additionalProperties` keyword on a model:
//
//   1. Model has a string-keyed indexer (e.g., spread of `Record<T>`):
//      additionalProperties = <T schema>.
//   2. Model has `Record<never>` indexer (explicit "no extras"):
//      additionalProperties = { not: {} }, regardless of the seal option.
//   3. seal-object-schemas option is true AND the model has no indexer
//      AND no derived (non-template) subclasses: additionalProperties =
//      { not: {} }.
//
// We don't emit `allOf` for inherited models (see comment in modelToSchema),
// so the official emitter's "copy down baseModel properties when sealed"
// branch isn't applicable here.

function shouldSealSchema(model, options) {
  if (!model.indexer) {
    if (!options.sealObjectSchemas) return false;
    const derived = model.derivedModels.filter(
      (m) => !isTemplateDeclaration(m) &&
        (m.templateMapper?.args === undefined ||
          m.templateMapper.args?.length === 0 ||
          m.derivedModels.length > 0),
    );
    return derived.length === 0;
  }
  return isNeverType(model.indexer.value);
}

function applyModelIndexer(program, model, schema, seen, options) {
  const sealed = shouldSealSchema(model, options);
  if (!sealed && !model.indexer) return;

  const value = sealed
    ? { not: {} }
    : typeToSchema(program, model.indexer.value, seen, options);

  // Match @typespec/openapi3's per-version dispatch:
  //   3.0   → additionalProperties (Draft 7; schema-emitter.ts:208)
  //   3.1+  → unevaluatedProperties (JSON Schema 2020-12; schema-emitter-3-1.ts:160)
  // unevaluatedProperties is composition-aware (sees across allOf/oneOf
  // subschemas) — irrelevant for our inline-only payloads, but matches
  // the rest of the document's emit and is the keyword OAS 3.1 webhook
  // tooling expects. OAS 3.0 has no `webhooks` root anyway, so the 3.0
  // branch is mostly defensive.
  const key = options.version === "3.0.0" ? "additionalProperties" : "unevaluatedProperties";
  schema[key] = value;
}

// ── Walkers ───────────────────────────────────────────────────────────

function modelToSchema(program, model, seen, options) {
  if (seen.has(model)) return { type: "object" };
  seen.add(model);

  const properties = {};
  const required = [];

  for (const [, prop] of model.properties) {
    if (isDroppedType(program, prop.type)) continue;
    const wireName = resolveEncodedName(program, prop, "application/json") ?? prop.name;
    const propSchema = typeToSchema(program, prop.type, seen, options);

    const doc = getDoc(program, prop);
    if (doc) propSchema.description = doc;

    applyConstraints(program, prop, propSchema);
    applyExternalDocs(program, prop, propSchema);
    applyExtensions(program, prop, propSchema);
    applyExamples(program, prop, propSchema);

    if (isReadonlyProperty(program, prop)) propSchema.readOnly = true;

    // @oneOf on a property converts an existing anyOf into oneOf, matching
    // the openapi3 emitter's modelPropertyLiteral behavior.
    if (getOneOf(program, prop) && propSchema.anyOf) {
      propSchema.oneOf = propSchema.anyOf;
      delete propSchema.anyOf;
    }

    properties[wireName] = propSchema;
    if (!prop.optional) required.push(wireName);
  }

  const result = { type: "object", properties };
  if (required.length > 0) result.required = required;

  applyModelIndexer(program, model, result, seen, options);

  const doc = getDoc(program, model);
  if (doc) result.description = doc;
  applyConstraints(program, model, result);
  applyExternalDocs(program, model, result);
  applyExtensions(program, model, result);
  applyExamples(program, model, result);

  seen.delete(model);
  return result;
}

function typeToSchema(program, type, seen, options) {
  switch (type.kind) {
    case "Scalar": {
      // Match @typespec/openapi3's applyIntrinsicDecorators: apply
      // constraint decorators at every type level so a user scalar like
      // `@format("uuid") scalar uuid extends string;` produces
      // `{ type: string, format: uuid }` even when no decorator sits
      // directly on the property.
      const std = stdScalarSchema(type.name);
      const base = std
        ? std
        : type.baseScalar
          ? typeToSchema(program, type.baseScalar, seen, options)
          : { type: "string" };
      applyConstraints(program, type, base);
      return base;
    }

    case "Intrinsic":
      if (type.name !== "null") return {};
      return nullSchema(options.version);

    case "Union": {
      const variants = [...type.variants.values()].filter(
        (v) => !isDroppedType(program, v.type),
      );
      if (variants.length === 1) return typeToSchema(program, variants[0].type, seen, options);
      const nullVariant = variants.find(
        (v) => v.type.kind === "Intrinsic" && v.type.name === "null",
      );
      const nonNull = variants.filter(
        (v) => !(v.type.kind === "Intrinsic" && v.type.name === "null"),
      );

      // Homogeneous string-literal union → enum.
      if (nonNull.length > 0 && nonNull.every((v) => v.type.kind === "String")) {
        const schema = { type: "string", enum: nonNull.map((v) => v.type.value) };
        return nullVariant ? makeNullable(schema, options.version) : schema;
      }

      // T | null → version-appropriate nullable form.
      if (variants.length === 2 && nullVariant) {
        return makeNullable(
          typeToSchema(program, nonNull[0].type, seen, options),
          options.version,
        );
      }

      const schemas = variants.map((v) => typeToSchema(program, v.type, seen, options));
      return { oneOf: schemas };
    }

    case "String":
      return { type: "string", enum: [type.value] };
    case "Number":
      return { type: "number", enum: [type.value] };
    case "Boolean":
      return { type: "boolean", enum: [type.value] };

    case "Model": {
      // isArrayModelType is the canonical way to detect an array — the
      // alternative (`indexer?.key?.name === "integer"`) is what we used
      // before and what lots of TypeSpec emitter code does inline, but
      // the helper covers edge cases (template instantiations, named
      // `Array<T>` variants) we'd otherwise miss.
      if (isArrayModelType(program, type)) {
        const items = type.indexer?.value
          ? typeToSchema(program, type.indexer.value, seen, options)
          : {};
        return { type: "array", items };
      }
      return modelToSchema(program, type, seen, options);
    }

    case "Enum":
      return {
        type: "string",
        enum: [...type.members.values()].map((m) => m.value ?? m.name),
      };

    default:
      return {};
  }
}

/**
 * Build a fully-inlined JSON Schema for a webhook payload model.
 *
 * @param {import("@typespec/compiler").Program} program
 * @param {import("@typespec/compiler").Model} model
 * @param {{ version: "3.0.0" | "3.1.0" | "3.2.0", sealObjectSchemas: boolean }} options
 */
export function buildPayloadSchema(program, model, options) {
  return modelToSchema(program, model, new Set(), options);
}
