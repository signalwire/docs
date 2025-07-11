import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const browserSdkTechRefSidebar: SidebarsConfig = {
  browserSdkTechRefSidebar: [
    {
      type: "category",
      label: "Browser SDK",
      collapsible: false,
      collapsed: false,
      className: "menu-category",
      items: [{ type: "autogenerated", dirName: "browser-sdk-docs" }]
    }
  ],
};

export default browserSdkTechRefSidebar;