import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const sidebar: SidebarsConfig = {
  apisidebar: [
    {
      type: "doc",
      id: "rest/signalwire-rest/endpoints/messaging/message-api",
    },
    {
      type: "category",
      label: "Logs",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/messaging/logs",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/messaging/list-logs",
          label: "List Logs",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/messaging/get-log",
          label: "Find a Log by ID",
          className: "api-method get",
        },
      ],
    },
  ],
};

export default sidebar.apisidebar;
