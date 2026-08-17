import "@typespec/openapi3";

const AI_CHAT_TAG = "AI Chat";

const AI_CHAT_TAG_METADATA = #{
  description: "Endpoints related to holding a text conversation with an AI agent",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on the AI Chat API endpoint",
  },
};
