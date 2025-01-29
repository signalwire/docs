/*
* This plugin is used to generate the API reference documentation from OpenAPI specs.
* 
* Docusaurus technical reference: https://github.com/PaloAltoNetworks/docusaurus-openapi-docs
*/

import { PluginConfig } from '@docusaurus/types';
import type * as OpenApiPlugin from "docusaurus-plugin-openapi-docs";
import {PluginOptions} from "docusaurus-plugin-openapi-docs/src/types"

export const openapiPlugin: PluginConfig = [
  'docusaurus-plugin-openapi-docs',
  {
    id: "api",
    docsPluginId: "classic",
    config: {
      compatibilityRest: {
        specPath: "api/compatibility-api/_spec_.yaml",
        outputDir: "docs/rest/compatibility-api/endpoints",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireCallingRest: {
        specPath: "api/signalwire-rest/calling-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/calling",        
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireChatRest: {
        specPath: "api/signalwire-rest/chat-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/chat",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireDatasphereRest: {
        specPath: "api/signalwire-rest/datasphere-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/datasphere",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireFabricRest: {
        specPath: "api/signalwire-rest/fabric-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/fabric",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireFaxRest: {
        specPath: "api/signalwire-rest/fax-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/fax",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireMessagingRest: {
        specPath: "api/signalwire-rest/message-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/messaging",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireProjectRest: {
        specPath: "api/signalwire-rest/project-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/project",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwirePubSubRest: {
        specPath: "api/signalwire-rest/pubsub-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/pubsub",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireSpaceRest: {
        specPath: "api/signalwire-rest/space-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/space",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireVideoRest: {
        specPath: "api/signalwire-rest/video-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/video",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireVoiceRest: {
        specPath: "api/signalwire-rest/voice-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/voice",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
    } satisfies Record<string, OpenApiPlugin.Options>  
  } satisfies PluginOptions,
]; 