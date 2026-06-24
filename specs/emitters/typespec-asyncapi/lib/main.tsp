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
 * Mark an operation as a JSON-RPC method and place it on its own AsyncAPI channel.
 * The string is the wire `method` constant in the request/response frames, the channel id
 * (camelized, e.g. `calling.dial` -> `callingDial`), and the channel title. The channel
 * address defaults to the root WebSocket connection `/`. Every operation thus becomes its
 * own root-addressed channel — the AsyncAPI 3.0 per-operation-channel idiom.
 */
extern dec channel(target: Operation, method: valueof string);

/** Mark a model as a server-pushed event delivered via signalwire.event. */
extern dec event(target: Model, eventType: valueof string);

/**
 * Events that may be received during EVERY operation on this channel (e.g. call-lifecycle
 * events like call.state). Each is merged into every command's receive union, so it is
 * documented on each operation page without per-method repetition.
 */
extern dec globalEvents(target: Namespace, ...events: Model[]);

/** Declare HTTP bearer (token) authentication for the service. */
extern dec bearerAuth(target: Namespace, bearerFormat?: valueof string);
