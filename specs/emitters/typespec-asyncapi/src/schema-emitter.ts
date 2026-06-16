import {
  getDiscriminator,
  getDoc,
  Model,
  ModelProperty,
  Program,
  Scalar,
  Type,
} from "@typespec/compiler";
import { SchemaObject } from "./types.js";

/** Resolve a (possibly named) type to a schema — a `$ref` for named models/unions, inline otherwise. */
export type RefFn = (type: Type) => SchemaObject;

const SCALAR_MAP: Record<string, SchemaObject> = {
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

function scalarSchema(scalar: Scalar): SchemaObject {
  let s: Scalar | undefined = scalar;
  while (s) {
    if (SCALAR_MAP[s.name]) return { ...SCALAR_MAP[s.name] };
    s = s.baseScalar;
  }
  return { type: "string" };
}

/** True for types that should be emitted as a named component and `$ref`'d. */
function isRefworthy(t: Type): boolean {
  if (t.kind === "Model" && !!t.name && t.name !== "Array" && t.name !== "Record" && !(t as Model).indexer) {
    return true;
  }
  if (t.kind === "Union" && !!t.name) return true;
  return false;
}

/** Schema for a property/element type: `$ref` if named, inline otherwise. */
function schemaForType(program: Program, t: Type, ref: RefFn): SchemaObject {
  return isRefworthy(t) ? ref(t) : typeToSchema(program, t, ref);
}

/** Build an inline object schema from a model's OWN properties. */
function ownObjectSchema(program: Program, model: Model, ref: RefFn): SchemaObject {
  const properties: Record<string, SchemaObject> = {};
  const required: string[] = [];
  for (const [name, prop] of model.properties as Map<string, ModelProperty>) {
    let s = schemaForType(program, prop.type, ref);
    const doc = getDoc(program, prop);
    if (doc) s = { ...s, description: doc };
    properties[name] = s;
    if (!prop.optional) required.push(name);
  }
  const schema: SchemaObject = { type: "object", properties };
  if (required.length) schema.required = required;
  const doc = getDoc(program, model);
  if (doc) schema.description = doc;
  return schema;
}

function unionInline(program: Program, union: { variants: Map<string | symbol, { type: Type }> }, ref: RefFn): SchemaObject {
  const variants = [...union.variants.values()].map((v) => v.type);
  if (variants.length && variants.every((v) => v.kind === "String")) {
    return { type: "string", enum: variants.map((v: any) => v.value) };
  }
  return { oneOf: variants.map((v) => schemaForType(program, v, ref)) };
}

/** Build an inline schema for a type. Named property/element types are delegated to `ref`. */
export function typeToSchema(program: Program, type: Type, ref: RefFn): SchemaObject {
  switch (type.kind) {
    case "Scalar":
      return scalarSchema(type);
    case "String":
      return { type: "string", enum: [type.value] };
    case "Number":
      return { type: "number", enum: [type.value] };
    case "Boolean":
      return { type: "boolean", enum: [type.value] };
    case "Model": {
      const m = type as Model;
      if (m.name === "Array" && m.indexer) {
        return { type: "array", items: schemaForType(program, m.indexer.value, ref) };
      }
      if (m.name === "Record" && m.indexer) {
        return { type: "object", additionalProperties: schemaForType(program, m.indexer.value, ref) };
      }
      return ownObjectSchema(program, m, ref);
    }
    case "Union":
      return unionInline(program, type as any, ref);
    case "Enum":
      return { type: "string", enum: [...type.members.values()].map((mem) => mem.value ?? mem.name) };
    case "EnumMember":
      return { type: "string", enum: [type.value ?? type.name] };
    default:
      return {};
  }
}

export interface SchemaRegistry {
  schemas: Record<string, SchemaObject>;
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
  const schemas: Record<string, SchemaObject> = {};

  function refFor(t: Type): SchemaObject {
    if (t.kind === "Model" && !!t.name && t.name !== "Array" && t.name !== "Record" && !(t as Model).indexer) {
      registerModel(t as Model);
      return { $ref: `#/components/schemas/${t.name}` };
    }
    if (t.kind === "Union" && !!t.name) {
      if (!schemas[t.name]) schemas[t.name] = unionInline(program, t as any, refFor);
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
      base.properties = (base.properties as Record<string, SchemaObject>) ?? {};
      (base.properties as Record<string, SchemaObject>)[disc.propertyName] ??= { type: "string" };
      base.discriminator = disc.propertyName;
      base.required = Array.from(new Set([...((base.required as string[]) ?? []), disc.propertyName]));
      schemas[name] = base;
      for (const derived of model.derivedModels) refFor(derived);
      return;
    }

    if (model.baseModel) {
      const baseRef = refFor(model.baseModel);
      const own = ownObjectSchema(program, model, refFor);
      const baseDisc = getDiscriminator(program, model.baseModel)?.propertyName;
      const props = own.properties as Record<string, SchemaObject> | undefined;
      if (baseDisc && props?.[baseDisc]?.enum && (props[baseDisc].enum as unknown[]).length === 1) {
        props[baseDisc] = { type: "string", const: (props[baseDisc].enum as unknown[])[0] };
      }
      schemas[name] = { allOf: [baseRef, own] };
      return;
    }

    schemas[name] = ownObjectSchema(program, model, refFor);
  }

  return { schemas, refFor };
}
