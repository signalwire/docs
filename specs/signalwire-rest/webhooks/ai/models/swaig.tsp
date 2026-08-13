import "./common.tsp";

namespace SignalWireAPI.Webhooks.AI;

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

  @doc("The ID of the call. On a chat conversation this carries the conversation id instead.")
  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
  call_id: string;

  @doc("The ID of the AI session on the call.")
  @example("a0d4e6e5-5d07-413d-9668-55542992eec0")
  ai_session_id: string;

  @doc("""
    The conversation ID, when the AI session has one. A text conversation held over the
    [AI chat endpoint](/docs/apis/rest/ai-chat/chat-methods) always has one, and it matches
    `call_id`.
    """)
  conversation_id?: string;

  @doc("The name of your AI application.")
  @example("ai")
  app_name: string;

  @doc("The AI session's current `global_data`, when it has any.")
  @example(#{
    customer_tier: "premium",
    pickup_address: "123 Main St, Springfield",
  })
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

  @doc("""
    The kind of conversation the agent is running. `voice` for a call, `chat` for a text conversation
    held over the [AI chat endpoint](/docs/apis/rest/ai-chat/chat-methods).
    """)
  @example("voice")
  conversation_type: string;

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
  call_log?: AICallLogEntry[];

  @doc("The full, unredacted conversation so far. Included when you enable `swaig_post_conversation`.")
  raw_call_log?: AICallLogEntry[];
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

  @doc("""
    The agent's current `global_data`. Alongside anything you seeded, the session adds
    `caller_id_name` and `caller_id_number` when the call carries them.
    """)
  @example(#{
    customer_tier: "premium",
    pickup_address: "123 Main St, Springfield",
  })
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
  times?: AIResponseTiming[];

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
