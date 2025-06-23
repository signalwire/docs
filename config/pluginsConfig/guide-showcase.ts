/*
* This plugin is used to generate the guide showcase page: https://developer.signalwire.com/guides/
* 
* The plugins code is based off the Docusaurus showcase page: https://docusaurus.io/showcase | https://github.com/facebook/docusaurus/tree/main/website/src/pages/showcase
* 
* The SignalWire DevEx team wrote the plugin to gather all documentation pages with a `x-custom.tags` array 
* set in the frontmatter of the files and display them in the guide showcase page.
* 
* Example of a `x-custom.tags` array set in the frontmatter of a markdown file:
* 
* ---
* x-custom:
*   tags:
*     - language:nodejs
*     - sdk:compatibility
*     - product:voice
* ---
*
* The plugin code can be found at the following file path: ./plugins/docusaurus-plugin-showcase
*/

import { PluginConfig } from '@docusaurus/types';
import fs from 'fs';

const subHeaders = [
  "sdk:swml",
  "sdk:relayrealtime3",
  "sdk:relayrealtime4",
  "sdk:relaybrowser3",
  "sdk:relaybrowser2",
  "sdk:relay",
  "sdk:compatibility",
];

const guideDescription = fs.readFileSync("./static/plugins/guides/index.mdx", "utf8");

export const showcasePlugin: PluginConfig = [
  "docusaurus-plugin-showcase",
  {
    title: "SignalWire Guide Showcase",
    description: guideDescription,
    include: "**/*.{md,mdx}",
    ignore: [
      "**/node_modules/**",
      "**/administration/guides/signalwire-integrations/**",
      "**/compatibility-api/cxml/**",
      "**/cantina/**",
      "**/_*.mdx",
      "**/_*.md",
    ],
    path: "docs",
    subSites: [],
    onlyLogFailedAttempts: true,
    page: "/guides",
    logging: true,
    displayFavorites: true,
    displayTableOfContents: true,
    displaySearchBar: true,
    prioritizeTags: ["getting-started", "favorite"],
    tags: [
      {
        name: "getting-started",
        label: "Getting Started",
        description: "",
        color: "#4bf406",
        category: "",
      },
      {
        name: "favorite",
        label: "Favorite",
        description: "",
        color: "#e9669e",
        category: "",
      },
      {
        name: "product:ai",
        label: "AI",
        description: "",
        color: "#F0DB4F",
        reference: "Overview",
        link: "/swml/methods/ai/",
        header: true,
        category: "Product",
        subHeaders: subHeaders,
      },
      {
        name: "product:voice",
        label: "Voice",
        description: "",
        color: "#9BB7FB",
        reference: "Overview",
        link: "/voice",
        header: true,
        category: "Product",
        subHeaders: subHeaders,
      },
      {
        name: "product:messaging",
        label: "Messaging",
        description: "",
        color: "#F22F46",
        reference: "Overview",
        link: "/messaging",
        header: true,
        category: "Product",
        subHeaders: subHeaders,
      },
      {
        name: "product:chat",
        label: "Chat",
        description: "",
        color: "#F0DB4F",
        reference: "Overview",
        link: "/chat",
        header: true,
        category: "Product",
        subHeaders: subHeaders,
      },
      {
        name: "product:video",
        label: "Video",
        description: "",
        color: "#044CF6",
        reference: "Overview",
        link: "/video",
        header: true,
        category: "Product",
        subHeaders: subHeaders,
      },
      {
        name: "product:fax",
        label: "Fax",
        description: "",
        color: "#F22F46",
        reference: "Overview",
        link: "/fax",
        header: true,
        category: "Product",
        subHeaders: subHeaders,
      },
      {
        name: "product:numbers",
        label: "Numbers",
        description: "",
        color: "#2ff2f2",
        reference: "Overview",
        link: "/platform/phone-numbers",
        header: true,
        category: "Product",
        subHeaders: subHeaders,
      },
      {
        name: "product:signalwire_space",
        label: "SignalWire Space",
        description: "",
        color: "#ba4ff0",
        reference: "Overview",
        link: "/platform/dashboard",
        header: true,
        category: "Product",
        subHeaders: subHeaders,
      },
      {
        name: "product:freeswitch",
        label: "FreeSWITCH",
        description: "",
        color: "#1b336f",
        reference: "Overview",
        link: "/platform/integrations/freeswitch",
        header: true,
        category: "Product",
        subHeaders: subHeaders,
      },
      {
        name: "sdk:swml",
        label: "SWML",
        description: "",
        color: "#F22F46",
        reference: "Reference",
        link: "/swml",
        category: "SDKs",
      },
      {
        name: "sdk:relayrealtime4",
        label: "Relay Realtime SDK (v4)",
        description: "",
        color: "#9104f6",
        reference: "Reference",
        link: "/sdks/relay-realtime-sdk/",
        category: "SDKs",
      },
      {
        name: "sdk:relayrealtime3",
        label: "Relay Realtime SDK (v3)",
        description: "",
        color: "#044CF6",
        reference: "Reference",
        link: "/sdks/relay-realtime-sdk/v3",
        category: "SDKs",
      },
      {
        name: "sdk:relay",
        label: "Relay SDK (v2)",
        description: "",
        color: "#9BB7FB",
        reference: "Reference",
        link: "/sdks",
        category: "SDKs",
      },
      {
        name: "sdk:relaybrowser3",
        label: "Relay Browser SDK (v3)",
        description: "",
        color: "#30f803",
        reference: "Reference",
        link: "/sdks/browser-sdk/",
        category: "SDKs",
      },
      {
        name: "sdk:relaybrowser2",
        label: "Relay Browser SDK (v2)",
        description: "",
        color: "#9BB7FB",
        reference: "Reference",
        link: "https://docs.signalwire.com/reference/relay-sdk-js",
        category: "SDKs",
      },
      {
        name: "sdk:compatibility",
        label: "Compatibility-API",
        description: "",
        color: "#F22F46",
        reference: "Reference",
        link: "/compatibility-api",
        category: "SDKs",
      },
      {
        name: "language:javascript",
        label: "JavaScript",
        description: "",
        color: "#F0DB4F",
        category: "Languages",
      },
      {
        name: "language:nodejs",
        label: "Node.js",
        description: "",
        color: "#89D42C",
        category: "Languages",
      },
      {
        name: "language:csharp",
        label: "C#/.Net",
        description: "",
        color: "#1384C8",
        category: "Languages",
      },
      {
        name: "language:php",
        label: "PHP",
        description: "",
        color: "#6181B6",
        category: "Languages",
      },
      {
        name: "language:ruby",
        label: "Ruby",
        description: "",
        color: "#D91505",
        category: "Languages",
      },
      {
        name: "language:python",
        label: "Python",
        description: "",
        color: "#3372A7",
        category: "Languages",
      },
    ],
  },
];