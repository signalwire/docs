import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

@doc("The parameters you send with `signalwire.receive` to start receiving inbound events for one or more contexts.")
model ReceiveParams {
  @doc("The contexts to start receiving inbound events for.")
  @example(#["office", "support"])
  contexts?: string[];

  @doc("Deprecated — use `contexts` instead. A single context to subscribe to; merged into the contexts list.")
  @example("office")
  context?: string;
}

@doc("The parameters you send with `signalwire.unreceive` to stop receiving inbound events for one or more contexts.")
model UnreceiveParams {
  @doc("The contexts to stop receiving events for.")
  @example(#["office", "support"])
  @minItems(1)
  contexts: string[];
}
