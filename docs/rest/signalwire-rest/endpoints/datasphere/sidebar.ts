import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const sidebar: SidebarsConfig = {
  apisidebar: [
    {
      type: "doc",
      id: "rest/signalwire-rest/endpoints/datasphere/datasphere-api",
    },
    {
      type: "category",
      label: "Documents",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/datasphere/documents",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/datasphere/documents-list",
          label: "List Documents",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/datasphere/documents-create",
          label: "Create a Document",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/datasphere/documents-search",
          label: "Search Documents",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/datasphere/documents-update",
          label: "Update a Document",
          className: "api-method patch",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/datasphere/documents-delete",
          label: "Delete a Document",
          className: "api-method delete",
        },
      ],
    },
  ],
};

export default sidebar.apisidebar;
