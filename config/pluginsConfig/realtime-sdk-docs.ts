import type { PluginConfig, PluginOptions } from "@docusaurus/types";
import sidebarGenerator from "../../plugins/SidebarGenerator";


export const realtimeSdkPlugin: PluginConfig = [
  "@docusaurus/plugin-content-docs",
  {
    id: "realtime-sdk",
    path: "realtime-sdk-docs",
    routeBasePath: "sdks/reference/realtime-sdk",
    sidebarPath: require.resolve("../sidebarsConfig/relay-realtime-sidebar.ts"),
    editUrl: "https://github.com/signalwire/docs/edit/main/",
    docItemComponent: "@theme/ApiItem",
    sidebarItemsGenerator: sidebarGenerator,
    remarkPlugins: [
      [require("@docusaurus/remark-plugin-npm2yarn"), { sync: true }],
      [require("../../plugins/remark-plugin-yaml-and-json"), { sync: false }],
      [require("../../plugins/remark-plugin-vfile-reporter"), {}],
      [require("../../plugins/remark-plugin-api-table"), {}]
    ],
    beforeDefaultRemarkPlugins: [
      // TODO: temporarily don't fail on a11y errors
      [require("../../plugins/remark-plugin-a11y-checker"), { stopOnError: false }],
      [require("../../plugins/remark-plugin-image-to-figure"), {}],
    ],
    lastVersion: "current",
    versions: {
      current: {
        label: "v4",
        banner: 'none'
      },
      "v3": {
        label: "v3",
        banner: 'none'
      },
      "v2": {
        label: "v2",
        banner: 'unmaintained'
      }
    },
  } satisfies PluginOptions,
];