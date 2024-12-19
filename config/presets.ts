import type { Options } from "@docusaurus/preset-classic";
import type { PresetConfig } from "@docusaurus/types";
import sidebarGenerator from "../plugins/SidebarGenerator";

/**
 * Configuration for the site's presets.
 *
 * Used by: docusaurus.config.js
 * Within: config.presets
 *
 * Docusaurus technical reference: https://docusaurus.io/docs/using-plugins#using-presets
 */

const presets: PresetConfig[] = [
  [
    "classic",
    {
      docs: {
        editUrl: "https://github.com/signalwire/signalwire-docs/edit/main/",
        path: "docs",
        routeBasePath: "/",
        sidebarPath: require.resolve("./sidebarsConfig"),
        docItemComponent: "@theme/ApiItem",
        sidebarItemsGenerator: sidebarGenerator,
        remarkPlugins: [
          [require("@docusaurus/remark-plugin-npm2yarn"), { sync: true }],
          [require("../plugins/remark-plugin-yaml-and-json"), { sync: false }],
          [require("../plugins/remark-plugin-vfile-reporter"), {}],
          [require("../plugins/remark-plugin-api-table"), {}],
        ],
        beforeDefaultRemarkPlugins: [
          [require("../plugins/remark-plugin-a11y-checker"), {}],
          [require("../plugins/remark-plugin-image-to-figure"), {}],
        ],
      },
      blog: {
        blogSidebarCount: "ALL",
      },
      theme: {
        customCss: require.resolve("../src/css/index.scss"),
      },
      gtag: {
        trackingID: process.env.GTAG as string ?? "",
      },
    } satisfies Options,
  ],
];

export default presets;