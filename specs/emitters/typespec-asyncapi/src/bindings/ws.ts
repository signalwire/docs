import { AsyncAPI3Document } from "../types.js";

/** Attach minimal WebSocket bindings when the server protocol is ws/wss. */
export function applyWebSocketBindings(
  doc: AsyncAPI3Document,
  serverName: string,
  channelId: string,
): void {
  const server = doc.servers?.[serverName];
  if (!server || (server.protocol !== "ws" && server.protocol !== "wss")) return;
  server.bindings = { ...(server.bindings ?? {}), ws: {} };
  const channel = doc.channels?.[channelId];
  if (channel) channel.bindings = { ...(channel.bindings ?? {}), ws: {} };
}
