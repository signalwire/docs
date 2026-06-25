import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AiSidecarResult {
  ...RelayResult;

  @doc("Echo of the call id.")
  call_id?: string;
}

model AiSidecarAskResult {
  ...RelayResult;

  @doc("Echo of the call id.")
  call_id?: string;

  @doc("""
    Identifier for this one-off question. The answer arrives later as a
    `calling.ai.sidecar` event with `type: ask_answer` carrying the same `ask_id`.
    """)
  ask_id?: string;
}

model AiSidecarStatusResult {
  ...RelayResult;

  @doc("""
    Echo of the call id. The status snapshot itself is returned in `message` as a
    single `+OK` line of `key=value` activity counters (`running`, `ticks`,
    `insights`, `skips`, `tools`, `errors`, `in_tokens`, `out_tokens`,
    `history_size`, `event_log_bytes`) rather than a structured object.
    """)
  call_id?: string;
}
