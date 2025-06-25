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
  parameters: #{
    id: callId,
    command: "calling.ai_hold",
    params: #{}
  }
};

const unholdCallExample = #{
  parameters: #{
    id: callId,
    command: "calling.ai_unhold", 
    params: #{}
  }
};

const aiMessageExample = #{
  parameters: #{
    id: callId,
    command: "calling.ai_message",
    params: #{
      role: "system",
      message_text: "You are now in expert mode. Provide detailed technical responses and use industry terminology."
    }
  }
};

const createCallExample = #{
  parameters: #{
    command: "dial",
    params: #{
      from: "+15551234567",
      to: "+15559876543", 
      caller_id: "+15551234567",
      url: "https://example.com/swml",
      fallback_url: "https://example.com/fallback"
    }
  }
};

const updateCallExample = #{
  parameters: #{
    id: callId,
    command: "update",
    params: #{
      swml: "{'version': '1.0.0', 'sections': { 'main': [{ 'answer': {}},{ 'play': { 'urls': ['say:Thank you for calling. Goodbye!']}}]}}",
      fallback_url: "https://example.com/fallback"
    }
  }
};

// Example metadata for use with @opExample decorator
const exampleMetadata = #{
  hangupCall: #{
    title: "Hangup active call",
    description: "Terminate an active call by hanging up"
  },
  holdCall: #{
    title: "Hold active call",
    description: "Put an active AI call on hold, pausing the conversation"
  },
  unholdCall: #{
    title: "Unhold active call", 
    description: "Resume an AI call that was previously put on hold"
  },
  aiMessage: #{
    title: "Inject AI message",
    description: "Send a message to the AI conversation to modify behavior or add context"
  },
  createCall: #{
    title: "Create new call",
    description: "Initiate a new call using a webhook URL to handle call logic"
  },
  updateCall: #{
    title: "Update active call",
    description: "Modify an active call's behavior using new SWML instructions"
  }
};