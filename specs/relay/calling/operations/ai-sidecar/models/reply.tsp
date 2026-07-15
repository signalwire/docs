import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI sidecar result")
@doc("Acknowledgement that the sidecar request was accepted (`message` is `+OK`).")
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
@doc("""
  Snapshot of the sidecar's status. The activity counters are returned in `message`
  as a `+OK`-prefixed line: running, ticks, insights, skips, tools, errors,
  in_tokens, out_tokens, history_size, and event_log_bytes.
  """)
model AiSidecarStatusResult {
  ...RelayResultWithCall<"+OK">;
}
