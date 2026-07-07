import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

@doc("The parameters you send with `signalwire.disconnect`.")
model DisconnectParams {
  @doc("When `true`, you should open a fresh connection after disconnecting.")
  @example(true)
  restart?: boolean;
}
