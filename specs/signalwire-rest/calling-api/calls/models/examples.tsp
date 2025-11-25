/**
 * Operation examples for the Calling API
 *
 * These examples can be imported and used with @opExample decorator on operations
 */
const callId = "3fa85f64-5717-4562-b3fc-2c963f66afa6";

// Call command examples
const dialCallExample = #{
  request: #{
    command: "dial",
    params: #{
      from: "+15551234567",
      to: "+15559876543",
      url: "https://example.com/swml",
      caller_id: "+15551234567",
      status_url: "https://example.com/status_callback",
      status_events: #["answered", "ended"],
    },
  },
};

const updateCallExample = #{
  request: #{
    command: "update",
    params: #{
      id: callId,
      url: "https://example.com/swml",
      fallback_url: "https://example.com/fallback",
    },
  },
};

const hangupCallExample = #{
  request: #{
    command: "calling.end",
    id: callId,
    params: #{ reason: "hangup" },
  },
};

const holdCallExample = #{
  request: #{
    command: "calling.ai_hold",
    id: callId,
    params: #{},
  },
};

const unholdCallExample = #{
  request: #{
    command: "calling.ai_unhold",
    id: callId,
    params: #{},
  },
};

const aiMessageExample = #{
  request: #{
    command: "calling.ai_message",
    id: callId,
    params: #{
      role: "system",
      message_text: "You are now in expert mode. Provide detailed technical responses and use industry terminology.",
    },
  },
};
