import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const sidebar: SidebarsConfig = {
  apisidebar: [
    {
      type: "doc",
      id: "rest/signalwire-rest/endpoints/pubsub/pubsub-api",
    },
    {
      type: "category",
      label: "Tokens",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/pubsub/tokens",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/pubsub/create-token",
          label: "Generate a new PubSub Token",
          className: "api-method post",
        },
      ],
    },
  ],
};

export default sidebar.apisidebar;
