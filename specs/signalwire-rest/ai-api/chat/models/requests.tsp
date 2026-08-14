import "@typespec/http";
import "@typespec/openapi3";
import "@typespec/json-schema";
import "./core.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using TypeSpec.JsonSchema;

namespace SignalWireAPI.AI;

// ============================================
// create_conversation
// ============================================

@summary("create_conversation")
model ChatCreateConversationRequest {
  ...JsonRpcRequestEnvelope;

  @doc("Creates a conversation, or resets an existing one when `reinit` is set.")
  @example("create_conversation")
  method: "create_conversation";

  @doc("The parameters for `create_conversation`.")
  params: {
    @doc(conversationIdDescription)
    @example("conv-123")
    id: string;

    @doc(configUrlDescription)
    @example("https://your-agent.example.com/swml")
    config_url: url;

    @doc("An opening message from the user, sent as part of creating the conversation.")
    @example("I need help with an order")
    user_message?: string;

    @doc(conversationTimeoutDescription)
    @example(1800)
    conversation_timeout?: int32 = 3600;

    @doc(userMetaDataDescription)
    @example(#{ customer_tier: "premium" })
    user_meta_data?: Record<unknown>;

    @doc(reinitDescription)
    @example(true)
    reinit?: boolean = false;
  };
}

// ============================================
// chat
// ============================================

@summary("chat")
model ChatSendMessageRequest {
  ...JsonRpcRequestEnvelope;

  @doc("""
    Sends a message and returns the agent's reply. One request is one full turn, including any tool
    calls the agent makes along the way, so expect this to take seconds rather than milliseconds.
    """)
  @example("chat")
  method: "chat";

  @doc("The parameters for `chat`.")
  params: {
    @doc(conversationIdDescription)
    @example("conv-123")
    id: string;

    @doc("The message to send.")
    @example("Where is order A-771?")
    message: string;

    @doc("""
      Who the message is from. A `system` message steers the agent without appearing as something
      the user said.
      """)
    @example("user")
    role?: "user" | "system" = "user";

    @doc("""
      Creates the conversation if it does not exist yet, using this SWML. Sending it here means one
      call instead of two, at the cost of never receiving `initial_message`, so the agent does not
      speak first.
      """)
    @example("https://your-agent.example.com/swml")
    config_url?: url;

    @doc("Applies only when this call creates the conversation.")
    @example(1800)
    conversation_timeout?: int32 = 3600;

    @doc(userMetaDataDescription)
    @example(#{ customer_tier: "premium" })
    user_meta_data?: Record<unknown>;

    @doc("Applies only when this call creates the conversation.")
    @example(true)
    reinit?: boolean = false;
  };
}

// ============================================
// end_conversation
// ============================================

@summary("end_conversation")
model ChatEndConversationRequest {
  ...JsonRpcRequestEnvelope;

  @doc("""
    Ends the conversation and starts post-processing: the summary, and a request to your
    `post_prompt_url` when your SWML sets one.
    """)
  @example("end_conversation")
  method: "end_conversation";

  @doc("The parameters for `end_conversation`.")
  params: {
    @doc(conversationIdDescription)
    @example("conv-123")
    id: string;
  };
}

// ============================================
// delete
// ============================================

@summary("delete")
model ChatDeleteRequest {
  ...JsonRpcRequestEnvelope;

  @doc("Removes the conversation and its messages. Nothing is post-processed and no webhook fires.")
  @example("delete")
  method: "delete";

  @doc("The parameters for `delete`.")
  params: {
    @doc(conversationIdDescription)
    @example("conv-123")
    id: string;
  };
}

// ============================================
// chat_log
// ============================================

@summary("chat_log")
model ChatLogRequest {
  ...JsonRpcRequestEnvelope;

  @doc("Reads the conversation back. Changes nothing.")
  @example("chat_log")
  method: "chat_log";

  @doc("The parameters for `chat_log`.")
  params: {
    @doc(conversationIdDescription)
    @example("conv-123")
    id: string;
  };
}

// ============================================
// summarize
// ============================================

@summary("summarize")
model ChatSummarizeRequest {
  ...JsonRpcRequestEnvelope;

  @doc("""
    Generates a summary of the conversation on demand. Limited to one call per minute per
    conversation; over that returns `-32005`.
    """)
  @example("summarize")
  method: "summarize";

  @doc("""
    The parameters for `summarize`. The sampling list is closed. Any key not listed here is
    rejected.
    """)
  params: {
    @doc(conversationIdDescription)
    @example("conv-123")
    id: string;

    @doc("How to summarize. Overrides the `post_prompt` text in your SWML for this call only.")
    @example("List the order numbers discussed and whether each was resolved.")
    summary_prompt?: string;

    @doc("Sampling temperature for the summary.")
    @example(0.3)
    temperature?: float32 = 0.3;

    @doc("Nucleus sampling cutoff for the summary.")
    @example(0.3)
    top_p?: float32 = 0.3;

    @doc("Penalty applied to tokens by how often they have already appeared.")
    @example(1.0)
    frequency_penalty?: float32 = 1.0;

    @doc("Penalty applied to tokens that have appeared at all.")
    @example(1.0)
    presence_penalty?: float32 = 1.0;

    @doc("Longest summary to generate, in tokens.")
    @example(512)
    max_tokens?: int32 = 512;
  };
}

// ============================================
// The request union
// ============================================

@discriminated(#{ discriminatorPropertyName: "method", envelope: "none" })
@doc("""
  A JSON-RPC request. The `method` field selects which of the six methods runs, and `params` carries
  that method's arguments.

  `params` carries payload only: `project_id`, `token`, and `space_id` are not valid keys there, and
  a request carrying them is rejected.
  """)
union ChatRequest {
  create_conversation: ChatCreateConversationRequest,
  chat: ChatSendMessageRequest,
  end_conversation: ChatEndConversationRequest,
  delete: ChatDeleteRequest,
  chat_log: ChatLogRequest,
  summarize: ChatSummarizeRequest,
}
