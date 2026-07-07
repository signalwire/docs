import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI sidecar result")
@doc("Confirmation that the AI sidecar was attached.")
model AiSidecarResult {
  ...RelayResultWithCall<"+OK">;
}

@summary("AI sidecar ask result")
model AiSidecarAskResult {
  ...RelayResultWithCall<"queued">;

  @doc("""
    Identifier for this one-off question. The answer arrives later as a
    `calling.ai.sidecar` event with `type: ask_answer` carrying the same `ask_id`.
    """)
  @example("a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  ask_id?: string;
}

@summary("AI sidecar status result")
@doc("Snapshot of the sidecar's status.")
model AiSidecarStatusResult {
  ...RelayResultWithCall<"+OK">;
}
