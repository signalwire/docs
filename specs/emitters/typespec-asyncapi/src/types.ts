export interface AsyncAPI3Document {
  asyncapi: "3.0.0";
  info: AsyncAPIInfo;
  defaultContentType?: string;
  servers?: Record<string, AsyncAPIServer>;
  channels?: Record<string, AsyncAPIChannel>;
  operations?: Record<string, AsyncAPIOperation>;
  components?: AsyncAPIComponents;
}

export interface AsyncAPIInfo {
  title: string;
  version: string;
  description?: string;
}

export interface AsyncAPIServer {
  host: string;
  protocol: string;
  pathname?: string;
  description?: string;
  variables?: Record<string, { default?: string; enum?: string[]; description?: string }>;
  security?: AsyncAPIRef[];
  bindings?: Record<string, unknown>;
}

export interface AsyncAPIChannel {
  address: string | null;
  title?: string;
  description?: string;
  servers?: AsyncAPIRef[];
  messages?: Record<string, AsyncAPIRef>;
  bindings?: Record<string, unknown>;
}

export interface AsyncAPIOperation {
  action: "send" | "receive";
  channel: AsyncAPIRef;
  title?: string;
  summary?: string;
  description?: string;
  messages?: AsyncAPIRef[];
  reply?: { channel: AsyncAPIRef; messages: AsyncAPIRef[] };
  bindings?: Record<string, unknown>;
}

export interface AsyncAPIMessage {
  name?: string;
  title?: string;
  summary?: string;
  contentType?: string;
  correlationId?: { description?: string; location: string };
  payload: SchemaOrRef;
  examples?: Array<{ name?: string; summary?: string; payload: unknown }>;
}

export interface AsyncAPIComponents {
  schemas?: Record<string, AsyncAPISchema>;
  messages?: Record<string, AsyncAPIMessage>;
  securitySchemes?: Record<string, unknown>;
}

export interface AsyncAPIRef {
  $ref: string;
}

/**
 * An AsyncAPI 3.0 Schema Object — a JSON-Schema Draft-07 superset. Note the
 * dialect: `exclusiveMinimum`/`exclusiveMaximum` are NUMBERS (not booleans as in
 * OpenAPI 3.0), `discriminator` is a STRING (the property name, not an object),
 * and there is no `nullable`. This is why we don't reuse `@typespec/openapi3`'s
 * `OpenAPI3Schema` type — it models a different dialect.
 */
export interface AsyncAPISchema {
  type?: string | string[];
  format?: string;
  description?: string;
  default?: unknown;
  examples?: unknown[];
  enum?: unknown[];
  const?: unknown;
  deprecated?: boolean;
  // numeric
  minimum?: number;
  maximum?: number;
  exclusiveMinimum?: number;
  exclusiveMaximum?: number;
  // string
  minLength?: number;
  maxLength?: number;
  pattern?: string;
  // array
  minItems?: number;
  maxItems?: number;
  items?: SchemaOrRef;
  // object
  properties?: Record<string, SchemaOrRef>;
  required?: string[];
  additionalProperties?: boolean | SchemaOrRef;
  // composition / polymorphism (AsyncAPI discriminator is the property NAME string)
  allOf?: SchemaOrRef[];
  oneOf?: SchemaOrRef[];
  anyOf?: SchemaOrRef[];
  not?: SchemaOrRef;
  discriminator?: string;
}

/** Either an inline schema or a `$ref` to a component schema. */
export type SchemaOrRef = AsyncAPISchema | AsyncAPIRef;
