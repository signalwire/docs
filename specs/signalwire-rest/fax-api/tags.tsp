import "@typespec/openapi3";

const LOGS_TAG = "Logs";

const LOGS_TAG_METADATA = #{
  description: "Endpoints related to accessing fax logs",
  externalDocs: #{
    url: "https://developer.signalwire.com/rest/signalwire-rest/endpoints/fax",
    description: "Developer documentation on Fax API endpoints",
  },
};