import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

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
