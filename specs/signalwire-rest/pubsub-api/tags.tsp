import "@typespec/openapi3";

const TOKENS_TAG = "Tokens";

const TOKENS_TAG_METADATA = #{
  description: "Endpoints related to creating & managing PubSub Tokens",
  externalDocs: #{
    url: "https://developer.signalwire.com/rest/signalwire-rest/endpoints/pubsub/tokens",
    description: "Developer documentation on PubSub API endpoints",
  },
};