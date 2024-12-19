import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const sidebar: SidebarsConfig = {
  apisidebar: [
    {
      type: "doc",
      id: "rest/signalwire-rest/endpoints/voice/voice-api",
    },
    {
      type: "category",
      label: "Logs",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/voice/logs",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/voice/list-logs",
          label: "List Logs",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/voice/get-log",
          label: "Find a Log by ID",
          className: "api-method get",
        },
      ],
    },
  ],
};

export default sidebar.apisidebar;
