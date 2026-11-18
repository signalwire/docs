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

  This is a real-time debug/observability stream: it surfaces the sidecar's internal activity —
  model reasoning, tool calls and their results, history pruning, and an end-of-session rollup.
  Treat its exact shape as unstable: individual `type` variants may carry additional fields, and
  the set of fields can change between releases.
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

  @doc("""
    Matches the `ask_id` returned by `calling.ai_sidecar.ask`, correlating this
    callback with the question you sent. Present on `ask_request` and `ask_answer`,
    and on `request`, `thought`, `tool_call`, and `tool_result` callbacks produced
    while answering an ask.
    """)
  @example("a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  ask_id?: string;

  @doc("The raw insight or answer text. Present on `type: insight` and on `type: ask_answer` (the reply to your `calling.ai_sidecar.ask`).")
  @example("The customer's account is past due by 14 days.")
  raw?: string;

  @doc("The end-of-session summary text. Present on `type: final` when a summary was generated.")
  @example("Handled a billing dispute; the account is past due by 14 days and a callback was scheduled for Friday.")
  summary?: string;

  @doc("The reasoning text on `type: thought`, or the text the sidecar would have spoken on an `action` callback for a `say` action.")
  text?: string;

  @doc("The tool (function) name. Present on `type: tool_call` and `tool_result`.")
  name?: string;

  @doc("The tool-call arguments, delivered as a raw JSON string. Present on `type: tool_call`.")
  @example("{\"order_id\": \"A123\"}")
  arguments?: string;

  @doc("The tool-call response, delivered as a raw JSON string. Present on `type: tool_result`.")
  @example("{\"status\": \"ok\"}")
  response?: string;

  @doc("Why the sidecar took no action this pass (`type: skip`), or why a `say` action was not spoken (`type: action`).")
  reason?: string;

  @doc("A machine-readable error reason. Present on `type: error`.")
  error_reason?: string;

  @doc("Human-readable error detail. Present on some `type: error` callbacks.")
  detail?: string;

  @doc("The SWAIG function whose webhook failed. Present on `type: error` for webhook failures.")
  function?: string;

  @doc("HTTP status of the failed webhook request. Present on `type: error` for webhook failures.")
  http_code?: int32;

  @doc("Transport error code of the failed webhook request. Present on `type: error` for webhook failures.")
  curl_code?: int32;

  @doc("How many malformed tool calls were dropped. Present on `type: error` with `error_reason: malformed_tool_call`.")
  stripped?: int32;

  @doc("How many history entries were dropped. Present on `type: history_pruned`.")
  dropped_count?: int32;

  @doc("How many history entries were kept after pruning. Present on `type: history_pruned`.")
  kept_count?: int32;

  @doc("Token count before pruning. Present on `type: history_pruned`.")
  tokens_before?: int32;

  @doc("Token count after pruning. Present on `type: history_pruned`.")
  tokens_after?: int32;

  @doc("The current iteration. Present on the `request`, `thought`, `tool_call`, `tool_result`, `insight`, and `ask_answer` callbacks.")
  iter?: int32;

  @doc("The total iterations. Present on the `insight` and `ask_answer` callbacks.")
  total_iters?: int32;

  @doc("""
    `ask` when the callback was produced while answering a
    `calling.ai_sidecar.ask` question. Present on `ask_answer`, and on `request`,
    `thought`, `tool_call`, and `tool_result` callbacks produced by an ask.
    """)
  @example("ask")
  triggered_by?: string;

  @doc("The model in use. Present on `type: start`, `request`, and `final`.")
  @example("gpt-4o-mini")
  `model`?: string;

  @doc("The session's global data. Present on `type: start` and `final`.")
  global_data?: Record<unknown>;

  @doc("Names of the SWAIG functions available to the sidecar. Present on `type: start`.")
  tools?: string[];

  @doc("The new transcript text since the previous turn. Present on `type: turn`.")
  transcript_delta?: string;

  @doc("The customer's text for this turn. Present on `type: turn`.")
  customer_text?: string;

  @doc("The agent's text for this turn. Present on `type: turn`.")
  agent_text?: string;

  @doc("Number of messages sent to the model. Present on `type: request`.")
  messages_count?: int32;

  @doc("Token count of the messages sent to the model. Present on `type: request`.")
  messages_token_count?: int32;

  @doc("The tool-choice mode sent to the model. Present on `type: request`.")
  @example("auto")
  tool_choice?: string;

  @doc("The SWAIG action item. Present on `type: action`.")
  action?: unknown;

  @doc("The SWAIG function that returned the action. Present on `type: action` when known.")
  source_function?: string;

  @doc("Whether the action was applied to the call. Present on `type: action`.")
  executed?: boolean;

  @doc("Whether the text was spoken. Present (and `false`) on `type: action` for a `say` action.")
  spoken?: boolean;

  @doc("The global-data key that changed. Present on `type: global_data_change`.")
  key?: string;

  @doc("The key's previous value. Present on `type: global_data_change` when the key existed.")
  old_value?: unknown;

  @doc("The key's new value. Present on `type: global_data_change`.")
  new_value?: unknown;

  @doc("The question you sent. Present on `type: ask_request`.")
  question?: string;

  @doc("Why the session ended. Present on `type: stop` and `final`.")
  stop_reason?: string;

  @doc("The sidecar's conversation history. Present on `type: final`.")
  history?: unknown[];

  @doc("The call transcript. Present on `type: final`.")
  transcript?: unknown[];

  @doc("The session's event log. Present on `type: final`.")
  event_log?: unknown[];

  @doc("Session counters (ticks, insights, skips, tool calls, errors, tokens). Present on `type: final`.")
  stats?: Record<unknown>;

  @doc("Detailed session telemetry. Present on `type: final`.")
  metrics?: Record<unknown>;

  @doc("When the session started, as a Unix timestamp in microseconds. Present on `type: final`.")
  started_at?: int64;

  @doc("When the session ended, as a Unix timestamp in microseconds. Present on `type: final`.")
  ended_at?: int64;

  @doc("Session duration in milliseconds. Present on `type: final`.")
  duration_ms?: int64;
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
