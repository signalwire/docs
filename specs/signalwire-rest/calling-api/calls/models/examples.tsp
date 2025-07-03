/**
 * Operation examples for the Calling API
 * 
 * These examples can be imported and used with @opExample decorator on operations
 */

const callId = "3fa85f64-5717-4562-b3fc-2c963f66afa6";

// Hangup Call Examples
const hangupCallExample = #{
  request: #{
    id: callId,
    command: "calling.end",
    params: #{
      reason: "hangup"
    }
  }
};

const holdCallExample = #{
  request: #{
    id: callId,
    command: "calling.ai_hold",
    params: #{}
  }
};

const unholdCallExample = #{
  request: #{
    id: callId,
    command: "calling.ai_unhold", 
    params: #{}
  }
};

const aiMessageExample = #{
  request: #{
    id: callId,
    command: "calling.ai_message",
    params: #{
      role: "system",
      message_text: "You are now in expert mode. Provide detailed technical responses and use industry terminology."
    }
  }
};

const updateCallExample = #{
  request: #{
    command: "update",
    params: #{
      id: callId,
      url: "https://example.com/swml",
      fallback_url: "https://example.com/fallback"
    }
  }
};
