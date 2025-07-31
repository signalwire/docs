import "@typespec/openapi3";

const CALLS_TAG = "Calls";

const CALLS_TAG_METADATA = #{
  description: "Endpoints related to creating and managing calls",
  externalDocs: #{
    url: "https://developer.signalwire.com/rest/signalwire-rest/endpoints/calling/calls",
    description: "Developer documentation on Calling API Call endpoints",
  },
};