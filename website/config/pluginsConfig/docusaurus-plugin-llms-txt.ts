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
import type { PluginOptions } from '@signalwire/docusaurus-plugin-llms-txt/public';
export const llmsTxtPlugin: PluginConfig = [
  "@signalwire/docusaurus-plugin-llms-txt",
  {

    logLevel: 1,
    onRouteError: 'throw',
    onSectionError: 'throw',
    runOnPostBuild: true,

    generate: {
      enableMarkdownFiles: true,
      enableLlmsFullTxt: true,
      relativePaths: true
    },

    include: {
      includeBlog: false,
      includePages: false,
      includeDocs: true,
      includeVersionedDocs: false,
      includeGeneratedIndex: false,
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
        "/media/**" ,
        "/"
      ],
    },

    structure: {
      enableDescriptions: true,
      siteTitle: "SignalWire Developer Documentation",
      siteDescription: "SignalWire provide comprehensive and easy to use APIs that allow developers to reate unified communication applications.",

      optionalLinks: [
        {
          title: "Support",
          url: "https://support.signalwire.com",
          description: "SignalWire Support"
        }
      ],

      sections: [
        {
          id: 'swml',
          name: 'SWML Documentation',
          description: 'The SignalWire Markup Language which allows developers to create communication applications with simple JSON & YAML documents.',
          position: 1,
          routes: [
            {
              route: '/swml/**'
            }
          ]
        },
        {
          id: 'api-ref',
          name: 'API OpenAPI Spec',
          description: 'The OpenAPI Spec defiitions.',
          position: 1,
          routes: []
        },
      ]
    },

    processing: {

      attachments: [
        {
          source: '../specs/signalwire-rest/calling-api/tsp-output/@typespec/openapi3/openapi.yaml',
          title: 'Calling API Spec',
          description: "The OpenAPI spec for the SignalWire Calling API.",
          sectionId: "api-ref"
        }
      ]
    },

    ui: {
      copyPageContent: true
    }
  } satisfies PluginOptions
];