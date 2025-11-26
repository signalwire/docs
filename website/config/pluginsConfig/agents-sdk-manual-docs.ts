import { PluginConfig, PluginOptions } from "@docusaurus/types";
import sidebarGenerator from "../../src/plugins/SidebarGenerator";

export const agentsSdkManualPlugin: PluginConfig = [
  "@docusaurus/plugin-content-docs",
  {
    id: "agents-sdk-manual",
    path: "docs/agents-sdk-manual",
    routeBasePath: "sdks/agents-sdk",
    sidebarPath: require.resolve("../sidebarsConfig/agents-sdk-manual/index.ts"),
    editUrl: "https://github.com/signalwire/docs/edit/main/website",
    editCurrentVersion: true,
    breadcrumbs: true,
    docItemComponent: "@theme/ApiItem",
    sidebarItemsGenerator: sidebarGenerator,
    remarkPlugins: [
      [require("@docusaurus/remark-plugin-npm2yarn"), { sync: true }],
      [require("../../src/plugins/remark-plugin-yaml-and-json"), { sync: false }],
      [require("../../src/plugins/remark-plugin-vfile-reporter"), {}],
      [require("../../src/plugins/remark-plugin-api-table"), {}]
    ],
    beforeDefaultRemarkPlugins: [
      [require("../../src/plugins/remark-plugin-a11y-checker"), { stopOnError: false }],
      [require("../../src/plugins/remark-plugin-image-to-figure"), {}],
    ],
    tags: "tags.yml",
    onInlineTags: "throw",
  } satisfies PluginOptions,
];
