import "../../../../_shared/webhook/decorator.tsp";
import "../../../types";

namespace SignalWireAPI.Calling;

@summary("Transcript status callback")
@doc("""
  Sent to your `status_url` when the call's transcription is ready.
  `calling.transcript.completed` includes the transcribed text;
  `calling.transcript.failed` means the call could not be transcribed.

  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
model TranscribeStatusCallbackPayload {
  @doc("Whether the transcription completed or failed.")
  @example("calling.transcript.completed")
  event_type: "calling.transcript.completed" | "calling.transcript.failed";

  @doc("When the event was sent, as a Unix timestamp in seconds.")
  @example(1777565701.5623918)
  timestamp: float;

  @doc("Your project ID.")
  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
  project_id: uuid;

  @doc("Your Space ID.")
  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
  space_id: uuid;

  @doc("The transcript.")
  params: {
    @doc("Unique ID for this transcript.")
    @example("0ec5a4da-46b9-4d2c-b724-151add8d4d08")
    id: uuid;

    @doc("ID of the call that was transcribed.")
    @example("2e1e66e5-5d07-413d-9668-55542992eec0")
    call_id: uuid;

    @doc("ID of the call leg that was transcribed.")
    @example("2e1e66e5-5d07-413d-9668-55542992eec0")
    segment_id: uuid;

    @doc("The transcribed text of the call. Omitted when there is no transcribed text.")
    @example("A long time ago in a galaxy far, far away, Luke, I am your father. Do or do not, there is no try. May the force be with you. These aren't the droids you're looking for. I find your lack of faith disturbing. The force will be with you always.")
    text?: string;
  };
}

@summary("Stream status callback")
@doc("""
  Sent to your `status_url` when a background audio stream started with
  `calling.stream` changes state. `params.state` is `streaming` when the stream
  starts and `finished` when it ends.

  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
  """)
model StreamStatusCallbackPayload {
  @doc("The type of event. Always `calling.call.stream` for stream status callbacks.")
  @example("calling.call.stream")
  event_type: "calling.call.stream";

  @doc("The channel the event was delivered on.")
  @example("swml:451ed9ff-e568-4222-8af9-4f9ab7428d09")
  event_channel: string;

  @doc("When the event was sent, as a Unix timestamp in seconds.")
  @example(1777565701.5623918)
  timestamp: float;

  @doc("Your project ID.")
  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
  project_id: uuid;

  @doc("Your Space ID.")
  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
  space_id: uuid;

  @doc("Details about the stream.")
  params: {
    @doc("ID of the call being streamed.")
    @example("2e1e66e5-5d07-413d-9668-55542992eec0")
    call_id: uuid;

    @doc("ID of the node the call is on.")
    @example("a0d4e6e5-5d07-413d-9668-55542992eec0")
    node_id: uuid;

    @doc("ID of the call segment being streamed.")
    @example("2e1e66e5-5d07-413d-9668-55542992eec0")
    segment_id: uuid;

    @doc("The tag associated with the call. Present only when a tag was set on the call.")
    @example("my-tag")
    tag?: string;

    @doc("The control ID used to control the stream, as set in `calling.stream`.")
    @example("stream-control-1")
    control_id: string;

    @doc("The stream state. `streaming` when the stream starts, `finished` when it ends.")
    @example("streaming")
    state: "streaming" | "finished";

    @doc("The WebSocket URL the audio is being streamed to.")
    @example("wss://example.com/stream")
    url: string;

    @doc("The friendly name of the stream. Present when a `name` was set on the stream.")
    @example("customer-support-recording")
    name?: string;
  };
}

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

@doc("""
  Identifies the call an AI callback came from. `project_id` and `space_id` are included when
  available.
  """)
model AICallInfo {
  @doc("Your project ID.")
  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
  project_id?: uuid;

  @doc("Your Space ID.")
  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
  space_id?: uuid;

  @doc("ID of the call.")
  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
  call_id: uuid;

  @doc("The content type of the POST body. Always `text/json`.")
  @example("text/json")
  content_type: string;

  @doc("How the body is delivered. Always `post_data`.")
  @example("post_data")
  content_disposition: string;

  @doc("The conversation type. Always `voice`.")
  @example("voice")
  conversation_type: string;
}

@summary("AI sidecar callback")
@doc("""
  Sent to the sidecar's `url` as an HTTP `POST` whenever you set one. The same event is always
  published in real time on the SignalWire Relay event channel (`calling.ai.sidecar`), so the
  webhook is optional. Each event is wrapped under `sidecar_event` — read that before checking its
  `type` and fields.

  This payload covers the envelope shared by every callback. For the fields specific to each `type`
  (such as `insight.raw`, `turn.transcript_delta`, or `final.summary`), see the
  [SWML ai_sidecar reference](/docs/swml/reference/calling/ai-sidecar#callback-types).
  """)
model AISidecarCallbackPayload {
  @doc("Envelope describing the call. `project_id` and `space_id` are included when available.")
  call_info: AICallInfo;

  @doc("The sidecar callback. Carries the common fields below plus type-specific fields.")
  sidecar_event: {
    @doc("The callback type.")
    @example(AISidecarCallbackType.insight)
    type: AISidecarCallbackType;

    @doc("When the event was produced, as a Unix timestamp in microseconds.")
    @example(1745870400123456)
    ts: int64;

    @doc("Identifies the evaluation this callback came from. Callbacks produced in the same evaluation share a `tick_id`.")
    @example(7)
    tick_id: int64;

    @doc("Call/channel context: `call_id`, plus `caller_id_name` / `caller_id_number` / `destination_number` when available.")
    channel_data: Record<unknown>;
  };
}

@summary("AI sidecar SWAIG tool webhook")
@doc("""
  Sent to a sidecar tool's `web_hook_url` (or the SWAIG `defaults.web_hook_url`) when the sidecar
  calls one of your functions. Your endpoint runs the function and returns a JSON object with a
  `response` string (the result the model reads next) and, optionally, an `action` — a single object
  or an array — telling the sidecar what to do. See
  [Supported SWAIG actions](/docs/swml/reference/calling/ai-sidecar#supported-swaig-actions) for what
  you can return.
  
  The sidecar only listens to the call and never speaks on it, so a `say` action is reported back to
  you as a callback rather than being spoken aloud.
  """)
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

    @doc("The raw argument string after any variable substitution.")
    @example("{\"competitor\":\"ACME\"}")
    substituted: string;
  };

  @doc("The ID of the call the sidecar is attached to.")
  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
  call_id: string;

  @doc("The sidecar's current `global_data`. Present when the sidecar has any.")
  global_data?: Record<unknown>;

  @doc("Call/channel context.")
  channel_data: {
    @doc("ID of the call.")
    @example("2e1e66e5-5d07-413d-9668-55542992eec0")
    call_id: string;

    @doc("Caller ID name. Present when available.")
    @example("Jane Doe")
    caller_id_name?: string;

    @doc("Caller ID number. Present when available.")
    @example("+15555550100")
    caller_id_number?: string;

    @doc("Destination number. Present when available.")
    @example("+15555550199")
    destination_number?: string;
  };
}

@summary("SWAIG function signature request")
@doc("""
  Sent once per [`SWAIG.includes`](/docs/swml/reference/calling/ai/swaig/includes) entry when an AI
  agent loads, to discover the functions your server hosts. Every way of building an agent sends it —
  SWML you write yourself, SWML a Server SDK generates, or an agent you configure in your Dashboard —
  because they all resolve `includes` the same way. Return a JSON array of function definitions, each
  shaped like an entry in
  [`SWAIG.functions`](/docs/swml/reference/calling/ai/swaig/functions#properties) — `function`,
  `description`, and `parameters`. Functions the agent can call are the ones you return here.

  This is not the payload a function call sends. It goes to the `includes` entry's `url`, using
  `auth_user` and `auth_password` when set. Your endpoint can also receive it outside of a call, as a
  check that it answers, so answer it the same way. When your project has a signing key, the request
  carries an `X-SignalWire-Signature` header you can verify.
  """)
model SwaigSignatureRequestPayload {
  @doc("What the request is asking of you. Always `get_signature`.")
  @example("get_signature")
  action: string;

  @doc("""
    The function names the `includes` entry asked for. This list can be empty, and it does not limit
    your reply: every definition you return is registered, whether or not it is named here.
    """)
  @example(#["get_weather"])
  functions: string[];

  @doc("The `meta_data` you set on the `includes` entry. Omitted when you set none.")
  @example(#{ store_id: "sf-01" })
  meta_data?: Record<unknown>;

  @doc("""
    The token scoping `meta_data`. Present on the check your endpoint can receive outside of a call,
    where it is a fixed value with nothing to interpret, and absent during a call.
    """)
  @example("my-token")
  meta_data_token?: string;

  @doc("The content type of the request body. Always `text/swaig`.")
  @example("text/swaig")
  content_type: string;

  @doc("How the body is delivered. Always `function signature request`.")
  @example("function signature request")
  content_disposition: string;

  @doc("The SWAIG protocol version.")
  @example("2.0")
  version: string;

  @doc("Your project ID, when available.")
  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
  project_id?: string;

  @doc("Your Space ID, when available.")
  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
  space_id?: string;
}

@summary("AI SWAIG tool webhook")
@doc("""
  Sent to a tool's `web_hook_url` (or the SWAIG `defaults.web_hook_url`) when an
  [`ai`](/docs/swml/reference/calling/ai) agent calls one of your functions. Your endpoint runs the
  function and returns a JSON object with a `response` string (the result the AI reads next) and,
  optionally, an `action` — a single object or an array — telling the agent what to do.
  """)
model AiSwaigToolWebhookPayload {
  @doc("The name of the function the AI is calling.")
  @example("get_weather")
  function: string;

  @doc("The arguments the AI passed to your function.")
  argument: {
    @doc("The arguments parsed into objects. Usually a single-element array.")
    @example(#[#{ city: "San Francisco" }])
    parsed: Record<unknown>[];

    @doc("The raw argument string, exactly as the AI produced it.")
    @example("{\"city\":\"San Francisco\"}")
    raw: string;

    @doc("""
      Any text that surrounded the JSON, with the JSON itself removed. Omitted when the whole
      argument was JSON, which is the usual case.
      """)
    @example("")
    substituted?: string;
  };

  @doc("The function's parameter definition, as you declared it in `parameters`.")
  @example(#{
    type: "object",
    properties: #{ city: #{ type: "string", description: "Name of the city" } },
    required: #["city"],
  })
  argument_desc: Record<unknown>;

  @doc("""
    The description you gave the function in
    [`SWAIG.functions`](/docs/swml/reference/calling/ai/swaig/functions#properties).
    """)
  @example("Look up the current weather for a city.")
  description: string;

  @doc("The ID of the call.")
  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
  call_id: string;

  @doc("The ID of the AI session on the call.")
  @example("a0d4e6e5-5d07-413d-9668-55542992eec0")
  ai_session_id: string;

  @doc("The conversation ID, when the AI session has one.")
  conversation_id?: string;

  @doc("The name of your AI application.")
  @example("ai")
  app_name: string;

  @doc("The AI session's current `global_data`, when it has any.")
  @example(#{ customer_tier: "premium", pickup_address: "123 Main St, Springfield" })
  global_data?: Record<unknown>;

  @doc("""
    The token that scopes `meta_data`. This is the `meta_data_token` you set on the function, or a
    value derived from the function's `web_hook_url` and credentials when you did not set one.
    """)
  @example("my-token")
  meta_data_token: string;

  @doc("Metadata scoped to `meta_data_token`. An empty object when the function has none yet.")
  @example(#{ order_number: "12345" })
  meta_data: Record<unknown>;

  @doc("The caller's name, when available.")
  @example("Jane Doe")
  caller_id_name?: string;

  @doc("The caller's number, when available.")
  @example("+15555550100")
  caller_id_num?: string;

  @doc("Whether the call is still up.")
  @example(true)
  channel_active: boolean;

  @doc("Whether the call is answered.")
  @example(true)
  channel_offhook: boolean;

  @doc("Whether the AI session is ready to take actions.")
  @example(true)
  channel_ready: boolean;

  @doc("The content type of the request body. Always `text/swaig`.")
  @example("text/swaig")
  content_type: string;

  @doc("The SWAIG protocol version.")
  @example("2.0")
  version: string;

  @doc("How the body is delivered. Always `SWAIG Function`.")
  @example("SWAIG Function")
  content_disposition: string;

  @doc("Your project ID, when available.")
  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
  project_id?: string;

  @doc("Your Space ID, when available.")
  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
  space_id?: string;

  @doc("`true` when the AI session has hit an unrecoverable error. Included only in that case.")
  fatal_error?: boolean;

  @doc("A description of the error. Included only when `fatal_error` is set.")
  error_reason?: string;

  @doc("SWML variables for the call. Included when you enable `swaig_post_swml_vars`.")
  SWMLVars?: Record<unknown>;

  @doc("SWML call state. Included when you enable `swaig_post_swml_vars`.")
  SWMLCall?: Record<unknown>;

  @doc("The conversation so far, with sensitive values redacted. Included when you enable `swaig_post_conversation`.")
  call_log?: Record<unknown>[];

  @doc("The full, unredacted conversation so far. Included when you enable `swaig_post_conversation`.")
  raw_call_log?: Record<unknown>[];
}

@summary("Amazon Bedrock SWAIG tool webhook")
@doc("""
  Sent to a tool's `web_hook_url` (or the SWAIG `defaults.web_hook_url`) when an
  [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) agent calls one of your functions.
  Your endpoint runs the function and returns a JSON object with a `response` string (the result the
  agent reads next) and, optionally, an `action` — a single object or an array — telling the agent
  what to do.

  Bedrock agents send a different payload from [`ai`](/docs/swml/reference/calling/ai) agents. Notably
  `content_type` is `text/json` rather than `text/swaig`, `argument` carries no `substituted` value,
  there is no `version`, `description`, or `argument_desc`, and the call's timing and caller fields
  are named differently. Write your handler against this payload, not the
  [AI SWAIG tool webhook](#tag/calls/webhook/aiSwaigToolWebhook).
  """)
model BedrockSwaigToolWebhookPayload {
  @doc("The name of the function the agent is calling.")
  @example("get_weather")
  function: string;

  @doc("The arguments the agent passed to your function.")
  argument: {
    @doc("The arguments parsed into objects. Usually a single-element array.")
    @example(#[#{ city: "San Francisco" }])
    parsed: Record<unknown>[];

    @doc("The raw argument string, exactly as the agent produced it.")
    @example("{\"city\":\"San Francisco\"}")
    raw: string;
  };

  @doc("The ID of the call.")
  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
  call_id: string;

  @doc("The ID of the AI session on the call. Matches `call_id` for Bedrock agents.")
  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
  ai_session_id: string;

  @doc("The name of your Bedrock application. Defaults to `bedrock`.")
  @example("bedrock")
  app_name: string;

  @doc("The caller's number. An empty string when the call has none.")
  @example("+15555550100")
  caller_id: string;

  @doc("The agent's current `global_data`. An empty object when you seeded none.")
  @example(#{ customer_tier: "premium", pickup_address: "123 Main St, Springfield" })
  global_data: Record<unknown>;

  @doc("The content type of the request body. Always `text/json`.")
  @example("text/json")
  content_type: string;

  @doc("How the body is delivered. Always `agent.function` for a function call.")
  @example("agent.function")
  content_disposition: string;

  @doc("The kind of conversation the agent is running. Always `voice`.")
  @example("voice")
  conversation_type: string;

  @doc("""
    What the request is asking of you. Always `fetch_conversation` for a function call; the
    end-of-call conversation report sends `post_conversation` instead.
    """)
  @example("fetch_conversation")
  action: string;

  @doc("Your project ID, when available.")
  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
  project_id?: string;

  @doc("Your Space ID, when available.")
  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
  space_id?: string;

  @doc("The conversation ID, when the agent was configured with one.")
  conversation_id?: string;

  @doc("The caller's name, when available.")
  @example("Jane Doe")
  caller_id_name?: string;

  @doc("The caller's number, when available.")
  @example("+15555550100")
  caller_id_number?: string;

  @doc("When the call was created, as a Unix timestamp in microseconds.")
  call_start_date?: int64;

  @doc("When the call was answered, as a Unix timestamp in microseconds. `0` when it never was.")
  call_answer_date?: int64;

  @doc("When the call ended, as a Unix timestamp in microseconds. `0` while the call is still up.")
  call_end_date?: int64;

  @doc("When the agent started, as a Unix timestamp in microseconds.")
  ai_start_date?: int64;

  @doc("When the agent stopped, as a Unix timestamp in microseconds. Omitted while it is still running.")
  ai_end_date?: int64;

  @doc("Per-response performance metrics for the session so far. Included once the agent has any.")
  times?: Record<unknown>[];

  @doc("SWML variables for the call. Included when the call carries SWML state.")
  SWMLVars?: Record<unknown>;

  @doc("SWML call state. Included when the call carries SWML state.")
  SWMLCall?: Record<unknown>;

  @doc("""
    The token that scopes `meta_data`. This is the `meta_data_token` you set on the function, or an
    MD5 of the function's name when you did not set one.
    """)
  @example("d742c5d1d969d9fdbbd9bd1c52499f2d")
  meta_data_token: string;

  @doc("Metadata scoped to `meta_data_token`. An empty object when the function has none yet.")
  @example(#{ order_number: "12345" })
  meta_data: Record<unknown>;
}

@doc("""
  The answer an AI agent gave to your
  [`post_prompt`](/docs/swml/reference/calling/ai), in three forms.
  """)
model AIPostPromptData {
  @doc("""
    Every JSON object found in the answer, parsed. An empty array when the agent answered in prose.
    Ask the post-prompt for named JSON keys when you want to count outcomes.
    """)
  @example(#[#{ intent: "book_ride", resolved: true }])
  parsed: Record<unknown>[];

  @doc("The answer exactly as the agent produced it.")
  @example("{\"intent\":\"book_ride\",\"resolved\":true}")
  raw: string;

  @doc("""
    The answer with the JSON removed, leaving only the surrounding prose. Omitted when the answer was
    JSON and nothing followed it.
    """)
  @example("Caller booked a ride to the airport.")
  substituted?: string;
}

@summary("AI post-prompt callback")
@doc("""
  Sent to your [`ai.post_prompt_url`](/docs/swml/reference/calling/ai) when the AI session ends. It
  carries the agent's answer to your [`post_prompt`](/docs/swml/reference/calling/ai)
  alongside the full record of the call: the conversation, the tool calls, the timings, and the
  token counts. This is the one report you get per call, so store the body verbatim and extract only
  the fields you query. Nothing you return in the response is read.

  Read `action` first. It is `post_conversation` on the end-of-call report described here. The same
  URL also receives `fetch_conversation` when the agent starts with a stored conversation
  ([`save_conversation`](/docs/swml/reference/calling/ai/params#paramssave_conversation) with a
  `conversation_id`), asking your endpoint to return that conversation; that request carries the
  call and session fields but none of the summary fields. Answer it with the stored
  `conversation_summary`.

  The conversation appears three times. `call_log` is the filtered view, with interrupted segments
  consolidated. `raw_call_log` is unfiltered and append-only, and is the only place barge-in detail
  survives. `call_timeline` is a flat stream of typed events aligned to `raw_call_log`.

  [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) agents send a different report.
  Write your handler against the
  [Bedrock post-prompt callback](#tag/calls/webhook/bedrockPostPromptCallback) instead.
  """)
model AiPostPromptCallbackPayload {
  @doc("Your project ID, when available.")
  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
  project_id?: string;

  @doc("Your Space ID, when available.")
  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
  space_id?: string;

  @doc("The content type of the request body. Always `text/json`.")
  @example("text/json")
  content_type: string;

  @doc("""
    How the body is delivered. `agent.summary` on the end-of-call report, `agent.load_conversation`
    on a request for a stored conversation.
    """)
  @example("agent.summary")
  content_disposition: string;

  @doc("The kind of conversation the agent ran. Always `voice`.")
  @example("voice")
  conversation_type: string;

  @doc("The ID of the call.")
  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
  call_id: string;

  @doc("The name of your AI application.")
  @example("ai")
  app_name: string;

  @doc("The ID of the AI session on the call.")
  @example("a0d4e6e5-5d07-413d-9668-55542992eec0")
  ai_session_id: string;

  @doc("""
    A stable fingerprint of the model the agent ran. Two calls that used the same model share it, so
    you can group reports by model without recording the model name. Omitted when the session had no
    model.
    """)
  @example("d742c5d1d969d9fdbbd9bd1c52499f2d")
  ai_id_tag?: string;

  @doc("The conversation ID, when the agent was configured with one.")
  @example("support-thread-4821")
  conversation_id?: string;

  @doc("""
    What the request is asking of you. `post_conversation` is the end-of-call report;
    `fetch_conversation` asks your endpoint to return a stored conversation.
    """)
  @example("post_conversation")
  action: "post_conversation" | "fetch_conversation";

  @doc("""
    The conversation, filtered: interrupted segments are consolidated and evicted entries dropped.
    Each entry carries a `role` of `system`, `user`, `assistant`, or `tool`, its `content`, and
    per-turn timing. Included when `action` is `post_conversation`.
    """)
  @example(#[
    #{ role: "system", content: "You dispatch taxis." },
    #{ role: "user", content: "I need a ride to the airport." }
  ])
  call_log?: Record<unknown>[];

  @doc("""
    The conversation, unfiltered and append-only. Interruption detail appears here and nowhere else.
    Included when `action` is `post_conversation`.
    """)
  raw_call_log?: Record<unknown>[];

  @doc("""
    A flat stream of typed events aligned to `raw_call_log`, for replaying the call in order. Each
    entry carries a `ts`, a `type` such as `user_input`, `ai_response`, or `tool_result`, and the
    fields for that type. Included when the session produced any.
    """)
  call_timeline?: Record<unknown>[];

  @doc("""
    Conversations from before each context switch, oldest first, one array of messages per switch.
    Included only when the agent switched context during the call.
    """)
  previous_contexts?: Record<unknown>[][];

  @doc("""
    Always `true` when present, meaning the session ended because it hit its configured time limit
    rather than finishing on its own. Omitted otherwise.
    """)
  @example(true)
  hard_timeout?: boolean;

  @doc("When the call was created, as a Unix timestamp in microseconds.")
  @example(1694541295773508)
  call_start_date?: int64;

  @doc("When the call was answered, as a Unix timestamp in microseconds. `0` when it never was.")
  @example(1694541296799504)
  call_answer_date?: int64;

  @doc("When the call ended, as a Unix timestamp in microseconds.")
  @example(1694541335435503)
  call_end_date?: int64;

  @doc("When the AI session started, as a Unix timestamp in microseconds.")
  @example(1694541297950440)
  ai_start_date?: int64;

  @doc("Who or what ended the call. Included when the session recorded it.")
  @example("assistant")
  call_ended_by?: string;

  @doc("""
    When the AI session ended, as a Unix timestamp in microseconds. Omitted when the session was
    still running.
    """)
  @example(1694541335425164)
  ai_end_date?: int64;

  @doc("The caller's name, when available.")
  @example("Jane Doe")
  caller_id_name?: string;

  @doc("The caller's number, when available.")
  @example("+15555550100")
  caller_id_number?: string;

  @doc("""
    Per-response performance metrics, one entry per generated reply, carrying `response`,
    `response_word_count`, `answer_time`, `token_time`, `tokens`, `avg_tps`, and `tps`. Included once
    the session has any.
    """)
  times?: Record<unknown>[];

  @doc("SWML variables for the call. Included when the call carries SWML state.")
  SWMLVars?: Record<unknown>;

  @doc("SWML call state. Included when the call carries SWML state.")
  SWMLCall?: Record<unknown>;

  @doc("""
    The agent's answer to your `post_prompt`. Included when `action` is `post_conversation`.
    """)
  post_prompt_data?: AIPostPromptData;

  @doc("""
    The session's final `global_data`. An empty object when you seeded none. Included when `action`
    is `post_conversation`.
    """)
  @example(#{ customer_tier: "premium", pickup_address: "123 Main St, Springfield" })
  global_data?: Record<unknown>;

  @doc("""
    Every tool call the agent made, in order. Each entry carries `command_name`, `command_arg`,
    `epoch_time` in seconds, and, for a tool that reached your server, the `url`, the `post_data`
    that was sent, and the `post_response` that came back. Included when `action` is
    `post_conversation`.
    """)
  swaig_log?: Record<unknown>[];

  @doc("""
    The number of billable minutes, rounded up to at least one. Included when you enable
    [`enable_accounting`](/docs/swml/reference/calling/ai/params#paramsenable_accounting).
    """)
  @example(3)
  total_minutes?: integer;

  @doc("Input tokens the session consumed. Included when you enable `enable_accounting`.")
  @example(5627)
  total_input_tokens?: integer;

  @doc("Output tokens the session produced. Included when you enable `enable_accounting`.")
  @example(119)
  total_output_tokens?: integer;

  @doc("""
    Input tokens counted against the model, which differs from `total_input_tokens` when the
    conversation was trimmed. Included when you enable `enable_accounting`.
    """)
  @example(5627)
  total_wire_input_tokens?: integer;

  @doc("`total_wire_input_tokens` divided by `total_minutes`. Included when you enable `enable_accounting`.")
  @example(1875.67)
  total_wire_input_tokens_per_minute?: float;

  @doc("""
    Output tokens counted against the model. Included when you enable `enable_accounting`.
    """)
  @example(119)
  total_wire_output_tokens?: integer;

  @doc("`total_wire_output_tokens` divided by `total_minutes`. Included when you enable `enable_accounting`.")
  @example(39.67)
  total_wire_output_tokens_per_minute?: float;

  @doc("Characters sent to text-to-speech. Included when you enable `enable_accounting`.")
  @example(842)
  total_tts_chars?: integer;

  @doc("`total_tts_chars` divided by `total_minutes`. Included when you enable `enable_accounting`.")
  @example(280.67)
  total_tts_chars_per_min?: float;

  @doc("Minutes of audio sent to speech recognition. Included when you enable `enable_accounting`.")
  @example(2.41)
  total_asr_minutes?: float;

  @doc("`total_asr_minutes` divided by `total_minutes`. Included when you enable `enable_accounting`.")
  @example(0.8)
  total_asr_cost_factor?: float;

  @doc("""
    A plain-language summary of the conversation, for storing against `conversation_id` and handing
    back on the next `fetch_conversation`. Included when you enable
    [`save_conversation`](/docs/swml/reference/calling/ai/params#paramssave_conversation) and set
    a `conversation_id`.
    """)
  @example("Caller booked a ride from 123 Main St to the airport for 6pm.")
  conversation_summary?: string;
}

@doc("Where in the agent's flow an event happened.")
model AIDebugFlowLocation {
  @doc("The context the agent was in. `default` when you define no contexts.")
  @example("default")
  context: string;

  @doc("The step the agent was on. Included only when the context defines steps.")
  @example("collect_address")
  step?: string;

  @doc("The step's index. Included only when the context defines steps.")
  @example(2)
  step_index?: integer;
}

@summary("AI debug webhook")
@doc("""
  A diagnostic feed for a call that is still in progress. Set `debug_webhook_url` on your agent and
  every step it takes is posted to that URL as it happens: speech recognized, model called, tool
  invoked, context switched, error hit. Use it to work out why a call went the way it did — which
  tool the agent reached for, what came back, where a turn went wrong — or to react while the call is
  still live, such as paging a supervisor.

  Each request carries `call_info` plus one or more event properties, where the property name is the
  event. One moment can produce several: evaluating a `data_map` webhook sends `webhook`, `input`,
  `output`, `error_keys`, and `match` together. Handle the properties you recognize and ignore the
  rest, since the set grows over time.

  Setting the URL is what enables the feed. `debug_webhook_level` only widens it: at `2` it also
  carries `conversation_add`, `llm_request`, and `llm_response`, which fire on every turn and every
  model call.
  """)
model AiDebugWebhookPayload is Record<unknown> {
  @doc("Identifies the call the event came from.")
  call_info: AICallInfo;

  @doc("""
    The AI session started. Sent once per session. The fields differ by session type: a standard
    session reports the voice it will use, while a speech-to-speech session reports `mode` as `oart`
    along with its audio settings and reports no voice at all. Every field is optional, so read
    `mode` to tell which kind of session you have.
    """)
  session_start?: {
    @doc("The model the agent is running. `unknown` on a speech-to-speech session with no model set.")
    @example("gpt-4.1-mini")
    `model`?: string;

    @doc("The text-to-speech engine. Standard sessions only, and only when a voice is configured.")
    @example("elevenlabs")
    tts_engine?: string;

    @doc("The text-to-speech voice. Standard sessions only, and only when a voice is configured.")
    @example("rachel")
    tts_voice?: string;

    @doc("The language code the session started in. Standard sessions only, and only when a voice is configured.")
    @example("en-US")
    language?: string;

    @doc("Always `oart` when present, marking a speech-to-speech session. Absent on a standard session.")
    @example("oart")
    mode?: string;

    @doc("The audio sample rate, in hertz. Speech-to-speech sessions only.")
    @example(24000)
    rate?: integer;

    @doc("The audio encoding. Speech-to-speech sessions only.")
    @example("pcm16")
    audio_format?: string;

    @doc("The separate model used for tool calls. Speech-to-speech sessions only, and only when one is configured.")
    @example("gpt-4.1-mini")
    tool_model?: string;

    @doc("""
      Always `true` when present, meaning voice activity detection runs on the media rather than at
      the model. Speech-to-speech sessions only.
      """)
    @example(true)
    local_vad?: boolean;
  };

  @doc("The AI session ended. Sent once per session.")
  session_end?: {
    @doc("""
      Why the session ended. `normal` on an ordinary finish, `hard_timeout` when it hit its
      configured time limit, and `end_call` or `error` on a speech-to-speech session that was hung up
      or failed.
      """)
    @example("normal")
    reason: "normal" | "hard_timeout" | "end_call" | "error";

    @doc("""
      Who or what ended the call, `system` when nothing recorded it. Absent on a speech-to-speech
      session.
      """)
    @example("assistant")
    ended_by?: string;

    @doc("A description of the error. Included only when the session ended on one.")
    fatal_error_reason?: string;

    @doc("How long the session ran, in milliseconds.")
    @example(37651)
    duration_ms: integer;

    @doc("Input tokens the session consumed.")
    @example(5627)
    input_tokens: integer;

    @doc("Output tokens the session produced.")
    @example(119)
    output_tokens: integer;
  };

  @doc("Your `startup_hook` function finished, whether or not it succeeded.")
  startup_hook?: {
    @doc("How long the hook took, in milliseconds.")
    @example(214)
    duration_ms: integer;

    @doc("Whether the hook ran successfully.")
    @example(true)
    success: boolean;

    @doc("Why the hook failed. Included only when `success` is `false`.")
    @example("execution failed")
    error?: string;
  };

  @doc("Your `hangup_hook` function finished, whether or not it succeeded.")
  hangup_hook?: {
    @doc("How long the hook took, in milliseconds.")
    @example(186)
    duration_ms: integer;

    @doc("Whether the hook ran successfully.")
    @example(true)
    success: boolean;

    @doc("Whether the session ended on an unrecoverable error. Included only when the hook succeeded.")
    @example(false)
    has_fatal_error?: boolean;

    @doc("Why the hook failed. Included only when `success` is `false`.")
    @example("execution failed")
    error?: string;
  };

  @doc("Speech was recognized from the caller. Suppressed when you enable `redact_prompt`.")
  speech_detect?: {
    @doc("The recognized text.")
    @example("I need a ride to the airport.")
    text: string;

    @doc("Which recognizer produced the text.")
    @example("final")
    source: string;
  };

  @doc("""
    The caller interrupted the agent. The fields differ by session type: a standard session reports
    `barge_type`, `barge_elapsed_ms`, and `interrupt_count`, while a speech-to-speech session reports
    `audio_played_ms` and `barge_count`.
    """)
  barge?: {
    @doc("`transparent` when the agent keeps what it already said, `normal` otherwise.")
    @example("normal")
    barge_type?: "transparent" | "normal";

    @doc("How long the agent had been speaking when the caller cut in, in milliseconds.")
    @example(1240)
    barge_elapsed_ms?: integer;

    @doc("How many times the caller has interrupted so far.")
    @example(2)
    interrupt_count?: integer;

    @doc("How much of the reply had played when the caller cut in, in milliseconds. Speech-to-speech sessions only.")
    @example(1240)
    audio_played_ms?: integer;

    @doc("How many times the caller has interrupted so far. Speech-to-speech sessions only.")
    @example(2)
    barge_count?: integer;
  };

  @doc("The agent finished speaking a reply.")
  ai_completion?: {
    @doc("`barged` when the caller interrupted the reply, `normal` when it played to the end.")
    @example("normal")
    type: "normal" | "barged";
  };

  @doc("The agent played a filler phrase while it worked.")
  filler?: {
    @doc("The phrase that was spoken.")
    @example("Let me check on that.")
    text: string;

    @doc("`function` while a tool runs, `thinking` while the model does.")
    @example("function")
    filler_type: "function" | "thinking";
  };

  @doc("The caller went quiet for longer than `attention_timeout`. Sent as `null` on speech-to-speech sessions.")
  attention_timeout?: {
    @doc("The configured timeout, in milliseconds.")
    @example(15000)
    timeout_ms: integer;
  } | null;

  @doc("The agent was placed on hold, or taken off it. `timeout` and `loop` come with `hold` only.")
  hold?: {
    @doc("Which way the hold went.")
    @example("hold")
    event: "hold" | "unhold";

    @doc("How long the hold lasts, in seconds. Absent on `unhold`.")
    @example(30)
    timeout?: integer;

    @doc("Whether the hold repeats. Absent on `unhold`.")
    @example(false)
    loop?: boolean;
  };

  @doc("The agent called one of your functions and the call returned.")
  function_call?: {
    @doc("The name of the function.")
    @example("get_weather")
    function: string;

    @doc("How long the function took, in milliseconds.")
    @example(412)
    duration_ms: integer;

    @doc("""
      Whether the function ran inside the platform rather than on your server. Absent on a
      speech-to-speech shadow call, which reports `shadow` instead.
      """)
    @example(false)
    native?: boolean;

    @doc("""
      Always `true` when present, marking a call the agent made in the background while it kept
      talking. Speech-to-speech sessions only.
      """)
    @example(true)
    shadow?: boolean;

    @doc("Where in the session the call happened. Included only for a call made while running the post-prompt.")
    @example("post_prompt")
    phase?: string;
  };

  @doc("""
    The agent called the same function repeatedly and was stopped. `consecutive` means it was called
    several times in a row; `repeated` means it was called with the same arguments each time.
    """)
  function_loop?: {
    @doc("The name of the function.")
    @example("get_weather")
    function: string;

    @doc("Which loop guard tripped.")
    @example("repeated")
    type: "consecutive" | "repeated";

    @doc("How many calls triggered the guard.")
    @example(3)
    count: integer;
  };

  @doc("""
    A completed tool call, as one entry of the `swaig_log` the post-prompt callback reports at the
    end. Carries `command_name`, `command_arg`, `epoch_time` in seconds, and, for a tool that reached
    your server, `url`, `post_data`, and `post_response`.
    """)
  swaig_call?: Record<unknown>;

  @doc("A tool returned a SWAIG action. Carries the action exactly as your endpoint returned it.")
  process_action?: Record<unknown>;

  @doc("A tool result was shortened before the agent read it.")
  tool_distill?: {
    @doc("The function whose result was shortened.")
    @example("get_weather")
    function: string;

    @doc("Length of the original result, in characters.")
    @example(8412)
    raw_chars: integer;

    @doc("Length of the shortened result, in characters.")
    @example(612)
    distilled_chars: integer;

    @doc("The model that did the shortening. `default` when none was configured.")
    @example("gpt-4.1-mini")
    `model`: string;
  };

  @doc("""
    The webhook definition as you wrote it. Arrives alongside `input`, and alongside `output` and
    `match` when the call produced a reply, or `error` when the definition was unusable.
    """)
  webhook?: Record<unknown>;

  @doc("The body sent to a `data_map` webhook, or the input a `data_map` output template was expanded against.")
  input?: Record<unknown>;

  @doc("""
    The reply a `data_map` webhook produced, or the output template that matched. `null` when nothing
    matched.
    """)
  output?: Record<unknown> | null;

  @doc("The `data_map` entry that matched. `null` when none did.")
  match?: Record<unknown> | null;

  @doc("The `error_keys` declared on the `data_map` webhook. `null` when it declares none.")
  error_keys?: unknown[] | null;

  @doc("A `data_map` webhook could not be evaluated.")
  error?: {
    @doc("What went wrong.")
    @example("ai: webhook error")
    error: string;

    @doc("The detail behind it.")
    @example("Webhook obj must have output or expressions")
    errorText: string;
  };

  @doc("A `data_map` `expressions` entry was evaluated. Carries the entry as you wrote it, alongside `input` and `output`.")
  expression?: Record<unknown>;

  @doc("A `data_map` webhook request completed, with the request and response recorded.")
  webhook_log?: {
    @doc("The URL that was called, after variable expansion.")
    @example("https://example.com/weather?city=Springfield")
    request_url: string;

    @doc("The body that was sent. Omitted on a request with no body.")
    request_payload?: Record<unknown>;

    @doc("The response, plus `http_code` and any `parse_error` or `protocol_error` flags.")
    webhook_response: Record<unknown>;
  };

  @doc("""
    The final reply a `data_map` webhook produced, after matching. An array reply is wrapped as
    `{ \"array\": [...] }`. `null` when the webhook produced no reply.
    """)
  webhook_reply?: Record<unknown> | null;

  @doc("""
    A tool's webhook could not be reached or did not answer usefully, after every retry. Sent
    whenever a tool call fails, so you can alert on tools breaking mid-call.
    """)
  webhook_fail?: AIDebugWebhookFail;

  @doc("The agent moved to a different step.")
  step_change?: {
    @doc("The step it left. Omitted on the first step.")
    @example("greet")
    from_step?: string;

    @doc("The index of the step it left.")
    @example(0)
    from_index: integer;

    @doc("The step it moved to.")
    @example("collect_address")
    to_step: string;

    @doc("The index of the step it moved to.")
    @example(1)
    to_index: integer;

    @doc("""
      What caused the move. `ai_function` when the agent called `next_step`, `webhook_action` when a
      tool's response asked for it, `gather_complete` when a gather finished, and `auto_advance` when
      the step's own advance condition was met.
      """)
    @example("ai_function")
    trigger?: "ai_function" | "webhook_action" | "gather_complete" | "auto_advance";
  };

  @doc("The agent moved to a different context.")
  context_change?: {
    @doc("The context it moved to.")
    @example("billing")
    to_context: string;

    @doc("The context it left. Omitted on the first context.")
    @example("default")
    from_context?: string;

    @doc("""
      What caused the move. `ai_function` when the agent called `change_context`, `webhook_action`
      when a tool's response asked for it.
      """)
    @example("ai_function")
    trigger?: "ai_function" | "webhook_action";

    @doc("Whether the new context starts without the previous conversation.")
    @example(false)
    isolated: boolean;
  };

  @doc("The data a context switch was rendered against.")
  context_switch_data?: {
    @doc("The variables available to the new context's prompt.")
    data_root: Record<unknown>;

    @doc("The context definition as you wrote it.")
    info: Record<unknown>;
  };

  @doc("A `gather` started collecting answers.")
  gather_start?: {
    ...AIDebugFlowLocation;

    @doc("The key the collected answers are stored under. Omitted when none was set.")
    @example("address")
    output_key?: string;

    @doc("How many questions the gather will ask.")
    @example(3)
    total_questions: integer;
  };

  @doc("A `gather` asked a question.")
  gather_question?: {
    ...AIDebugFlowLocation;

    @doc("The key this question fills. Omitted when none was set.")
    @example("street")
    key?: string;

    @doc("The question's position in the gather, starting at 0.")
    @example(0)
    question_index: integer;

    @doc("The kind of answer expected. Omitted when unset.")
    @example("string")
    question_type?: string;

    @doc("Whether the answer has to be confirmed before the gather moves on.")
    @example(true)
    requires_confirm: boolean;
  };

  @doc("A `gather` accepted an answer.")
  gather_answer?: {
    ...AIDebugFlowLocation;

    @doc("The key the answer filled. Omitted when none was set.")
    @example("street")
    key?: string;

    @doc("The question's position in the gather, starting at 0.")
    @example(0)
    question_index: integer;

    @doc("Which attempt produced the answer, counting from 0.")
    @example(0)
    attempt: integer;

    @doc("Whether the question required the caller to confirm the answer back before it was accepted.")
    @example(true)
    confirmed: boolean;
  };

  @doc("A `gather` rejected an answer and will ask again.")
  gather_reject?: {
    ...AIDebugFlowLocation;

    @doc("The key the answer would have filled. Omitted when none was set.")
    @example("street")
    key?: string;

    @doc("The question's position in the gather, starting at 0.")
    @example(0)
    question_index: integer;

    @doc("Which attempt was rejected, counting from 0.")
    @example(0)
    attempt: integer;

    @doc("""
      Why it was rejected. `missing_answer` when no answer came back, `confirmation_required` when the
      answer arrived without the confirmation the question demands.
      """)
    @example("missing_answer")
    reason?: "missing_answer" | "confirmation_required";
  };

  @doc("A `gather` finished.")
  gather_complete?: {
    ...AIDebugFlowLocation;

    @doc("The key the collected answers were stored under. Omitted when none was set.")
    @example("address")
    output_key?: string;

    @doc("How many questions were answered.")
    @example(3)
    answered: integer;

    @doc("What the gather did on completion. Omitted when nothing recorded it.")
    @example("next_step")
    completion_action?: string;
  };

  @doc("""
    A message was added to the conversation, one per turn. Sent only at `debug_webhook_level` `2` and
    above. This is the same message that later appears in the post-prompt callback's `call_log`.
    """)
  conversation_add?: AIDebugConversationAdd;

  @doc("The agent is about to call the model. Sent only at `debug_webhook_level` `2` and above.")
  llm_request?: {
    @doc("The model being called.")
    @example("gpt-4.1-mini")
    `model`: string;

    @doc("Tokens in the prompt.")
    @example(412)
    prompt_tokens: integer;

    @doc("Tokens in the conversation so far.")
    @example(5215)
    conversation_tokens: integer;
  };

  @doc("The model answered. Sent only at `debug_webhook_level` `2` and above.")
  llm_response?: {
    @doc("The model that was called.")
    @example("gpt-4.1-mini")
    `model`: string;

    @doc("Tokens in the answer.")
    @example(53)
    output_tokens: integer;

    @doc("How long the call took, in milliseconds.")
    @example(836)
    duration_ms: integer;

    @doc("Whether the model returned anything.")
    @example(true)
    success: boolean;

    @doc("A description of the failure. Included only when the call failed.")
    error?: string;
  };

  @doc("""
    A model call failed or had to be retried. Read `event` for which: `token_exhaustion` and
    `llm_fatal` end the session, `llm_max_retries` gives up after repeated failures, and
    `llm_retry`, `reasoning_only_retry`, `empty_response_nudge_retry`, and
    `empty_response_effort_bump_retry` recover silently.
    """)
  llm_error?: {
    @doc("Which failure this is.")
    @example("llm_retry")
    event:
      | "token_exhaustion"
      | "llm_fatal"
      | "llm_max_retries"
      | "reasoning_only_retry"
      | "empty_response_nudge_retry"
      | "empty_response_effort_bump_retry"
      | "llm_retry";

    @doc("The model that was called. Omitted on `token_exhaustion`.")
    @example("gpt-4.1-mini")
    `model`?: string;

    @doc("Tokens in the conversation. Included only on `token_exhaustion`.")
    @example(128000)
    token_count?: integer;

    @doc("The token ceiling that was hit. Included only on `token_exhaustion`.")
    @example(120000)
    limit?: integer;

    @doc("How many failures have accumulated. Included only on `llm_max_retries`.")
    @example(4)
    errors?: integer;

    @doc("The effort level being retried at. Included only on `empty_response_effort_bump_retry`.")
    @example("high")
    reasoning_effort?: string;
  };

  @doc("The conversation passed its token ceiling and was summarized to make room.")
  consolidation?: {
    @doc("Always `consolidation`.")
    @example("consolidation")
    event: string;

    @doc("Tokens in the conversation when it tripped.")
    @example(121400)
    token_count: integer;

    @doc("The ceiling that was hit.")
    @example(120000)
    limit: integer;
  };

  @doc("The post-prompt summary is about to be generated.")
  summarize_start?: {
    @doc("How the summary is being produced.")
    @example("function")
    mode: string;

    @doc("The model producing it. `default` when none was configured.")
    @example("gpt-4.1-mini")
    `model`: string;
  };

  @doc("The post-prompt report was delivered.")
  post_prompt?: {
    @doc("The URL the report was sent to.")
    @example("https://example.com/reports")
    url: string;
  };

  @doc("Text was rewritten between spoken and written form, for recognition or speech.")
  text_normalize?: {
    @doc("`tn` rewrites text for speaking, `itn` rewrites recognized speech for reading.")
    @example("itn")
    direction: "tn" | "itn";

    @doc("The language the rewrite ran in.")
    @example("en")
    language: string;

    @doc("The text before the rewrite.")
    @example("twenty twenty six")
    original: string;

    @doc("The text after it.")
    @example("2026")
    normalized: string;
  };

  @doc("The configured voice could not be used and the agent fell back to another.")
  voice_error?: {
    @doc("`voice_config_error` when the voice was invalid, `voice_runtime_error` when it failed mid-call.")
    @example("voice_config_error")
    event: "voice_config_error" | "voice_runtime_error";

    @doc("The engine that failed.")
    @example("elevenlabs")
    engine: string;

    @doc("The voice that failed.")
    @example("rachel")
    voice: string;

    @doc("The engine used instead.")
    @example("gcloud")
    fallback_engine: string;

    @doc("The voice used instead.")
    @example("en-US-Neural2-J")
    fallback_voice: string;
  };

  @doc("Something about the configuration is likely to cause trouble.")
  warning?: {
    @doc("Which warning this is.")
    @example("excessive_prompt_tokens")
    event: string;

    @doc("Tokens in the prompt that triggered it.")
    @example(82000)
    tokens: integer;
  };

  @doc("The caller's speech was transcribed. Speech-to-speech sessions only.")
  oart_user_transcript?: {
    @doc("The transcribed text.")
    @example("I need a ride to the airport.")
    text: string;
  };

  @doc("The agent's speech was transcribed. Speech-to-speech sessions only.")
  oart_assistant_transcript?: {
    @doc("The transcribed text.")
    @example("Your ride is booked for 6pm.")
    text: string;
  };

  @doc("The agent finished a reply, with its timings. Speech-to-speech sessions only.")
  oart_response_done?: {
    @doc("Time from the end of the caller's turn to the start of the reply, in milliseconds.")
    @example(836)
    latency: integer;

    @doc("Time to the first word of the reply, in milliseconds.")
    @example(934)
    utterance_latency: integer;

    @doc("Time to the first audio of the reply, in milliseconds.")
    @example(1106)
    audio_latency: integer;

    @doc("Time to the first sound leaving the platform, in milliseconds.")
    @example(1180)
    acoustic_latency: integer;

    @doc("How the reply finished. Omitted when nothing recorded it.")
    @example("completed")
    status?: string;
  };

  @doc("""
    The agent's private reasoning, when you enable `enable_inner_dialog`.
    Speech-to-speech sessions only.
    """)
  inner_dialog?: {
    @doc("The reasoning text. The caller never hears this.")
    @example("The caller has not given a pickup address yet.")
    text: string;
  };
}

@doc("""
  Reports a tool webhook that could not be reached or did not answer usefully. Carries whatever
  detail the attempt produced, so unlisted keys can appear.
  """)
model AIDebugWebhookFail is Record<unknown> {
  @doc("Identifies the call. The same values as the envelope's `call_info`.")
  call_info: AICallInfo;

  @doc("Always `webhook error`.")
  @example("webhook error")
  error: string;

  @doc("The URL that was called.")
  @example("https://example.com/tools/get_weather")
  request_url: string;

  @doc("How many attempts were made, including the first.")
  @example(3)
  attempts: integer;

  @doc("The body that was sent, when there was one.")
  request_payload?: Record<unknown>;

  @doc("Always `true` when present, meaning the response body was not valid JSON.")
  @example(true)
  parse_error?: boolean;

  @doc("The response body as received. Included only when `parse_error` is set.")
  raw_response?: string;

  @doc("The response body parsed as JSON. `null` when it could not be parsed.")
  parsed_response: Record<unknown> | null;

  @doc("Always `true` when present, meaning the request failed before a response was received.")
  @example(true)
  protocol_error?: boolean;

  @doc("The transport error code. Included only when `protocol_error` is set.")
  @example(28)
  curl_code?: integer;

  @doc("The HTTP status code. `0` when no response was received.")
  @example(502)
  http_code: integer;
}

@doc("""
  One message as it is added to the conversation. The exact fields depend on which role produced it,
  so unlisted keys can appear.
  """)
model AIDebugConversationAdd is Record<unknown> {
  @doc("Who produced the message: `system`, `user`, `assistant`, or `tool`.")
  @example("assistant")
  role: string;

  @doc("The message text. Redacted when you enable `redact_prompt`.")
  @example("Your ride is booked for 6pm.")
  content: string;

  @doc("The language the message was in. Omitted on tool messages.")
  @example("en-US")
  lang?: string;

  @doc("Tokens the message consumed. Omitted on tool messages.")
  @example(53)
  tokens?: integer;

  @doc("When the message was added, as a Unix timestamp in microseconds.")
  @example(1694541297950440)
  timestamp?: int64;

  @doc("Links a tool result back to the call that produced it. Present on tool messages.")
  tool_call_id?: string;

  @doc("""
    Per-turn detail. On a caller turn this carries `confidence`, `content_type`, and the
    speaking-to-final timings. Omitted on turns that have none.
    """)
  metadata?: Record<unknown>;
}

@summary("Amazon Bedrock post-prompt callback")
@doc("""
  Sent to your [`amazon_bedrock.post_prompt_url`](/docs/swml/reference/calling/amazon-bedrock) when
  the agent's session ends, carrying its answer to your `post_prompt` alongside the record of the
  call. Nothing you return in the response is read.

  Bedrock agents send a different report from [`ai`](/docs/swml/reference/calling/ai) agents. There
  is no `call_timeline`, `previous_contexts`, `hard_timeout`, `call_ended_by`, or `ai_id_tag`;
  `raw_call_log` is a copy of `call_log` rather than a separate unfiltered view; `swaig_log` is
  always empty; `conversation_summary` is always present; and the `total_*` fields arrive without
  your having to enable accounting. `post_prompt_url` also takes no separate credentials here — put
  them in the URL as `username:password@url`. Write your handler against this payload, not the
  [AI post-prompt callback](#tag/calls/webhook/aiPostPromptCallback).
  """)
model BedrockPostPromptCallbackPayload {
  @doc("Your project ID, when available.")
  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
  project_id?: string;

  @doc("Your Space ID, when available.")
  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
  space_id?: string;

  @doc("The content type of the request body. Always `text/json`.")
  @example("text/json")
  content_type: string;

  @doc("How the body is delivered. Always `agent.summary` for the end-of-call report.")
  @example("agent.summary")
  content_disposition: string;

  @doc("The kind of conversation the agent ran. Always `voice`.")
  @example("voice")
  conversation_type: string;

  @doc("The ID of the call.")
  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
  call_id: string;

  @doc("The name of your Bedrock application. Defaults to `bedrock`.")
  @example("bedrock")
  app_name: string;

  @doc("The ID of the AI session on the call. Matches `call_id` for Bedrock agents.")
  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
  ai_session_id: string;

  @doc("The conversation ID, when the agent was configured with one.")
  @example("support-thread-4821")
  conversation_id?: string;

  @doc("What the request is asking of you. Always `post_conversation` for the end-of-call report.")
  @example("post_conversation")
  action: string;

  @doc("""
    The conversation. Each entry carries a `role` of `system`, `user`, or `assistant` and its
    `content`.
    """)
  @example(#[
    #{ role: "system", content: "You dispatch taxis." },
    #{ role: "user", content: "I need a ride to the airport." }
  ])
  call_log: Record<unknown>[];

  @doc("A copy of `call_log`. Bedrock agents do not keep a separate unfiltered log.")
  raw_call_log: Record<unknown>[];

  @doc("When the call was created, as a Unix timestamp in microseconds.")
  @example(1694541295773508)
  call_start_date?: int64;

  @doc("When the call was answered, as a Unix timestamp in microseconds. `0` when it never was.")
  @example(1694541296799504)
  call_answer_date?: int64;

  @doc("When the call ended, as a Unix timestamp in microseconds. `0` while the call is still up.")
  @example(1694541335435503)
  call_end_date?: int64;

  @doc("When the agent started, as a Unix timestamp in microseconds.")
  @example(1694541297950440)
  ai_start_date?: int64;

  @doc("""
    When the agent stopped, as a Unix timestamp in microseconds. Omitted while it is still running.
    """)
  @example(1694541335425164)
  ai_end_date?: int64;

  @doc("The caller's name, when available.")
  @example("Jane Doe")
  caller_id_name?: string;

  @doc("The caller's number, when available.")
  @example("+15555550100")
  caller_id_number?: string;

  @doc("""
    Per-response performance metrics, one entry per generated reply. Included once the agent has any.
    """)
  times?: Record<unknown>[];

  @doc("""
    The number of billable minutes, rounded up to at least one. Included once the agent has stopped.
    """)
  @example(3.14)
  total_minutes?: float;

  @doc("Input tokens the session consumed. Included once the agent has stopped.")
  @example(5627)
  total_input_tokens?: integer;

  @doc("Output tokens the session produced. Included once the agent has stopped.")
  @example(119)
  total_output_tokens?: integer;

  @doc("A copy of `total_input_tokens`. Included once the agent has stopped.")
  @example(5627)
  total_wire_input_tokens?: integer;

  @doc("`total_input_tokens` divided by `total_minutes`. Included once the agent has stopped.")
  @example(1792.04)
  total_wire_input_tokens_per_minute?: float;

  @doc("A copy of `total_output_tokens`. Included once the agent has stopped.")
  @example(119)
  total_wire_output_tokens?: integer;

  @doc("`total_output_tokens` divided by `total_minutes`. Included once the agent has stopped.")
  @example(37.9)
  total_wire_output_tokens_per_minute?: float;

  @doc("Characters sent to text-to-speech. Included once the agent has stopped.")
  @example(842)
  total_tts_chars?: integer;

  @doc("`total_tts_chars` divided by `total_minutes`. Included once the agent has stopped.")
  @example(268.15)
  total_tts_chars_per_min?: float;

  @doc("Minutes of audio sent to speech recognition. Included once the agent has stopped.")
  @example(2.41)
  total_asr_minutes?: float;

  @doc("Always `1`. Bedrock agents do not vary the factor. Included once the agent has stopped.")
  @example(1)
  total_asr_cost_factor?: float;

  @doc("SWML variables for the call. Included when the call carries SWML state.")
  SWMLVars?: Record<unknown>;

  @doc("SWML call state. Included when the call carries SWML state.")
  SWMLCall?: Record<unknown>;

  @doc("The agent's answer to your `post_prompt`.")
  post_prompt_data: AIPostPromptData;

  @doc("The session's final `global_data`. An empty object when you seeded none.")
  @example(#{ customer_tier: "premium" })
  global_data: Record<unknown>;

  @doc("Always an empty array. Bedrock agents do not report a tool-call log.")
  @example(#[])
  swaig_log: Record<unknown>[];

  @doc("The agent's answer to your `post_prompt`, as plain text.")
  @example("Caller booked a ride from 123 Main St to the airport for 6pm.")
  conversation_summary: string;
}
