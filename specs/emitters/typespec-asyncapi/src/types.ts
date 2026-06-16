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
  payload: SchemaObject | AsyncAPIRef;
  examples?: Array<{ name?: string; summary?: string; payload: unknown }>;
}

export interface AsyncAPIComponents {
  schemas?: Record<string, SchemaObject>;
  messages?: Record<string, AsyncAPIMessage>;
  securitySchemes?: Record<string, unknown>;
}

export interface AsyncAPIRef {
  $ref: string;
}

export type SchemaObject = Record<string, unknown>;
