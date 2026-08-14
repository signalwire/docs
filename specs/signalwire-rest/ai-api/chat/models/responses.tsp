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
      The agent's opening line, when the agent greets first. Generating it is a turn, and a turn
      bills. A page that creates a conversation on load pays for one whether or not the visitor
      types anything.
      """)
    @example("Hi! How can I help?")
    initial_message?: string;
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

  @doc("The conversation as the service holds it.")
  result: {
    @doc("""
      Every entry in the conversation, in order. Alongside the dialogue this carries your own prompt
      as `system`, plus internal markers such as `system-log`, so filter to `user` and `assistant`
      before displaying a transcript, or you publish your prompt to your users.
      """)
    chat_log: Webhooks.AI.AICallLogEntry[];

    // Left open deliberately: a chat conversation's timeline entries are not verifiable from a
    // public source, and the voice equivalent (Webhooks.AI.AICallTimelineEntry) names a `ts` field
    // this pathway has not been confirmed to use.
    @doc("""
      A flat stream of structured events for the conversation, with microsecond timestamps. Entries
      cover session start and end, context switches, and tool calls.
      """)
    call_timeline?: Record<unknown>[];
  };
}

// ============================================
// summarize
// ============================================

@summary("summarize result")
@doc("""
  The summary, or the reason one could not be produced. Exactly one of `summary` and `error` is
  present.

  Note that this `error` rides the success envelope and describes a failure to generate rather than
  a failed request, so it is not a JSON-RPC error and carries no code.
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

  Both success and failure arrive under HTTP 200, so check for an `error` key rather than reading
  the status code.
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

@doc("SignalWire could not reach the AI chat service. This is not a JSON-RPC error and carries no code.")
@error
model ChatServiceUnavailableError {
  @statusCode statusCode: 502;

  @doc("A short description of the failure.")
  @example("AI chat service is unavailable")
  error: string;
}
