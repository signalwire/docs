/*
* This plugin is used to collect all markdown files that are included in the config.
* The Markdown files are then printed into a single file and saved in the static/attachments folder.
* 
* This plugin was written by the SignalWire DevEx team, and its code is hosted within this repository.
* 
* The plugin can be found at the following file path: ./plugins/markdown-printer
*/

import { PluginConfig } from '@docusaurus/types';
// @ts-ignore - ESM/CJS compatibility issue
import type { PluginOptions } from '@signalwire/docusaurus-plugin-llms-txt';
export const llmsTxtPlugin: PluginConfig = [
  "@signalwire/docusaurus-plugin-llms-txt",
  {
    siteDescription: "SignalWire Documentation",
    siteTitle: "SignalWire Documentation",
    enableDescriptions: true,
    onRouteError: 'warn',
    logLevel: 1,
    depth: 1,
    runOnPostBuild: true,

    // Global ordering - guides first, then methods/reference
    includeOrder: [
      "/ai/**",
      "/swml/**"
    ],

    optionalLinks: [
      {
        title: "Support",
        url: "https://support.signalwire.com",
        description: "SignalWire Support"
      }
    ],
    content: {
      excludeRoutes: [
        "/attachments/**",
        "/cluecon-2024/**",
        "/img/**",
        "/demos/**",
        "/tags/**",
        "/rest/**",
        "/plugins/**",
        "/internal/**",
        "/landing-assets/**",
        "/livewire/**",
        "/events/**",
        "/assets/**",
        "/404.html",
        "/media/**" 
      ],
      includeBlog: false,
      includePages: false,
      includeDocs: true,
      includeVersionedDocs: false,
      includeGeneratedIndex: false,
      relativePaths: false,
      enableMarkdownFiles: true,
      enableLlmsFullTxt: true,
      routeRules: [
        {
          route: '/sdks/{realtime-sdk,browser-sdk,agents-sdk}/**',
          depth: 2
        }
      ]
    }
  } satisfies PluginOptions
];