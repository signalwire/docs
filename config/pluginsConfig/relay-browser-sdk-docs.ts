import { PluginConfig, PluginOptions } from "@docusaurus/types";
import sidebarGenerator from "../../plugins/SidebarGenerator";


export const relayBrowserSdkPlugin: PluginConfig = [
  "@docusaurus/plugin-content-docs",
  {
    id: "relay-browser-sdk",
    path: "relay-browser-sdk-docs",
    routeBasePath: "sdks/relay-browser-sdk",
    sidebarPath: require.resolve("../sidebarsConfig/relay-browser-sdk/index.ts"),
    editUrl: "https://github.com/signalwire/docs/edit/main/",
    editCurrentVersion: true,
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
        label: "v3",
        banner: 'none'
      },
      "v2": {
        label: "v2",
        banner: 'none'
      }
    },
  } satisfies PluginOptions,
];