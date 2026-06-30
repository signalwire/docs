import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

model ReceiveParams {
  @doc("The contexts to start receiving inbound events for.")
  contexts?: string[];
}

model UnreceiveParams {
  @doc("The contexts to stop receiving events for.")
  contexts: string[];
}
