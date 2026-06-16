import { stringify } from "yaml";
import { AsyncAPI3Document } from "./types.js";

const TOP_ORDER = [
  "asyncapi",
  "info",
  "defaultContentType",
  "servers",
  "channels",
  "operations",
  "components",
];

function orderKeys<T extends Record<string, unknown>>(obj: T, order: string[]): T {
  const out: Record<string, unknown> = {};
  for (const k of order) if (k in obj) out[k] = obj[k];
  for (const k of Object.keys(obj)) if (!(k in out)) out[k] = obj[k];
  return out as T;
}

export function serialize(doc: AsyncAPI3Document): string {
  return stringify(orderKeys(doc as unknown as Record<string, unknown>, TOP_ORDER), {
    lineWidth: 0,
  });
}
