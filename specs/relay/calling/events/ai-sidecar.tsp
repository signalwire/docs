import "@signalwire/typespec-asyncapi";
import "../../common/frames.tsp";
import "@typespec/openapi";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// calling.ai.sidecar (event)
//
// Every sidecar callback is published in real time on the Relay event channel as a
// `calling.ai.sidecar` event (the same payload optionally POSTed to the sidecar's
// `url`). Each event carries the `sidecar_event` envelope below plus type-specific
// fields documented on the SWML ai_sidecar reference (e.g. `insight.raw`,
// `turn.transcript_delta`, `ask_answer.ask_id`, `final.summary`).
// ═════════════════════════════════════════════════════════════════════════════

@doc("The kind of AI sidecar callback.")
union AiSidecarCallbackType {
  "start",
  "turn",
  "request",
  "thought",
  "insight",
  "skip",
  "tool_call",
  "tool_result",
  "action",
  "global_data_change",
  "history_pruned",
  "error",
  "ask_request",
  "ask_answer",
  "stop",
  "final",
}

model AiSidecarEventData {
  @doc("The callback type. Determines which type-specific fields are present.")
  type: AiSidecarCallbackType;

  @doc("When the event was produced, as a Unix timestamp in microseconds.")
  ts: int64;

  @doc("Evaluation id — callbacks produced in the same evaluation share a `tick_id`.")
  tick_id: int64;

  @doc("Call/channel context (`call_id`, plus caller id fields when available).")
  channel_data: Record<unknown>;
}

const callingAiSidecarEvent = "calling.ai.sidecar";
@summary(callingAiSidecarEvent)
@extension("x-fern-display-name", callingAiSidecarEvent)
model AiSidecarEvent is SignalwireEvent<typeof callingAiSidecarEvent, AiSidecarEventData>;
