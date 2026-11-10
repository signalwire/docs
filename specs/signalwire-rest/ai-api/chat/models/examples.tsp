namespace SignalWireAPI.AI;

/**
 * Operation examples for the AI Chat API
 *
 * These examples can be imported and used with the @opExample decorator on operations
 */
const conversationId = "conv-123";

const configUrl = "https://your-agent.example.com/swml";

const createConversationExample = #{
  request: #{
    jsonrpc: "2.0",
    id: "req-1",
    method: "create_conversation",
    params: #{
      id: conversationId,
      config_url: configUrl,
      conversation_timeout: 1800,
      user_meta_data: #{ customer_tier: "premium" },
    },
  },
};

const chatExample = #{
  request: #{
    jsonrpc: "2.0",
    id: "req-2",
    method: "chat",
    params: #{ id: conversationId, message: "Where is order A-771?" },
  },
};

const endConversationExample = #{
  request: #{
    jsonrpc: "2.0",
    id: "req-3",
    method: "end_conversation",
    params: #{ id: conversationId },
  },
};

const deleteConversationExample = #{
  request: #{
    jsonrpc: "2.0",
    id: "req-4",
    method: "delete",
    params: #{ id: conversationId },
  },
};

const chatLogExample = #{
  request: #{
    jsonrpc: "2.0",
    id: "req-5",
    method: "chat_log",
    params: #{ id: conversationId },
  },
};

const summarizeExample = #{
  request: #{
    jsonrpc: "2.0",
    id: "req-6",
    method: "summarize",
    params: #{
      id: conversationId,
      summary_prompt: "List the order numbers discussed and whether each was resolved.",
    },
  },
};
