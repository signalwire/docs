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
    Who produced the entry: `system`, `user`, `assistant`, or `tool`. Internal markers such as
    `system-log` also appear, so filter to the roles you mean to read rather than assuming the set.
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
