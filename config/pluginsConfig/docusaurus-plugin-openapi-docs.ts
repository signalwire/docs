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
      signalwireCallingApi: {
        specPath: "api/signalwire-rest/calling-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/calling",        
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireChatApi: {
        specPath: "api/signalwire-rest/chat-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/chat",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireDatasphereApi: {
        specPath: "api/signalwire-rest/datasphere-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/datasphere",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireFabricApi: {
        specPath: "api/signalwire-rest/fabric-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/fabric",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireFaxApi: {
        specPath: "api/signalwire-rest/fax-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/fax",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireLogsApi: {
        specPath: "api/signalwire-rest/logs-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/logs",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireMessagingApi: {
        specPath: "api/signalwire-rest/message-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/messaging",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireProjectApi: {
        specPath: "api/signalwire-rest/project-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/project",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwirePubSubApi: {
        specPath: "api/signalwire-rest/pubsub-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/pubsub",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireSpaceApi: {
        specPath: "api/signalwire-rest/space-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/space",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireVideoApi: {
        specPath: "api/signalwire-rest/video-api/_spec_.yaml",
        outputDir: "docs/rest/signalwire-rest/endpoints/video",
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireVoiceApi: {
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