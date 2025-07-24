import "@typespec/openapi3";

const LOGS_TAG = "Logs";

const LOGS_TAG_METADATA = #{
  description: "Endpoints related to accessing voice logs",
  externalDocs: #{
    url: "https://developer.signalwire.com/rest/signalwire-rest/endpoints/voice",
    description: "Developer documentation on Voice API endpoints",
  },
};
