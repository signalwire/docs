import "@typespec/openapi3";

const PROJECT_TOKENS_TAG = "Project Tokens";

const PROJECT_TOKENS_TAG_METADATA = #{
  description: "Manage API tokens for authentication.",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on SignalWire REST APIs",
  },
};
