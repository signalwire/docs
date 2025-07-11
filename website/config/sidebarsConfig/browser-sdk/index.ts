import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const browserSdkSidebar: SidebarsConfig = {
  browserSdkSidebar: [
    {
      type: "category",
      label: "Browser SDK",
      collapsible: false,
      className: "menu-category",
      items: [
        {
          type: "doc",
          label: "Overview",
          id: "index"
        }
      ]
    },
    {
      type: "category",
      label: "Technical Reference",
      collapsible: false,
      className: "menu-category",
      items: [
        {
          type: "autogenerated",
          dirName: "tech-ref"
        }
      ]
    },
    {
      type: "category",
      label: "Guides",
      collapsible: false,
      className: "menu-category",
      items: [
        {
          type: "autogenerated",
          dirName: "guides"
        }
      ]
    }
  ],
};

export default browserSdkSidebar;