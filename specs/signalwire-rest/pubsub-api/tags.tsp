import "@typespec/openapi3";

const PUBSUB_TOKENS_TAG = "PubSub Tokens";

const PUBSUB_TOKENS_TAG_METADATA = #{
  description: "Endpoints related to creating & managing PubSub Tokens",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on PubSub API endpoints",
  },
};
