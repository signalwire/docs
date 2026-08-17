import "@typespec/http";
import "@typespec/openapi3";
import "@typespec/json-schema";
import "./core.tsp";
// A conversation entry is one contract however it is fetched, so the transcript this endpoint
// returns reuses the model the AI webhooks already publish rather than forking a second one.
import "../../../webhooks/ai/models/common.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using TypeSpec.JsonSchema;

namespace SignalWireAPI.AI;

// ============================================
// create_conversation
// ============================================

@summary("create_conversation result")
model ChatConversationCreatedResponse {
  ...JsonRpcResponseEnvelope;

  @doc("The conversation that now exists.")
  result: {
    @doc("""
      What happened. `created` for a new conversation, `reinitialized` when `reinit` reset an
      existing one, and `exists` when one was already there and was left alone.
      """)
    @example("created")
    status: "created" | "reinitialized" | "exists";

    @doc("The conversation id.")
    @example("conv-123")
    id: string;

    @doc("""
      The agent's opening line, when the agent greets first.
      """)
    @example("Hi! How can I help?")
    initial_message?: string | null;
  };
}

// ============================================
// chat
// ============================================

@summary("chat result")
model ChatReplyResponse {
  ...JsonRpcResponseEnvelope;

  @doc("The agent's turn.")
  result: {
    @doc("The agent's reply. When this call created the conversation, this is the agent's opening message.")
    @example("Order A-771 shipped on Tuesday and is out for delivery today.")
    response: string;

    @doc("""
      An event one of your tools raised for your application to act on, present only when the turn
      produced one. The contents under `event` are whatever your tool sent, so the shape is yours;
      the convention is a `type` key your client can switch on.
      """)
    @example(#{
      event: #{ type: "order_located", order_id: "A-771", eta: "2026-08-14" },
    })
    user_event?: Record<unknown>;
  };
}

// ============================================
// end_conversation
// ============================================

@summary("end_conversation result")
model ChatConversationEndedResponse {
  ...JsonRpcResponseEnvelope;

  @doc("The outcome of ending the conversation.")
  result: {
    @doc("`ended` when the conversation was ended, `not_found` when no conversation had that id.")
    @example("ended")
    status: "ended" | "not_found";

    @doc("The conversation id.")
    @example("conv-123")
    id: string;
  };
}

// ============================================
// delete
// ============================================

@summary("delete result")
model ChatConversationDeletedResponse {
  ...JsonRpcResponseEnvelope;

  @doc("The outcome of deleting the conversation.")
  result: {
    @doc("`deleted` when the conversation was removed, `not_found` when no conversation had that id.")
    @example("deleted")
    status: "deleted" | "not_found";

    @doc("The conversation id.")
    @example("conv-123")
    id: string;
  };
}

// ============================================
// chat_log
// ============================================

@summary("chat_log result")
model ChatTranscriptResponse {
  ...JsonRpcResponseEnvelope;

  @doc("The entries recorded for the conversation.")
  result: {
    @doc("""
      Every entry in the conversation, in order. Alongside the dialogue this can carry your own
      prompt and other non-dialogue entries, so filter to `user` and `assistant` before displaying a
      transcript.
      """)
    chat_log: Webhooks.AI.AICallLogEntry[];

    // Left open deliberately: a chat conversation's timeline entries are not verifiable from a
    // public source, and the voice equivalent (Webhooks.AI.AICallTimelineEntry) names a `ts` field
    // this pathway has not been confirmed to use.
    @doc("""
      Structured timeline entries returned for the conversation. The entry shape depends on the
      events recorded for that conversation.
      """)
    call_timeline?: Record<unknown>[];
  };
}

// ============================================
// summarize
// ============================================

@summary("summarize result")
@doc("""
  The result of requesting a summary. A generated summary is returned in `summary`. If summary
  generation fails after the request succeeds, the reason can be returned in `error`; this is not
  a JSON-RPC error and carries no code.
  """)
model ChatSummaryResponse {
  ...JsonRpcResponseEnvelope;

  @doc("The outcome of summarizing.")
  result: {
    @doc("The generated summary.")
    @example("Customer asked about order A-771, confirmed the delivery date, and ended satisfied.")
    summary?: string;

    @doc("Why no summary was produced.")
    @example("Summary generation failed")
    error?: string;
  };
}

// ============================================
// The response union
// ============================================

@doc("""
  A JSON-RPC response. Which result you get follows from the method you sent; a response echoes no
  `method` of its own.

  Check the HTTP status first. On HTTP 200, inspect the envelope for an `error` member. HTTP-level
  errors returned with another status are not JSON-RPC envelopes.
  """)
union ChatResponse {
  ChatConversationCreatedResponse,
  ChatReplyResponse,
  ChatConversationEndedResponse,
  ChatConversationDeletedResponse,
  ChatTranscriptResponse,
  ChatSummaryResponse,
  ChatErrorResponse,
}

// ============================================
// HTTP-level failures
// ============================================

@doc("The request body was not valid JSON. The response is not a JSON-RPC envelope.")
@error
model ChatInvalidJsonError {
  @statusCode statusCode: 400;

  @doc("Details about the malformed request body.")
  @example(#[
    #{
      type: "validation_error",
      code: "not_a_valid_json",
      message: "JSON you submitted is not valid",
      attribute: null,
      url: "https://signalwire.com/docs/apis/error-codes",
    }
  ])
  errors: Types.StatusCodes.RestApiErrorItem[];
}

@doc("Credentials are missing or rejected, the request targets another Space, the token does not include the chat scope, or the account must be verified before using this endpoint.")
@error
model ChatUnauthorizedError {
  @statusCode statusCode: 401;
  @header contentType: "text/plain";
  @body body: "Unauthorized";
}

@doc("The account must be verified before it can use this endpoint.")
@error
model ChatAccountVerificationError {
  @statusCode statusCode: 401;
  @header contentType: "application/json";
  @body body: {
    @doc("How to make the account eligible to use this endpoint.")
    @example("Please validate a phone number to access your account.")
    message: string;
  };
}

@doc("The AI chat service did not respond before the request timed out or could not be reached. This is not a JSON-RPC error and carries no code.")
@error
model ChatServiceUnavailableError {
  @statusCode statusCode: 502;

  @doc("A short description of the failure.")
  @example("AI chat service is unavailable")
  error: string;
}
