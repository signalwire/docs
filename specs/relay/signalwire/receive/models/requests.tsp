import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

model ReceiveParams {
  /** The contexts to start receiving inbound events for. */
  contexts?: string[];
}

model UnreceiveParams {
  /** The contexts to stop receiving events for. */
  contexts: string[];
}
