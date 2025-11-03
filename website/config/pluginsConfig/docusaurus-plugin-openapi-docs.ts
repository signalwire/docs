/*
* This plugin is used to generate the API reference documentation from OpenAPI specs.
* 
* Docusaurus technical reference: https://github.com/PaloAltoNetworks/docusaurus-openapi-docs
*/

import { PluginConfig } from "@docusaurus/types";
import type * as OpenApiPlugin from "docusaurus-plugin-openapi-docs";
import {PluginOptions} from "docusaurus-plugin-openapi-docs/src/types"

export const openapiPlugin: PluginConfig = [
  'docusaurus-plugin-openapi-docs',
  {
    id: "api",
    docsPluginId: "classic",
    config: {
      compatibilityRest: {
        specPath: "../specs/compatibility-api/_spec_.yaml",
        outputDir: "docs/main/rest/compatibility-api/endpoints",
        maskCredentials: false,
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      // BACKUP: Previous config with subdirectories
      // To revert: restore outputDir to subdirectories (dial/, update/, calling-end/, etc.)
      // and remove the outputDir override below
      signalwireCallingApiDial: {
        specPath: "../specs/signalwire-rest/calling-api/open-rpc/dial/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/calling", // FLAT - no subdirectories
        maskCredentials: false,
        // NO sidebarOptions - we'll create a manual sidebar to avoid overwriting
      },
      signalwireCallingApiUpdate: {
        specPath: "../specs/signalwire-rest/calling-api/open-rpc/update/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/calling", // FLAT
        maskCredentials: false,
        // NO sidebarOptions
      },
      signalwireCallingApiEnd: {
        specPath: "../specs/signalwire-rest/calling-api/open-rpc/calling-end/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/calling", // FLAT
        maskCredentials: false,
        // NO sidebarOptions
      },
      signalwireCallingApiAiHold: {
        specPath: "../specs/signalwire-rest/calling-api/open-rpc/calling-ai-hold/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/calling", // FLAT
        maskCredentials: false,
        // NO sidebarOptions
      },
      signalwireCallingApiAiUnhold: {
        specPath: "../specs/signalwire-rest/calling-api/open-rpc/calling-ai-unhold/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/calling", // FLAT
        maskCredentials: false,
        // NO sidebarOptions
      },
      signalwireCallingApiAiMessage: {
        specPath: "../specs/signalwire-rest/calling-api/open-rpc/calling-ai-message/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/calling", // FLAT
        maskCredentials: false,
        // NO sidebarOptions
      },
      signalwireChatApi: {
        specPath: "../specs/signalwire-rest/chat-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/chat",
        maskCredentials: false,
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireDatasphereApi: {
        specPath: "../specs/signalwire-rest/datasphere-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/datasphere",
        maskCredentials: false,
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireFabricApi: {
        specPath: "../specs/signalwire-rest/fabric-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/fabric",
        maskCredentials: false,
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireFaxApi: {
        specPath: "../specs/signalwire-rest/fax-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/fax",
        maskCredentials: false,
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireLogsApi: {
        specPath: "../specs/signalwire-rest/logs-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/logs",
        maskCredentials: false,
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireMessagingApi: {
        specPath: "../specs/signalwire-rest/message-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/messaging",
        maskCredentials: false,
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireProjectApi: {
        specPath: "../specs/signalwire-rest/project-api/_spec_.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/project",
        maskCredentials: false,
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwirePubSubApi: {
        specPath: "../specs/signalwire-rest/pubsub-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/pubsub",
        maskCredentials: false,
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireSpaceApi: {
        specPath: "../specs/signalwire-rest/space-api/_spec_.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/space",
        maskCredentials: false,
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireVideoApi: {
        specPath: "../specs/signalwire-rest/video-api/_spec_.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/video",
        maskCredentials: false,
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
      signalwireVoiceApi: {
        specPath: "../specs/signalwire-rest/voice-api/tsp-output/@typespec/openapi3/openapi.yaml",
        outputDir: "docs/main/rest/signalwire-rest/endpoints/voice",
        maskCredentials: false,
        sidebarOptions: {
          categoryLinkSource: "tag",
          groupPathsBy: "tag",
        },
      },
    } satisfies Record<string, OpenApiPlugin.Options>  
  } satisfies PluginOptions,
]; 