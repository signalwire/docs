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
  @example("ask_answer")
  type: AiSidecarCallbackType;

  @doc("When the event was produced, as a Unix timestamp in microseconds.")
  @example(1718000123000000)
  ts: int64;

  @doc("Evaluation id — callbacks produced in the same evaluation share a `tick_id`.")
  @example(42)
  tick_id: int64;

  @doc("Call/channel context (`call_id`, plus caller id fields when available).")
  channel_data: Record<unknown>;

  @doc("Present when `type: ask_answer`; correlates this `ask_answer` event with the originating `ai_sidecar.ask`, matching the `ask_id` returned by `calling.ai_sidecar.ask`.")
  @example("a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  ask_id?: string;
}

const callingAiSidecarEvent = "calling.ai.sidecar";
@summary(callingAiSidecarEvent)
@extension("x-fern-display-name", callingAiSidecarEvent)
model AiSidecarEvent is SignalwireEvent<typeof callingAiSidecarEvent, AiSidecarEventData>;
