/*
 * This file is used to configure the plugins for the site.
 *
 * Used by: docusaurus.config.js
 * Within: config
 *
 *
 * All plugin options can be modified at the corresponding plugin file.
 *
 * Example: openapi plugin options can be modified at the /config/pluginsConfig/openapi.ts file.
 *
 * Docusaurus technical reference: https://docusaurus.io/docs/api/docusaurus-config#plugins
 */

import { PluginConfig } from "@docusaurus/types";
import { openapiPlugin } from "./docusaurus-plugin-openapi-docs";
import { sassPlugin } from "./sass";
import { markdownPrinterPlugin } from "./markdown-printer";
import { showcasePlugin } from "./guide-showcase";

const plugins: PluginConfig[] = [
  openapiPlugin,
  sassPlugin,
  markdownPrinterPlugin,
  showcasePlugin,
  require.resolve("../../plugins/docusaurus-plugin-image-alias"),
  ["plugin-image-zoom", {}],
];

export default plugins;
