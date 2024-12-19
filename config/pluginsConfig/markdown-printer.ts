/*
* This plugin is used to collect all markdown files that are included in the config.
* The Markdown files are then printed into a single file and saved in the static/attachments folder.
* 
* This plugin was written by the SignalWire DevEx team, and its code is hosted within this repository.
* 
* The plugin can be found at the following file path: ./plugins/markdown-printer
*/

import { PluginConfig } from '@docusaurus/types';

export const markdownPrinterPlugin: PluginConfig = [
  "markdown-printer",
  {
    include: "**/*.{md,mdx}",
    ignore: [
      "**/node_modules/**",
      "**/_*/**",
      "**/_*.*",
    ],
    path: "docs/swml",
    routeBasePath: "docs",
    outputPath: "static/attachments/unified-docs",
    outputFilename: "unified-swml.md",
  },
];