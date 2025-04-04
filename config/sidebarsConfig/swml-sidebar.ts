import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const swmlTechRefSidebar: SidebarsConfig = {
  swmlTechRefSidebar: [
    {
      type: "category",
      label: "Introduction",
      collapsible: false,
      className: "menu-category",
      items: [{ type: "autogenerated", dirName: "swml/get-started" }],
    },
    {
      type: "category",
      label: "Guides",
      collapsible: false,
      className: "menu-category",
      items: [{ type: "autogenerated", dirName: "swml/guides" }],
    },
    {
      type: "category",
      label: "Methods",
      collapsible: false,
      className: "menu-category",
      items: [{ type: "autogenerated", dirName: "swml/methods" }],
    },
  ],
};

export default swmlTechRefSidebar;