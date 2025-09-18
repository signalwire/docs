import { PluginConfig, PluginOptions } from "@docusaurus/types";
import sidebarGenerator from "../../src/plugins/SidebarGenerator";

export const signalwireSdkPlugin: PluginConfig = [
  "@docusaurus/plugin-content-docs",
  {
    id: "signalwire-sdk",
    path: "docs/signalwire-sdk",
    routeBasePath: "sdks/signalwire-sdk",
    sidebarPath: require.resolve("../sidebarsConfig/signalwire-sdk/index.ts"),
    editUrl: "https://github.com/signalwire/docs/edit/main/website",
    editCurrentVersion: true,
    docItemComponent: "@theme/ApiItem",
    sidebarItemsGenerator: sidebarGenerator,
    remarkPlugins: [
      [require("@docusaurus/remark-plugin-npm2yarn"), { sync: true }],
      [require("../../src/plugins/remark-plugin-yaml-and-json"), { sync: false }],
      [require("../../src/plugins/remark-plugin-vfile-reporter"), {}],
      [require("../../src/plugins/remark-plugin-api-table"), {}],
    ],
    beforeDefaultRemarkPlugins: [
      // TODO: temporarily don't fail on a11y errors
      [require("../../src/plugins/remark-plugin-a11y-checker"), { stopOnError: false }],
      [require("../../src/plugins/remark-plugin-image-to-figure"), {}],
    ],
    lastVersion: "current",
    versions: {
      current: {
        label: "v0",
        banner: "unreleased",
      },
    },
  } satisfies PluginOptions,
];
