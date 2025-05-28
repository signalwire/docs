/*
* This plugin is used to collect all markdown files that are included in the config.
* The Markdown files are then printed into a single file and saved in the static/attachments folder.
* 
* This plugin was written by the SignalWire DevEx team, and its code is hosted within this repository.
* 
* The plugin can be found at the following file path: ./plugins/markdown-printer
*/

import { PluginConfig } from '@docusaurus/types';
import { PluginOptions } from 'docusaurus-plugin-llms-txt';

export const llmsTxtPlugin: PluginConfig = [
  "docusaurus-plugin-llms-txt",
  {
    siteDescription: "SignalWire Documentation",
    siteTitle: "SignalWire Documentation",
    enableDescriptions: true,
    logLevel: 2,
    depth: 1,
    runOnPostBuild: true,
    enableCache: false,
    
    // Global ordering - guides first, then methods/reference
    includeOrder: [
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
        "/blog/**",
        "/cluecon-2024/**",
        "/img/**",
        "/demos/**",
        "/page/**",
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
      relativePaths: false,
      enableMarkdownFiles: true,
      routeRules: [
        // More specific rules first (CSS-like specificity)
        { route: "/swml/methods/**", depth: 2 },
        { route: "/swml/guides/**", depth: 2 },
        { 
          route: "/swml", 
          categoryName: "SWML", 
          depth: 2,
          // Override global ordering - methods first for SWML specifically
          includeOrder: ["/swml/methods/**", "/swml/guides/**"]
        }
      ],
    }
  } satisfies PluginOptions
];