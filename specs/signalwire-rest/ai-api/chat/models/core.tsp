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
  The publicly reachable URL serving your agent's SWML. `localhost` and private network addresses
  cannot be reached by SignalWire.
  """;

const conversationTimeoutDescription = "Seconds a conversation may sit idle before it ends.";

const userMetaDataDescription = "Arbitrary data about the user, included in webhooks generated for this conversation.";

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

// Member names carry the meaning for anyone reading this source; the emitter keeps only the values,
// and what each one means is documented once on the error codes page rather than duplicated here.
@doc("""
  Why a method failed. `-32600` and below are the standard JSON-RPC codes; the rest are specific to
  AI chat. See [AI chat errors](/docs/apis/error-codes#ai-chat) for the codes callers should handle
  and what they mean.
  """)
enum ChatErrorCode {
  CONVERSATION_NOT_FOUND: -32001,
  CONFIG_FETCH_ERROR: -32002,
  MODEL_PROVIDER_ERROR: -32003,
  DATABASE_ERROR: -32004,
  RATE_LIMIT_EXCEEDED: -32005,
  CHAT_RATE_LIMITED: -32006,
  CHAT_IN_PROGRESS: -32007,
  CONFIG_VALIDATION_ERROR: -32008,
  AUTH_REQUIRED: -32009,
  INVALID_REQUEST: -32600,
  METHOD_NOT_FOUND: -32601,
  INVALID_PARAMS: -32602,
  INTERNAL_ERROR: -32603,
  PARSE_ERROR: -32700,
}

@doc("A JSON-RPC error returned for the requested method.")
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
  A JSON-RPC method failure returned under HTTP 200. After confirming the HTTP status, inspect the
  envelope for this `error` member.
  """)
model ChatErrorResponse {
  ...JsonRpcResponseEnvelope;

  @doc("The error that ended this call.")
  error: ChatError;
}
