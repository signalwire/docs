import "@typespec/openapi3";

const CHAT_TOKENS_TAG = "Chat Tokens";

const CHAT_TOKENS_TAG_METADATA = #{
  description: "Manage Chat tokens.",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on SignalWire REST APIs",
  },
};
