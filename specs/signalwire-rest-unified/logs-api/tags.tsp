import "@typespec/openapi3";

const CONFERENCE_LOGS_TAG = "Conference Logs";

const CONFERENCE_LOGS_TAG_METADATA = #{
  description: "Manage and query conference log data.",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on SignalWire REST APIs",
  },
};
