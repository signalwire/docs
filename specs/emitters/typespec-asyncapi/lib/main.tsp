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

/** Declare the AsyncAPI channel id for a service. */
extern dec channel(target: Namespace, id: valueof string);

/** Emit one channel per @rpcMethod command in this service (instead of one channel for the whole service). Events stay on the @channel-named channel. */
extern dec channelPerCommand(target: Namespace);

/** Mark an operation as a JSON-RPC method with the given wire name. */
extern dec rpcMethod(target: Operation, name: valueof string);

/** Mark a model as a server-pushed event delivered via signalwire.event. */
extern dec event(target: Model, eventType: valueof string);

/** Declare HTTP bearer (token) authentication for the service. */
extern dec bearerAuth(target: Namespace, bearerFormat?: valueof string);
