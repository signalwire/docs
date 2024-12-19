import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const sidebar: SidebarsConfig = {
  apisidebar: [
    {
      type: "doc",
      id: "rest/signalwire-rest/endpoints/project/project-api",
    },
    {
      type: "category",
      label: "Tokens",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/project/tokens",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/project/create-token",
          label: "Generate a new API Token",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/project/update-token",
          label: "Update an API Token",
          className: "api-method patch",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/project/delete-token",
          label: "Delete an API Token",
          className: "api-method delete",
        },
      ],
    },
  ],
};

export default sidebar.apisidebar;
