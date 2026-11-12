import "../dist/src/index.js";

using TypeSpec.Reflection;

namespace SignalWire.AsyncAPI;

/** AsyncAPI server config for a service namespace. */
model ServerOptions {
  host: string;
  protocol: string;
  pathname?: string;
  description?: string;
}

/** Declare an AsyncAPI server on the service namespace. */
extern dec server(target: Namespace, name: valueof string, options: valueof ServerOptions);

/**
 * Place an operation on its own AsyncAPI channel. The string is the channel id (camelized,
 * e.g. `calling.dial` -> `callingDial`) and the channel title; the channel address defaults
 * to the root WebSocket connection `/`. Every operation thus becomes its own root-addressed
 * channel — the AsyncAPI 3.0 per-operation-channel idiom. Channel identity only: the protocol
 * `method` constant (if any) lives in the request message payload, authored in the spec.
 */
extern dec channel(target: Operation, method: valueof string);

/**
 * Mark a return-type model as the operation's correlated reply (the AsyncAPI `reply`). Every
 * other model in the return type is treated as a received message on the operation's channel.
 * A model marked `@error` (TypeSpec core) is also treated as a reply (an error response).
 */
extern dec reply(target: Model);

/** Declare HTTP bearer (token) authentication for the service. */
extern dec bearerAuth(target: Namespace, bearerFormat?: valueof string);
