import React from "react";
import {
  FaHome,
  FaCode,
  FaRobot,
  FaDesktop,
  FaServer,
  FaPlug,
  FaExchangeAlt,
  FaProjectDiagram,
  FaBook,
  FaComments,
} from "react-icons/fa";
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
        title: "Platform",
        icon: FaHome,
        description: "Platform overview and getting started resources",
        link: "/",
        links: [
          {
            label: "Overview",
            link: "/",
            sidebar: "homeSidebar",
          },
          {
            label: "Products",
            link: "/voice",
            sidebar: "homeSidebar",
          },
          {
            label: "Platform Basics",
            link: "/platform/basics",
            sidebar: "homeSidebar",
          },
          {
            label: "Dashboard",
            link: "/platform/dashboard",
            sidebar: "homeSidebar",
          },
        ],
      },
      swml: {
        title: "SWML",
        icon: FaCode,
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
            label: "Overview",
            link: "/sdks/agents-sdk",
            sidebar: "agentsSdkSidebar",
          },
          {
            label: "Getting Started",
            link: "/sdks/agents-sdk/getting-started",
            sidebar: "agentsSdkSidebar",
          },
        ],
      },
      browserSdk: {
        title: "Browser SDK",
        icon: FaDesktop,
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
                label: "Technical Reference",
                link: "/sdks/browser-sdk/technical-reference",
                sidebar: "browserSdkReferenceSidebar",
              },
              {
                label: "Guides",
                link: "/sdks/browser-sdk/guides",
                sidebar: "browserSdkGuidesSidebar",
              },
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
                label: "Technical Reference",
                link: "/sdks/browser-sdk/v2/call",
                sidebar: "browserSdkReferenceSidebar",
              },
              {
                label: "Guides",
                link: "/sdks/browser-sdk/v2/guides",
                sidebar: "browserSdkGuidesSidebar",
              },
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
                label: "Technical Reference",
                link: "/sdks/realtime-sdk/technical-reference",
                sidebar: "realtimeSdkReferenceSidebar",
              },
              {
                label: "Guides",
                link: "/sdks/realtime-sdk/guides",
                sidebar: "realtimeSdkGuidesSidebar",
              },
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
                label: "Technical Reference",
                link: "/sdks/realtime-sdk/v3/technical-reference",
                sidebar: "realtimeSdkReferenceSidebar",
              },
              {
                label: "Guides",
                link: "/sdks/realtime-sdk/v3/guides",
                sidebar: "realtimeSdkGuidesSidebar",
              },
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
                label: "Technical Reference",
                link: "/sdks/realtime-sdk/v2/language/nodejs",
                sidebar: "realtimeSdkLanguageSidebar",
              },
              {
                label: "Guides",
                link: "/sdks/realtime-sdk/v2/guides",
                sidebar: "realtimeSdkGuidesSidebar",
              },
            ],
          },
        },
      },
      restApi: {
        title: "REST APIs",
        icon: FaPlug,
        description: "SignalWire REST API endpoints",
        link: "/rest",
        links: [
          {
            label: "Overview",
            link: "/rest",
            sidebar: "apiSidebar",
          },
          {
            label: "SignalWire REST",
            link: "/rest/signalwire-rest",
            sidebar: "apiSidebar",
          },
          {
            label: "Compatibility REST",
            link: "/rest/compatibility-api",
            sidebar: "apiSidebar",
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
            label: "Technical Reference",
            link: "/compatibility-api/cxml",
            sidebar: "compatibilityApiReferenceSidebar",
          },
          {
            label: "Guides",
            link: "/compatibility-api/guides",
            sidebar: "compatibilityApiGuidesSidebar",
          },
        ],
      },
    },
  },
  {
    type: "section",
    title: "Additional resources",
    items: {
      callFlowBuilder: {
        title: "Call Flow Builder",
        icon: FaProjectDiagram,
        link: "/call-flow-builder",
        links: [
          {
            label: "Call Flow Builder",
            link: "/call-flow-builder",
            sidebar: "homeSidebar",
          },
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
