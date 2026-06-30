import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AiSidecarResult {
  ...RelayResult;
}

model AiSidecarAskResult {
  ...RelayResult;

  @doc("""
    Identifier for this one-off question. The answer arrives later as a
    `calling.ai.sidecar` event with `type: ask_answer` carrying the same `ask_id`.
    """)
  ask_id?: string;
}

model AiSidecarStatusResult {
  ...RelayResult;
}
