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

@doc("What went wrong. The `message` is deliberately coarse and does not describe internals; when diagnosing, the detail you need is usually in your own agent's logs or in the SWML you served.")
model ChatError {
  @doc("The error code. See the error codes table on this endpoint for what each one means.")
  @example(-32001)
  code: int32;

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
