import "@typespec/openapi3";

const AI_WEBHOOKS_TAG = "AI Webhooks";

const AI_WEBHOOKS_TAG_METADATA = #{
  description: "Callbacks an AI agent sends to your server. The same payloads apply to every surface an agent runs on — voice calls, Amazon Bedrock agents, sidecar agents, and text conversations.",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on AI webhooks",
  },
};

const CALLING_WEBHOOKS_TAG = "Calling Webhooks";

const CALLING_WEBHOOKS_TAG_METADATA = #{
  description: "Callbacks about a call: the SWML document request sent when a call arrives, and the progress of work you started on it such as a transcription or a background audio stream.",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on calling webhooks",
  },
};

const MESSAGING_WEBHOOKS_TAG = "Messaging Webhooks";

const MESSAGING_WEBHOOKS_TAG_METADATA = #{
  description: "Callbacks about a message: the SWML document request sent when a message arrives, delivery state for messages you send, and 10DLC registration state.",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on messaging webhooks",
  },
};
