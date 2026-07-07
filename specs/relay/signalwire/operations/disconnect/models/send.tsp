import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

@doc("The parameters delivered with the `signalwire.disconnect` request the service sends you.")
model DisconnectParams {
  @doc("When `true`, you should open a fresh connection after disconnecting.")
  @example(true)
  restart?: boolean;
}
