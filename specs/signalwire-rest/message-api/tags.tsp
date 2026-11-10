import "@typespec/openapi3";

const MESSAGE_LOGS_TAG = "Message Logs";

const MESSAGE_LOGS_TAG_METADATA = #{
  description: "Endpoints related to accessing message logs",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on Message API endpoints",
  },
};

const MESSAGES_TAG = "Messages";

const MESSAGES_TAG_METADATA = #{
  description: "Endpoints for sending and redacting messages",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on Message API endpoints",
  },
};

const WHATSAPP_BUSINESSES_TAG = "WhatsApp Businesses";

const WHATSAPP_BUSINESSES_TAG_METADATA = #{
  description: "List the WhatsApp Business Accounts connected to your Space.",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on Message API endpoints",
  },
};

const WHATSAPP_NUMBERS_TAG = "WhatsApp Numbers";

const WHATSAPP_NUMBERS_TAG_METADATA = #{
  description: "List and retrieve the WhatsApp numbers connected to your Space.",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on Message API endpoints",
  },
};

const WHATSAPP_TEMPLATES_TAG = "WhatsApp Templates";

const WHATSAPP_TEMPLATES_TAG_METADATA = #{
  description: "Create and manage the Meta-approved templates required to start WhatsApp conversations.",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on Message API endpoints",
  },
};
