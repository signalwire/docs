import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const sidebar: SidebarsConfig = {
  apisidebar: [
    {
      type: "doc",
      id: "rest/signalwire-rest/endpoints/chat/chat-api",
    },
    {
      type: "category",
      label: "Tokens",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/chat/tokens",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/chat/chat-tokens-create",
          label: "Generate a new Chat Token",
          className: "api-method post",
        },
      ],
    },
  ],
};

export default sidebar.apisidebar;
