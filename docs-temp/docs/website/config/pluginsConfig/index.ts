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

import { PluginConfig, PluginOptions } from "@docusaurus/types";
import { openapiPlugin } from "./docusaurus-plugin-openapi-docs";
import { sassPlugin } from "./sass";
import { markdownPrinterPlugin } from "./markdown-printer";
import { showcasePlugin } from "./guide-showcase";
import { llmsTxtPlugin } from "./docusaurus-plugin-llms-txt";
import { realtimeSdkPlugin } from "./realtime-sdk-docs";
import { browserSdkPlugin } from "./browser-sdk-docs";
import { agentsSdkManualPlugin } from "./agents-sdk-docs";
// import { signalwireSdkPlugin } from "./signalwire-client-sdk-docs";
import { ogImagesPlugin } from "../ogImages/index";

const plugins: PluginConfig[] = [
  openapiPlugin,
  sassPlugin,
  ...(process.env.CONFIG_ENABLE_MARKDOWN_PRINTER === "FALSE"
    ? []
    : [markdownPrinterPlugin]),
  showcasePlugin,
  require.resolve("../../src/plugins/docusaurus-plugin-image-alias"),
  ["plugin-image-zoom", {}],
  llmsTxtPlugin,
  realtimeSdkPlugin,
  browserSdkPlugin,
  agentsSdkManualPlugin,
  // signalwireSdkPlugin,
  ...(process.env.CONFIG_BUILD_OG_IMAGES === "FALSE" ? [] : [ogImagesPlugin]),
];

export default plugins;
