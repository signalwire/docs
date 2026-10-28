import "../../../types";

namespace SignalWireAPI.Webhooks.AI;

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

@doc("One tool call the agent made, in the order it was made.")
model AISwaigLogEntry {
  @doc("The name of the function the agent called.")
  @example("get_weather")
  command_name: string;

  @doc("The arguments it passed, as the raw string the model produced.")
  @example("{\"city\":\"San Francisco\"}")
  command_arg: string;

  @doc("When the call was made, as a Unix timestamp in seconds.")
  @example(1694541334)
  epoch_time: integer;

  @doc("Always `true` when present, meaning the function ran inside the platform rather than on your server.")
  @example(true)
  native?: boolean;

  @doc("""
    How many times the function may still be called, or `endless` when it has no limit. Present only
    on a function you limited.
    """)
  @example(2)
  active_count?: integer | string;

  @doc("The URL the function was served from. Present when the call reached your server.")
  @example("https://example.com/tools/get_weather")
  url?: string;

  @doc("The body sent to your server. Present when the call reached it.")
  post_data?: Record<unknown>;

  @doc("The response your server returned. Present when the call reached it and got a reply.")
  post_response?: Record<unknown>;

  @doc("A response that arrived after the agent had already moved on. Present only when that happened.")
  delayed_post_response?: Record<unknown>;

  @doc("The MCP server the tool was served from. Present only for an MCP-backed tool.")
  mcp_url?: string;

  @doc("The tool name on that MCP server. Present only for an MCP-backed tool.")
  mcp_tool?: string;

  @doc("What the MCP server returned. Present only for an MCP-backed tool.")
  mcp_response?: string;

  @doc("Always `true` when present, meaning the MCP call failed.")
  @example(true)
  mcp_error?: boolean;

  @doc("""
    The result of checking the function's
    [semantic gates](/docs/swml/reference/calling/ai/swaig/functions/gates). Present only on a call
    to a gated function. When the function was blocked, `post_response` holds what the agent got
    instead of a reply from your server: the failing gate's `on_fail` output, or the temporary-problem
    message when the check ended in an error. An `on_fail` with `post_process: true` and actions is
    in `delayed_post_response` instead.
    """)
  semantic_gates?: AISemanticGateRecord;

  @doc("""
    How many of the caller's video frames were sent to your server with the call. Present only when
    a function with its own `visual_input` called your server. The frames themselves are never in
    the log.
    """)
  @example(1)
  visual_input_frames?: integer;
}

@doc("One gate's result within a semantic gate check, in the order the gates are listed.")
model AISemanticGateResult {
  @doc("The gate's `id`, or `gate_1`, `gate_2`, and so on when it has none.")
  @example("explicit_request")
  id: string;

  @doc("The gate's `threshold`.")
  @example(0.95)
  threshold: float;

  @doc("""
    The probability that the answer is yes. Present once the decision model answered for the gate;
    a gate that failed for lack of a video frame has `reason` instead.
    """)
  @example(0.98)
  confidence?: float;

  @doc("Whether the gate passed. Present once the gate was decided.")
  @example(true)
  pass?: boolean;

  @doc("`no_frame` when the gate failed because the call had no video frame to show it.")
  @example("no_frame")
  reason?: string;
}

@doc("""
  The record of one semantic gate check. Some fields appear only when the check got far enough to
  have them.
  """)
model AISemanticGateRecord {
  @doc("A unique ID for the check.")
  @example("d7b5c0f2-6a1e-4c8b-9f3d-2b7e1a0c5d44")
  evaluation_id: string;

  @doc("""
    Where the check ran: `text` for a standard agent, `oart` for a realtime (speech-to-speech)
    agent, or `post` for the post-prompt agent after the call.
    """)
  @example("text")
  phase: "text" | "oart" | "post";

  @doc("How many attempts the check made. Present once the check was sent.")
  @example(1)
  attempts?: integer;

  @doc("How long the check took, in milliseconds.")
  @example(212)
  latency_ms: integer;

  @doc("""
    How the check ended:

    - `pass`: every gate passed, and the function ran.
    - `disabled`: gates are turned off for the call (`semantic_gates_enabled: false`), and the
      function ran.
    - `fail`: a gate answered under its threshold or had no video frame to look at.
    - `timeout`: the check ran out of time (`semantic_gate_timeout_ms`).
    - `provider_error`: the decision model refused or failed.
    - `invalid_response`: the decision model's answer could not be used.
    - `invalid_arguments`: the agent's arguments for the function were missing or not a valid JSON
      object.
    - `config_error`: the check could not be set up, for example a request too large to send.
    - `aborted`: the call ended during the check.

    The function runs only on `pass` and `disabled`.
    """)
  @example("fail")
  outcome:
    | "pass"
    | "disabled"
    | "fail"
    | "timeout"
    | "provider_error"
    | "invalid_response"
    | "invalid_arguments"
    | "config_error"
    | "aborted";

  @doc("Whether the function ran.")
  @example(false)
  dispatched: boolean;

  @doc("A short description of the error. Present when `outcome` is an error.")
  @example("the call went away")
  error?: string;

  @doc("""
    How many of the caller's video frames the check took. Present when a gate has `visual_input` and
    the check got as far as taking frames.
    """)
  @example(1)
  frames?: integer;

  @doc("""
    How many of the oldest conversation entries were left out so the check would fit. Present only
    when any were.
    """)
  @example(4)
  conversation_dropped?: integer;

  @doc("Each gate's result, in the order the gates are listed.")
  @example(#[
    #{ id: "explicit_request", threshold: 0.95, confidence: 0.98, pass: true },
    #{ id: "understands_terms", threshold: 0.9, confidence: 0.41, pass: false }
  ])
  gates: AISemanticGateResult[];
}

@doc("A function the post-prompt agent called that a semantic gate blocked.")
model AISemanticGateBlockedCall {
  @doc("The name of the blocked function.")
  @example("refund")
  function: string;

  @doc("The check's `outcome`.")
  @example("fail")
  outcome:
    | "fail"
    | "timeout"
    | "provider_error"
    | "invalid_response"
    | "invalid_arguments"
    | "config_error"
    | "aborted";
}

@doc("The semantic gate checks across the whole call.")
model AISemanticGateTally {
  @doc("How many checks were recorded, including `disabled` ones.")
  @example(3)
  evaluations: integer;

  @doc("How many checks passed.")
  @example(1)
  pass: integer;

  @doc("How many checks failed because a gate answered no or had no video frame.")
  @example(1)
  fail: integer;

  @doc("How many checks ended in an error, such as a timeout.")
  @example(0)
  error: integer;

  @doc("How many checks were skipped because gates are turned off for the call.")
  @example(1)
  disabled: integer;

  @doc("The total time spent on checks, in milliseconds.")
  @example(540)
  latency_ms_total: integer;

  @doc("The longest single check, in milliseconds.")
  @example(310)
  latency_ms_max: integer;
}

@doc("Timing and token counts for one generated reply.")
model AIResponseTiming {
  @doc("The reply text. Redacted when you enable `redact_prompt`.")
  @example("Your ride is booked for 6pm.")
  response: string;

  @doc("How many words the reply contained.")
  @example(6)
  response_word_count: integer;

  @doc("How long the reply took to produce, in seconds.")
  @example(1.42)
  answer_time: float;

  @doc("""
    How long the model spent generating, in seconds. For an [`ai`](/docs/swml/reference/calling/ai)
    agent this is the span from the first token to the last; for an
    [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) agent it is `answer_time` less a
    fixed startup estimate, so treat it as approximate there.
    """)
  @example(0.31)
  token_time: float;

  @doc("How many tokens the reply used.")
  @example(53)
  tokens: integer;

  @doc("Average tokens per second across the reply.")
  @example(37.3)
  avg_tps: float;

  @doc("Tokens per second for this reply.")
  @example(41.2)
  tps: float;
}

@doc("""
  One entry in the conversation. Beyond `role` and `content`, an entry carries whatever per-turn
  detail applies to it, such as recognition confidence on a caller turn or timings on a reply.
  """)
model AICallLogEntry is Record<unknown> {
  @doc("""
    Who produced the entry. Common roles include `system`, `user`, `assistant`, and `tool`. Other
    roles may appear, so filter to the roles your application uses rather than assuming a fixed set.
    """)
  @example("assistant")
  role: string;

  @doc("The text of the entry.")
  @example("Your ride is booked for 6pm.")
  content: string;

  @doc("When the entry was added, as a Unix timestamp in microseconds. Omitted on entries without one.")
  @example(1694541297950440)
  timestamp?: int64;

  @doc("The tool calls the agent made on this turn. Present only on a turn that made any.")
  tool_calls?: Record<unknown>[];
}
