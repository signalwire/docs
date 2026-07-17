import "@typespec/openapi3";

const PROJECTS_TAG = "Projects";

const PROJECTS_TAG_METADATA = #{
  description: "Manage projects and subprojects under the authenticated root project.",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on SignalWire REST APIs",
  },
};
