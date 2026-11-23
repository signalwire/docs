import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI sidecar result")
@doc("""
  Acknowledgement of a `calling.ai_sidecar` request. `message` is the raw status
  line: `"+OK started\\n"` when a sidecar was attached, or `"+OK summarizing\\n"`
  when `action.summarize` was sent. On failure `code` is `"400"` and `message`
  carries the error text, e.g. `"-ERR: lang is required\\n"`.
  """)
model AiSidecarResult {
  ...RelayResultWithCall<"+OK started\n">;
}

@summary("AI sidecar poke result")
@doc("""
  Acknowledgement of a poke. `message` is the raw status line (`"+OK poked\\n"`).
  Without a running sidecar, `code` is `"400"` with `"-ERR: no sidecar attached\\n"`.
  """)
model AiSidecarPokeResult {
  ...RelayResultWithCall<"+OK poked\n">;
}

@summary("AI sidecar stop result")
@doc("""
  Acknowledgement that the sidecar was stopped. `message` is the raw status line
  (`"+OK stopped\\n"`). Without a running sidecar, `code` is `"400"` with
  `"-ERR: no sidecar attached\\n"`.
  """)
model AiSidecarStopResult {
  ...RelayResultWithCall<"+OK stopped\n">;
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
  as a single `+OK` line of `key=value` pairs, in this order: `running`, `ticks`,
  `insights`, `skips`, `tools`, `errors`, `in_tokens`, `out_tokens`,
  `history_size`, and `event_log_bytes`.
  """)
model AiSidecarStatusResult {
  ...RelayResultWithCall<"+OK running=1 ticks=12 insights=3 skips=8 tools=1 errors=0 in_tokens=5120 out_tokens=640 history_size=24 event_log_bytes=18432\n">;
}
