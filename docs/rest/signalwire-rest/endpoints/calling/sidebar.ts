import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const sidebar: SidebarsConfig = {
  apisidebar: [
    {
      type: "doc",
      id: "rest/signalwire-rest/endpoints/calling/calling-api",
    },
    {
      type: "category",
      label: "Calls",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/calling/calls",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/calling/calls-create",
          label: "Create a Call",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/calling/calls-update",
          label: "Update a Call",
          className: "api-method put",
        },
      ],
    },
  ],
};

export default sidebar.apisidebar;
