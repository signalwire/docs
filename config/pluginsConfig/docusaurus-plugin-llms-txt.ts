/*
* This plugin is used to collect all markdown files that are included in the config.
* The Markdown files are then printed into a single file and saved in the static/attachments folder.
* 
* This plugin was written by the SignalWire DevEx team, and its code is hosted within this repository.
* 
* The plugin can be found at the following file path: ./plugins/markdown-printer
*/

import { PluginConfig } from '@docusaurus/types';
import { PluginOptions, LogLevel, Depth } from 'docusaurus-plugin-llms-txt';

export const llmsTxtPlugin: PluginConfig = [
  "docusaurus-plugin-llms-txt",
  {
    siteDescription: "SignalWire Documentation",
    siteTitle: "SignalWire Documentation",
    enableDescriptions: true,
    logLevel: LogLevel.INFO,
    depth: Depth.ONE,
    runOnPostBuild: true,
    enableCache: false,
    relativePaths: false,
    enableMarkdownFiles: true,

    pathRules: [
      {
        path: "/swml/**",
        category: "SWML",
        depth: Depth.TWO
      }
    ],

    excludePaths: [
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

    optionalLinks: [
      {
        title: "Support",
        url: "https://support.signalwire.com",
        description: "SignalWire Support"
      }
    ]
  } satisfies PluginOptions
];