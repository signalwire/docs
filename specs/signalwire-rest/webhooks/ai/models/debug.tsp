import "./common.tsp";

namespace SignalWireAPI.Webhooks.AI;

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
    A completed tool call, the same entry the post-prompt callback later reports in its `swaig_log`.
    """)
  swaig_call?: AISwaigLogEntry;

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

  @doc("The body sent to the webhook, or the input an output template was expanded against.")
  input?: Record<unknown>;

  @doc("""
    The reply the webhook produced, or the output template that matched. `null` when nothing matched.
    """)
  output?: Record<unknown> | null;

  @doc("The entry that matched. `null` when none did.")
  match?: Record<unknown> | null;

  @doc("The `error_keys` declared on the webhook. `null` when it declares none.")
  error_keys?: unknown[] | null;

  @doc("The webhook could not be evaluated.")
  error?: {
    @doc("What went wrong.")
    @example("ai: webhook error")
    error: string;

    @doc("The detail behind it.")
    @example("Webhook obj must have output or expressions")
    errorText: string;
  };

  @doc("The `expressions` entry as you wrote it. Arrives alongside `input` and `output`.")
  expression?: Record<unknown>;

  @doc("A webhook request completed, with the request and response recorded.")
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
    The final reply the webhook produced, after matching. An array reply is wrapped as
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
    trigger?:
      | "ai_function"
      | "webhook_action"
      | "gather_complete"
      | "auto_advance";
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

  @doc("""
    The response body parsed as JSON. Omitted when the body could not be parsed, where `parse_error`
    and `raw_response` carry the detail instead.
    """)
  parsed_response?: Record<unknown>;

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
