import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

model ReceiveParams {
  @doc("The contexts to start receiving inbound events for.")
  @example(#["office", "support"])
  contexts?: string[];

  @doc("Deprecated — use `contexts` instead. A single context to subscribe to; merged into the contexts list.")
  @example("office")
  context?: string;
}

model UnreceiveParams {
  @doc("The contexts to stop receiving events for.")
  @example(#["office", "support"])
  @minItems(1)
  contexts: string[];
}
