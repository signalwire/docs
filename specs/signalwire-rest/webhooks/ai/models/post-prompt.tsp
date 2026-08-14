import "./common.tsp";

namespace SignalWireAPI.Webhooks.AI;

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

@doc("""
  One event on the call, in order. Beyond `type`, an entry carries the fields belonging to that type.
  """)
model AICallTimelineEntry is Record<unknown> {
  @doc("""
    What happened. `user_input`, `ai_response`, and `tool_result` cover the conversation; `pronounce`
    and `text_normalize` record text rewrites; anything else is the name of a logged action.
    """)
  @example("ai_response")
  type: string;

  @doc("When it happened, as a Unix timestamp in microseconds. Omitted when the source entry had no timestamp.")
  @example(1694541297950440)
  ts?: float;
}

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

  @doc("""
    The kind of conversation the agent ran. `voice` for a call, `chat` for a text conversation held
    over the [AI chat endpoint](/docs/apis/rest/ai-chat/chat-methods).
    """)
  @example("voice")
  conversation_type: string;

  @doc("The ID of the call. On a chat conversation this carries the conversation id instead.")
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
    Included when `action` is `post_conversation`.
    """)
  @example(#[
    #{ role: "system", content: "You dispatch taxis." },
    #{ role: "user", content: "I need a ride to the airport." }
  ])
  call_log?: AICallLogEntry[];

  @doc("""
    The conversation, unfiltered and append-only. Interruption detail appears here and nowhere else.
    Included when `action` is `post_conversation`.
    """)
  raw_call_log?: AICallLogEntry[];

  @doc("""
    A flat stream of typed events aligned to `raw_call_log`, for replaying the call in order.
    Included when the session produced any.
    """)
  call_timeline?: AICallTimelineEntry[];

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
    Per-response performance metrics, one entry per generated reply. Included once the session has
    any.
    """)
  times?: AIResponseTiming[];

  @doc("SWML variables for the call. Included when the call carries SWML state.")
  SWMLVars?: Record<unknown>;

  @doc("SWML call state. Included when the call carries SWML state.")
  SWMLCall?: Record<unknown>;

  @doc("""
    The agent's answer to your `post_prompt`. Included when `action` is `post_conversation`.
    """)
  post_prompt_data?: AIPostPromptData;

  @doc("""
    The session's final `global_data`. Alongside anything you seeded, the session adds
    `caller_id_name` and `caller_id_number` when the call carries them. Included when `action` is
    `post_conversation`.
    """)
  @example(#{
    customer_tier: "premium",
    pickup_address: "123 Main St, Springfield",
  })
  global_data?: Record<unknown>;

  @doc("""
    Every tool call the agent made, in order. Included when `action` is `post_conversation`.
    """)
  swaig_log?: AISwaigLogEntry[];

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
  call_log: AICallLogEntry[];

  @doc("A copy of `call_log`. Bedrock agents do not keep a separate unfiltered log.")
  raw_call_log: AICallLogEntry[];

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
  times?: AIResponseTiming[];

  @doc("""
    The number of billable minutes, with a minimum of one. Fractional durations are kept as they are;
    only a call under a minute is raised to `1`. Included once the agent has stopped.
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
  swaig_log: AISwaigLogEntry[];

  @doc("The agent's answer to your `post_prompt`, as plain text.")
  @example("Caller booked a ride from 123 Main St to the airport for 6pm.")
  conversation_summary: string;
}
