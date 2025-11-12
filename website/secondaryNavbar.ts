import React from "react";
import {
  FaHome,
  FaRobot,
  FaServer,
  FaExchangeAlt,
  FaBook,
  FaComments,
  FaNewspaper
} from "react-icons/fa";
import { MdCode, MdWeb } from "react-icons/md";
import { TbApi } from "react-icons/tb";
import { PiTreeStructure } from "react-icons/pi";
import { IconType } from "react-icons";

// Type definitions
export interface DropdownItem {
  label: string;
  link: string;
}

export interface ProductLink {
  label: string;
  link: string;
  sidebar: string;
  dropdown?: DropdownItem[];
}

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
}

export interface ModalSection {
  type: "main" | "section";
  title: string;
  items: Record<string, ProductItem>;
}

// Type-based modal sections structure
export const modalSections: ModalSection[] = [
  {
    type: "main",
    title: "Go to documentation:",
    items: {
      platform: {
        title: "Home",
        icon: FaHome,
        description: "Platform overview and getting started resources",
        link: "/",
        links: []
      },
      swml: {
        title: "SWML",
        icon: MdCode,
        description: "SignalWire Markup Language documentation",
        link: "/swml",
        links: [
          {
            label: "Get Started",
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
            sidebar: "swmlMethodsSidebar",
          },
        ],
      },
      agentsSdk: {
        title: "Agents SDK",
        icon: FaRobot,
        description: "AI Agents development with SWAIG",
        link: "/sdks/agents-sdk",
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
        description: "RELAY Browser SDK for WebRTC",
        link: "/sdks/browser-sdk",
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
        description: "RELAY Realtime Server SDK",
        link: "/sdks/realtime-sdk",
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
        title: "REST APIs",
        icon: TbApi,
        description: "SignalWire REST API endpoints",
        link: "/rest",
        links: [
          {
            label: "Overview",
            link: "/rest",
            sidebar: "apiOverviewSidebar",
          },
          {
            label: "SignalWire APIs",
            link: "/rest/signalwire-rest",
            sidebar: "apiSignalwireSidebar",
          },
          {
            label: "Compatibility APIs",
            link: "/rest/compatibility-api",
            sidebar: "apiCompatibilitySidebar",
          },
        ],
      },
      compatibilityApi: {
        title: "Compatibility API",
        icon: FaExchangeAlt,
        description: "Twilio-compatible migration path",
        link: "/compatibility-api",
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
            link: "/compatibility-api/cxml",
            sidebar: "compatibilityApiReferenceSidebar",
          }
        ],
      },
      callFlowBuilder: {
        title: "Call Flow Builder",
        description: "Visual tool to design and deploy call flows",
        icon: PiTreeStructure,
        link: "/call-flow-builder",
        links: [
          {
            label: "Call Flow Builder",
            link: "/call-flow-builder",
            sidebar: "callFlowBuilderSidebar",
          },
        ],
      },
    },
  },
  {
    type: "section",
    title: "Additional resources",
    items: {
      blogs: {
        title: "Blogs",
        icon: FaNewspaper,
        description: "Latest news and updates from SignalWire",
        link: "/blog",
        links: [
          {
            label: "Blog Home",
            link: "/blog",
            sidebar: "",
          }
        ],
      },
      guides: {
        title: "Guides & Tutorials",
        icon: FaBook,
        link: "/guides",
        links: [
          {
            label: "Guides",
            link: "/guides",
            sidebar: "homeSidebar",
          },
        ],
      },
    },
  },
  {
    type: "section",
    title: "Need help?",
    items: {
      communityForum: {
        title: "Community Forum",
        icon: FaComments,
        link: "https://community.signalwire.com",
      },
    },
  },
];
