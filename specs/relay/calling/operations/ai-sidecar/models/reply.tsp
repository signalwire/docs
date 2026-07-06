import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AiSidecarResult {
  ...RelayResult<"+OK">;
}

model AiSidecarAskResult {
  ...RelayResult<"queued">;

  @doc("""
    Identifier for this one-off question. The answer arrives later as a
    `calling.ai.sidecar` event with `type: ask_answer` carrying the same `ask_id`.
    """)
  @example("a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  ask_id?: string;
}

model AiSidecarStatusResult {
  ...RelayResult<"+OK">;
}
