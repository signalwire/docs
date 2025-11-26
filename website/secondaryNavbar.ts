import React from "react";
import {
  FaHome,
  FaRobot,
  FaServer,
  FaExchangeAlt,
  FaBook,
  FaComments,
  FaNewspaper,
  FaBox,
  FaLifeRing
} from "react-icons/fa";
import { MdCode, MdWeb } from "react-icons/md";
import { TbWorldCode } from "react-icons/tb";
import { PiTreeStructure } from "react-icons/pi";
import { IconType } from "react-icons";

// Modal header title
export const modalHeaderTitle = "Explore the SignalWire Docs";

// Type definitions
export interface DropdownItem {
  label: string;
  link: string;
  sidebar: string; // Required for active state detection
  description?: string; // Optional description shown below the label
}

// Regular link (no dropdown) - link is required
export interface RegularProductLink {
  label: string;
  link: string;
  sidebar: string;
  dropdown?: never; // Must NOT have dropdown
}

// Dropdown link - no link property (parent is pure dropdown container)
export interface DropdownProductLink {
  label: string;
  link?: never; // Must NOT have link - dropdown parents are pure containers
  sidebar: string;
  dropdown: DropdownItem[]; // Required - must have dropdown items
}

// Union type - enforces correct combinations
export type ProductLink = RegularProductLink | DropdownProductLink;

export interface ProductVersion {
  links: ProductLink[];
}

export interface ProductItem {
  title: string;
  icon: IconType | string;
  description?: string;
  link: string;
  links?: ProductLink[];
  versions?: Record<string, ProductVersion>;
  dropdown?: DropdownItem[];
  position?: number;
}

export interface ModalSection {
  type: "main" | "section";
  title?: string;
  items: Record<string, ProductItem>;
  position?: number;
}

// Type-based modal sections structure
export const modalSections: ModalSection[] = [
  {
    type: "main",
    title: "",
    position: 1,
    items: {
      home: {
        title: "Home",
        icon: FaHome,
        description: "Get started with the SignalWire platform",
        link: "/",
        links: [
          {
            label: "Home",
            sidebar: "homeSidebar",
            link: "/"
          }
        ],
        position: 1,
      },
    },
  },
  {
    type: "main",
    position: 2,
    items: {
      swml: {
        title: "SWML",
        icon: MdCode,
        description: "SWML (SignalWire Markup Language) enables you to create voice and AI applications defined by serverless or HTTP-requested scripts written in YAML or JSON",
        link: "/swml",
        position: 2,
        links: [
          {
            label: "Get started",
            link: "/swml",
            sidebar: "swmlOverviewSidebar",
          },
          {
            label: "Guides",
            link: "/swml/guides",
            sidebar: "swmlGuidesSidebar",
          },
          {
            label: "Technical Reference",
            link: "/swml/methods",
            sidebar: "swmlReferenceSidebar",
          },
        ],
      },
      agentsSdk: {
        title: "Agents SDK",
        icon: FaRobot,
        description: "A powerful Python SDK for building SWML-based agentic AI voice applications",
        link: "/sdks/agents-sdk",
        position: 5,
        links: [
          {
            label: "",
            link: "/sdks/agents-sdk",
            sidebar: "agentsSdkOverviewSidebar",
          }
        ],
      },
      browserSdk: {
        title: "Browser SDK",
        icon: MdWeb,
        description: "JavaScript library for building WebRTC-based voice, video, and chat applications in the browser",
        link: "/sdks/browser-sdk",
        position: 3,
        versions: {
          // Current/latest version (v3)
          current: {
            links: [
              {
                label: "Getting Started",
                link: "/sdks/browser-sdk",
                sidebar: "browserSdkOverviewSidebar",
              },
              {
                label: "Guides",
                link: "/sdks/browser-sdk/guides",
                sidebar: "browserSdkGuidesSidebar",
              },
              {
                label: "Technical Reference",
                link: "/sdks/browser-sdk/technical-reference",
                sidebar: "browserSdkReferenceSidebar",
              }
            ],
          },
          // v2 version
          v2: {
            links: [
              {
                label: "Getting Started",
                link: "/sdks/browser-sdk/v2",
                sidebar: "browserSdkOverviewSidebar",
              },
              {
                label: "Guides",
                link: "/sdks/browser-sdk/v2/guides",
                sidebar: "browserSdkGuidesSidebar",
              },
              {
                label: "Technical Reference",
                link: "/sdks/browser-sdk/v2/call",
                sidebar: "browserSdkReferenceSidebar",
              }
            ],
          },
        },
      },
      realtimeSdk: {
        title: "Realtime SDK",
        icon: FaServer,
        description: "Node.js SDK for building applications capable of async operations via a WebSocket connection to your server",
        link: "/sdks/realtime-sdk",
        position: 4,
        versions: {
          // Current/latest version
          current: {
            links: [
              {
                label: "Getting Started",
                link: "/sdks/realtime-sdk",
                sidebar: "realtimeSdkOverviewSidebar",
              },
              {
                label: "Guides",
                link: "/sdks/realtime-sdk/guides",
                sidebar: "realtimeSdkGuidesSidebar",
              },
              {
                label: "Technical Reference",
                link: "/sdks/realtime-sdk/technical-reference",
                sidebar: "realtimeSdkReferenceSidebar",
              }
            ],
          },
          // v3 version
          v3: {
            links: [
              {
                label: "Getting Started",
                link: "/sdks/realtime-sdk/v3",
                sidebar: "realtimeSdkOverviewSidebar",
              },
              {
                label: "Guides",
                link: "/sdks/realtime-sdk/v3/guides",
                sidebar: "realtimeSdkGuidesSidebar",
              },
              {
                label: "Technical Reference",
                link: "/sdks/realtime-sdk/v3/technical-reference",
                sidebar: "realtimeSdkReferenceSidebar",
              }
            ],
          },
          // v2 version
          v2: {
            links: [
              {
                label: "Getting Started",
                link: "/sdks/realtime-sdk/v2",
                sidebar: "realtimeSdkOverviewSidebar",
              },
              {
                label: "Guides",
                link: "/sdks/realtime-sdk/v2/guides",
                sidebar: "realtimeSdkGuidesSidebar",
              },
              {
                label: "Technical Reference",
                link: "/sdks/realtime-sdk/v2/language/nodejs",
                sidebar: "realtimeSdkLanguageSidebar",
              }
            ],
          },
        },
      },
      restApi: {
        title: "SignalWire API",
        icon: TbWorldCode,
        description: "Complete technical reference for the SignalWire API, including REST and JSON-RPC endpoints",
        link: "/rest",
        position: 1,
        links: [
          {
            label: "Overview",
            link: "/rest",
            sidebar: "apiOverviewSidebar",
          },
          {
            label: "Guides",
            link: "/rest/signalwire-rest/guides",
            sidebar: "apiSignalwireGuidesSidebar",
          },
          {
            label: "REST API reference",
            link: "/rest/signalwire-rest",
            sidebar: "apiSignalwireSidebar",
          }
        ],
      },
      callFlowBuilder: {
        title: "Call Flow Builder",
        description: "Visual drag-and-drop tool for designing and deploying SWML-based voice applications",
        icon: PiTreeStructure,
        link: "/call-flow-builder",
        position: 6,
        links: [
          {
            label: "Call Flow Builder",
            link: "/call-flow-builder",
            sidebar: "callFlowBuilderSidebar",
          },
        ],
      },
      compatibilityApi: {
        title: "Compatibility API",
        icon: FaExchangeAlt,
        description: "Migrate seamlessly to our Twilio-compatible REST API and TwiML-compatible cXML language",
        link: "/compatibility-api",
        position: 7,
        links: [
          {
            label: "Overview",
            link: "/compatibility-api",
            sidebar: "compatibilityApiOverviewSidebar",
          },
          {
            label: "Guides",
            link: "/compatibility-api/guides",
            sidebar: "compatibilityApiGuidesSidebar",
          },
          {
            label: "Technical Reference",
            sidebar: "compatibilityApiReferenceSidebar",
            dropdown: [
              {
                label: "cXML Reference",
                link: "/compatibility-api/cxml",
                sidebar: "compatibilityApiReferenceSidebar",
                description: "TwiML-compatible XML markup for calls and messages"
              },
              {
                label: "REST API Reference",
                link: "/rest/compatibility-api",
                sidebar: "apiCompatibilitySidebar",
                description: "HTTP endpoints for managing resources"
              },
              {
                label: "REST Client Libraries",
                link: "/compatibility-api/sdks",
                sidebar: "compatibilityApiClientLibrariesSidebar",
                description: "Official SDKs for popular programming languages"
              }
            ]
          }
        ],
      },
    },
  },
  {
    type: "section",
    title: "Additional resources",
    position: 3,
    items: {
      blogs: {
        title: "Release notes",
        icon: FaNewspaper,
        description: "Latest news and updates from SignalWire",
        link: "/blog",
        position: 2,
        links: [
          {
            label: "Blog Home",
            link: "/blog",
            sidebar: "",
          }
        ],
      },
      guides: {
        title: "All guides",
        icon: FaBook,
        link: "/guides",
        position: 1,
        links: [
          {
            label: "Guides",
            link: "/guides",
            sidebar: "homeSidebar",
          },
        ],
      },
      support: {
        title: "Support",
        icon: FaLifeRing,
        link: "https://support.signalwire.com/portal/en/community",
        position: 3,
      },
    },
  },
];
