import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "../../../models/core.tsp";
import "../../../events/shared.tsp";
import "@typespec/openapi";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@summary("AI sidecar callback type")
@doc("""
  The kind of AI sidecar callback. Each value signals a different moment in the
  sidecar's observation of the call, and determines which type-specific fields the
  event carries:
  
  - `start` — the sidecar session has started.
  - `turn` — a conversation turn was processed.
  - `request` — a request was sent to the model.
  - `thought` — a reasoning step from the sidecar.
  - `insight` — an observation the sidecar surfaced about the conversation.
  - `skip` — the sidecar had nothing to add on this pass and took no action.
  - `tool_call` — the sidecar invoked a tool (function) call.
  - `tool_result` — the result returned from a tool call.
  - `action` — an action the sidecar performed.
  - `global_data_change` — the session's global data was updated.
  - `history_pruned` — older conversation history was trimmed to stay within limits.
  - `error` — an error occurred.
  - `ask_request` — a one-off question you sent via `calling.ai_sidecar.ask` was received.
  - `ask_answer` — the answer to one of your `ask` questions (carries `ask_id`).
  - `stop` — the sidecar session has stopped.
  - `final` — the end-of-session summary.
  """)
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

@summary("AI sidecar event body")
@doc("""
  The sidecar event, carried on the wire under `sidecar_event`. Beyond the common fields, each
  `type` adds its own type-specific fields — the optional fields below indicate which type they
  belong to.
  """)
model AiSidecarEventBody {
  @doc("The callback type. Determines which type-specific fields are present.")
  @example("ask_answer")
  type: AiSidecarCallbackType;

  @doc("When the event was produced, as a Unix timestamp in microseconds.")
  @example(1718000123000000)
  ts: int64;

  @doc("Groups callbacks that the sidecar produced together in one processing pass — callbacks from the same pass share a `tick_id`.")
  @example(42)
  tick_id: int64;

  @doc("Call/channel context (`call_id`, plus caller id fields when available).")
  channel_data: Record<unknown>;

  @doc("Present when `type: ask_answer`. Matches the `ask_id` returned by `calling.ai_sidecar.ask`, correlating this answer with the question you sent.")
  @example("a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  ask_id?: string;

  @doc("The answer/summary text. Present on `type: ask_answer` (the reply to your `calling.ai_sidecar.ask`) and on the `final` summary event.")
  @example("The customer's account is past due by 14 days.")
  raw?: string;

  @doc("The reasoning text. Present on `type: thought`.")
  text?: string;

  @doc("The tool (function) name. Present on `type: tool_call` and `tool_result`.")
  name?: string;

  @doc("The tool-call arguments. Present on `type: tool_call`.")
  arguments?: Record<unknown>;

  @doc("The tool-call response. Present on `type: tool_result`.")
  response?: Record<unknown>;

  @doc("Why the sidecar took no action this pass. Present on `type: skip`.")
  reason?: string;

  @doc("A machine-readable error reason. Present on `type: error`.")
  error_reason?: string;

  @doc("Human-readable error detail. Present on `type: error`.")
  detail?: string;

  @doc("How many history entries were dropped. Present on `type: history_pruned`.")
  dropped_count?: int32;

  @doc("Token count before pruning. Present on `type: history_pruned`.")
  tokens_before?: int32;

  @doc("Token count after pruning. Present on `type: history_pruned`.")
  tokens_after?: int32;

  @doc("The current iteration. Present on `ask`/`insight`/`final` callbacks.")
  iter?: int32;

  @doc("The total iterations. Present on `ask`/`insight`/`final` callbacks.")
  total_iters?: int32;

  @doc("What triggered this callback. Present on `ask`/`insight`/`final` callbacks.")
  triggered_by?: string;
}

@summary("AI sidecar event")
model AiSidecarEventData {
  ...CallEventAddress;

  @doc("Call/session context for this delivery.")
  call_info: AiCallInfo;

  @doc("The sidecar event. Its `type` field determines which type-specific fields it carries.")
  sidecar_event: AiSidecarEventBody;
}

const callingAiSidecarEvent = "calling.ai.sidecar";
@summary(callingAiSidecarEvent)
@extension("x-fern-display-name", callingAiSidecarEvent)
model AiSidecarEvent
  is SignalwireEvent<typeof callingAiSidecarEvent, AiSidecarEventData>;
