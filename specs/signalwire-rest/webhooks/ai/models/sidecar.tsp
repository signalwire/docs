import "./common.tsp";

namespace SignalWireAPI.Webhooks.AI;

@doc("""
  The kind of AI sidecar callback. See the
  [SWML ai_sidecar reference](/docs/swml/reference/calling/ai-sidecar#callback-types)
  for the type-specific fields each one carries.
  """)
enum AISidecarCallbackType {
  @doc("The sidecar attached to the call.")
  start,

  @doc("The customer finished a turn and an evaluation is about to run.")
  turn,

  @doc("The sidecar called the model.")
  request,

  @doc("The model produced intermediate reasoning text.")
  thought,

  @doc("The sidecar's advice for the agent.")
  insight,

  @doc("The model called the built-in `sidecar_skip` tool to stay silent for this turn.")
  skip,

  @doc("The model called one of your tools.")
  tool_call,

  @doc("One of your tools returned a result.")
  tool_result,

  @doc("A SWAIG action was returned (and, if enabled, executed).")
  action,

  @doc("A `set_global_data` / `unset_global_data` action changed `global_data`.")
  global_data_change,

  @doc("The conversation history was trimmed to fit the token budget.")
  history_pruned,

  @doc("Something failed, or an anti-loop guard tripped.")
  error,

  @doc("An `ai_sidecar.ask` was queued. Carries the `ask_id`.")
  ask_request,

  @doc("The answer to an `ai_sidecar.ask`. Carries the matching `ask_id`.")
  ask_answer,

  @doc("The sidecar is shutting down.")
  stop,

  @doc("The last callback before the sidecar stops — a full snapshot of the session.")
  final,
}

@doc("Identifies the call a sidecar callback came from. Each field is included when the call has it.")
model AISidecarChannelData {
  @doc("ID of the call the sidecar is attached to.")
  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
  call_id?: string;

  @doc("The caller's name.")
  @example("Jane Doe")
  caller_id_name?: string;

  @doc("The caller's number.")
  @example("+15555550100")
  caller_id_number?: string;

  @doc("The number that was called.")
  @example("+15555550199")
  destination_number?: string;
}

@doc("""
  One sidecar callback. Every event carries the four fields below; `type` decides what else comes
  with it, so read `type` first and expect properties beyond these.
  """)
model AISidecarEvent is Record<unknown> {
  @doc("The callback type.")
  @example(AISidecarCallbackType.insight)
  type: AISidecarCallbackType;

  @doc("When the event was produced, as a Unix timestamp in microseconds.")
  @example(1745870400123456)
  ts: int64;

  @doc("Identifies the evaluation this callback came from. Callbacks produced in the same evaluation share a `tick_id`.")
  @example(7)
  tick_id: int64;

  @doc("Identifies the call the event came from.")
  channel_data: AISidecarChannelData;
}

model AISidecarCallbackPayload {
  @doc("Envelope describing the call. `project_id` and `space_id` are included when available.")
  call_info: AICallInfo;

  @doc("The sidecar callback.")
  sidecar_event: AISidecarEvent;
}

model AISidecarSwaigToolWebhookPayload {
  @doc("The name of the function the model is calling.")
  @example("lookup_competitor")
  function: string;

  @doc("The arguments the model passed to your function.")
  argument: {
    @doc("The arguments parsed into objects. Usually a single-element array.")
    @example(#[#{ competitor: "ACME" }])
    parsed: Record<unknown>[];

    @doc("The raw argument string, exactly as the model produced it.")
    @example("{\"competitor\":\"ACME\"}")
    raw: string;

    @doc("""
      Any text that surrounded the JSON, with the JSON itself removed. Omitted when the whole
      argument was JSON, which is the usual case.
      """)
    @example("")
    substituted?: string;
  };

  @doc("The ID of the call the sidecar is attached to.")
  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
  call_id?: string;

  @doc("The sidecar's current `global_data`. Present when the sidecar has any.")
  global_data?: Record<unknown>;

  @doc("Identifies the call the sidecar is attached to.")
  channel_data: AISidecarChannelData;
}
