import "@typespec/openapi3";

const MESSAGE_LOGS_TAG = "Logs";

const MESSAGE_LOGS_TAG_METADATA = #{
  description: "Endpoints related to accessing message logs",
  externalDocs: #{
    url: "https://developer.signalwire.com/rest/signalwire-rest/endpoints/messaging",
    description: "Developer documentation on Message API endpoints",
  },
};
