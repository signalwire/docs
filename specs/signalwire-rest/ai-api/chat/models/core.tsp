import "@typespec/http";
import "@typespec/openapi3";
import "@typespec/json-schema";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using TypeSpec.JsonSchema;

namespace SignalWireAPI.AI;

// ============================================
// Reusable descriptions
// ============================================

const conversationIdDescription = "The conversation this method acts on. You choose the value when you create the conversation, and it is scoped to your project.";

const configUrlDescription = """
  The URL serving your agent's SWML. SignalWire fetches it server-to-server, so it must be
  reachable from the public internet — a `localhost` or private address creates the conversation
  and then sends every tool call nowhere.
  """;

const conversationTimeoutDescription = "Seconds a conversation may sit idle before it ends. A conversation that ends is not resumable: the next message on the same `id` silently opens a new one with none of the history.";

const userMetaDataDescription = "Arbitrary data about the user, echoed back on the webhooks this conversation produces.";

const reinitDescription = "Reset an existing conversation instead of returning it as-is. Clears the message history.";

const requestIdDescription = "Your identifier for this request, echoed back on the response so you can match the two.";

// ============================================
// JSON-RPC envelope
// ============================================

model JsonRpcRequestEnvelope {
  @doc("The JSON-RPC version. Always `2.0`.")
  @example("2.0")
  jsonrpc: "2.0";

  @doc(requestIdDescription)
  @example("req-1")
  id: string;
}

model JsonRpcResponseEnvelope {
  @doc("The JSON-RPC version. Always `2.0`.")
  @example("2.0")
  jsonrpc: "2.0";

  @doc("The `id` from your request.")
  @example("req-1")
  id: string;
}

// The per-member @doc entries below do not survive emit — OpenAPI has nowhere to put a
// description per enum value, so the emitter drops them. A numeric code is meaningless without
// its meaning, unlike a self-describing string enum, so the table repeats them here where they
// render beside the values.
@doc("""
  Why a method failed. `-32600` and below are the standard JSON-RPC codes; the rest are specific to
  AI chat.

  | Code | Meaning |
  |---|---|
  | `-32001` | No conversation with that id exists in your project |
  | `-32002` | Your `config_url` could not be fetched |
  | `-32003` | The model provider failed |
  | `-32004` | Storage failure |
  | `-32005` | Too many `summarize` calls on this conversation, which allows one per minute |
  | `-32006` | Too many messages on this conversation |
  | `-32007` | A turn is already running on this conversation |
  | `-32008` | The SWML your `config_url` served failed validation |
  | `-32009` | Credentials are missing, rejected, or lack the `chat` scope |
  | `-32600` | The JSON-RPC envelope was malformed |
  | `-32601` | No method by that name |
  | `-32602` | A required param is missing, or one carries an invalid value |
  | `-32603` | An unexpected failure |
  | `-32700` | The request body was not valid JSON |
  """)
enum ChatErrorCode {
  @doc("No conversation with that id exists in your project.")
  CONVERSATION_NOT_FOUND: -32001,

  @doc("Your `config_url` could not be fetched.")
  CONFIG_FETCH_ERROR: -32002,

  @doc("The model provider failed.")
  MODEL_PROVIDER_ERROR: -32003,

  @doc("Storage failure.")
  DATABASE_ERROR: -32004,

  @doc("Too many `summarize` calls on this conversation. The limit is one per minute.")
  RATE_LIMIT_EXCEEDED: -32005,

  @doc("Too many messages on this conversation.")
  CHAT_RATE_LIMITED: -32006,

  @doc("""
    A turn is already running on this conversation. Wait for it to return rather than retrying, which
    fails the same way.
    """)
  CHAT_IN_PROGRESS: -32007,

  @doc("The SWML your `config_url` served failed validation.")
  CONFIG_VALIDATION_ERROR: -32008,

  @doc("Credentials are missing, rejected, or lack the `chat` scope.")
  AUTH_REQUIRED: -32009,

  @doc("The JSON-RPC envelope was malformed.")
  INVALID_REQUEST: -32600,

  @doc("No method by that name.")
  METHOD_NOT_FOUND: -32601,

  @doc("A required param is missing, or one carries an invalid value.")
  INVALID_PARAMS: -32602,

  @doc("An unexpected failure.")
  INTERNAL_ERROR: -32603,

  @doc("The request body was not valid JSON.")
  PARSE_ERROR: -32700,
}

@doc("What went wrong. The `message` is deliberately coarse and does not describe internals; when diagnosing, the detail you need is usually in your own agent's logs or in the SWML you served.")
model ChatError {
  @doc("Which failure this was.")
  @example(ChatErrorCode.CONVERSATION_NOT_FOUND)
  code: ChatErrorCode;

  @doc("A short description of the failure.")
  @example("Conversation not found")
  message: string;
}

@summary("Error")
@doc("""
  A failed method. This arrives under **HTTP 200**, like a successful one — check for an `error`
  key rather than reading the status code.
  """)
model ChatErrorResponse {
  ...JsonRpcResponseEnvelope;

  @doc("The error that ended this call.")
  error: ChatError;
}
