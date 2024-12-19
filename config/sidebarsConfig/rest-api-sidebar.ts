/*
* Many REST API endpoint sidebars have items that are autogenerated using the `docusaurus-plugin-openapi-docs` plugin.
* These autogenerated sidebars are created in the output directory specified in the plugin configuration.
* The configuration field for this is `outputDir`.
* 
* Example: outputDir: "docs/rest/compatibility-api/endpoints".
* 
* We then import these autogenerated sidebars here and add them to the sidebar items array.
* This process is repeated for each REST API endpoint sidebar.
* 
* Example: require("../../docs/rest/compatibility-api/endpoints/sidebar")
*/

import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const apiSidebar: SidebarsConfig = {
  apiSidebar: [
    {
      type: "category",
      label: "Overview",
      collapsible: false,
      collapsed: false,
      className: "menu-category",
      link: {
        type: "generated-index",
        title: "Overview",
        description: "Overview of the SignalWire REST APIs",
        slug: "/rest",
      },
      items: [
        {
          type: "autogenerated",
          dirName: "rest/overview",
        },
      ],
    },

    {
      type: "category",
      label: "Compatibility REST API",
      collapsible: false,
      className: "menu-category",
      link: {
        type: "generated-index",
        title: "Compatibility REST API",
        description:
          "This API may look very similar to other, existing APIs you've used before — on purpose! The SignalWire Compatibility REST API is designed to make migrating your existing phone or messaging application easy and quick, while giving you access to our next generation APIs and endpoints to help you take your application to the next level.",
        slug: "/rest/compatibility-api",
      },
      items: [
        {
          type: "autogenerated",
          dirName: "rest/compatibility-api/overview",
        },
        {
          type: "category",
          label: "REST Endpoints ",
          link: {
            type: "generated-index",
            title: "Available Compatibility REST API Endpoints",
            description:
              "Below are the available Compatibility REST APIs categorized by their endpoints.",
            slug: "/rest/compatibility-api/endpoints",
          },
          items: require("../../docs/rest/compatibility-api/endpoints/sidebar"),
        },
      ],
    },

    {
      type: "category",
      label: "SignalWire REST API",
      collapsible: false,
      className: "menu-category",
      link: {
        type: "generated-index",
        title: "SignalWire REST API",
        description:
          "SignalWire REST APIs offer a robust and flexible way to integrate advanced communication capabilities into your applications. Designed to handle voice, messaging, video, and more functionalities, these APIs enable developers to build and scale communication solutions with ease. Whether you need to create a simple SMS notification system or a complex, multi-channel communication platform, SignalWire provides the tools and documentation necessary to get started quickly.",
        slug: "/rest/signalwire-rest",
      },
      items: [
        {
          type: "autogenerated",
          dirName: "rest/signalwire-rest/overview",
        },
        {
          type: "category",
          label: "REST Endpoints",
          collapsed: true,
          link: {
            type: "generated-index",
            title: "Available SignalWire REST Endpoints",
            description:
              "Below are the available SignalWire REST APIs categorized by their endpoints.",
            slug: "/rest/signalwire-rest/endpoints",
          },
          items: [
            {
              link: {
                type: "generated-index",
                title: "Calling",
                description:
                  "Below are the available Calling REST APIs categorized by their endpoints.",
                slug: "/rest/signalwire-rest/endpoints/calling",
              },
              type: "category",
              label: "Calling",
              items: require("../../docs/rest/signalwire-rest/endpoints/calling/sidebar"),
            },
            {
              link: {
                type: "generated-index",
                title: "Chat",
                description:
                  "Below are the available Chat REST APIs categorized by their endpoints.",
                slug: "/rest/signalwire-rest/endpoints/chat",
              },
              type: "category",
              label: "Chat",
              items: require("../../docs/rest/signalwire-rest/endpoints/chat/sidebar"),
            },
            {
              link: {
                type: "generated-index",
                title: "Datasphere",
                description:
                  "Below are the available Datasphere REST APIs categorized by their endpoints.",
                slug: "/rest/signalwire-rest/endpoints/datasphere",
              },
              type: "category",
              label: "Datasphere",
              items: require("../../docs/rest/signalwire-rest/endpoints/datasphere/sidebar"),
            },
            {
              link: {
                type: "generated-index",
                title: "Fabric",
                description:
                  "Below are the available Fabric REST APIs categorized by their endpoints.",
                slug: "/rest/signalwire-rest/endpoints/fabric",
              },
              type: "category",
              label: "Fabric",
              items: require("../../docs/rest/signalwire-rest/endpoints/fabric/sidebar"),
            },
            {
              link: {
                type: "generated-index",
                title: "Fax",
                description:
                  "Below are the available Fax REST APIs categorized by their endpoints.",
                slug: "/rest/signalwire-rest/endpoints/fax",
              },
              type: "category",
              label: "Fax",
              items: require("../../docs/rest/signalwire-rest/endpoints/fax/sidebar"),
            },
            {
              link: {
                type: "generated-index",
                title: "Messaging",
                description:
                  "Below are the available Messaging REST APIs categorized by their endpoints.",
                slug: "/rest/signalwire-rest/endpoints/messaging",
              },
              type: "category",
              label: "Messaging",
              items: require("../../docs/rest/signalwire-rest/endpoints/messaging/sidebar"),
            },
            {
              link: {
                type: "generated-index",
                title: "Project",
                description:
                  "Below are the available SignalWire Project REST APIs categorized by their endpoints.",
                slug: "/rest/signalwire-rest/endpoints/project",
              },
              type: "category",
              label: "Project",
              items: require("../../docs/rest/signalwire-rest/endpoints/project/sidebar"),
            },
            {
              link: {
                type: "generated-index",
                title: "PubSub",
                description:
                  "Below are the available PubSub REST APIs categorized by their endpoints.",
                slug: "/rest/signalwire-rest/endpoints/pubsub",
              },
              type: "category",
              label: "PubSub",
              items: require("../../docs/rest/signalwire-rest/endpoints/pubsub/sidebar"),
            },
            {
              link: {
                type: "generated-index",
                title: "SignalWire Space",
                description:
                  "Below are the available SignalWire Space REST APIs categorized by their endpoints.",
                slug: "/rest/signalwire-rest/endpoints/space",
              },
              type: "category",
              label: "SignalWire Space",
              items: require("../../docs/rest/signalwire-rest/endpoints/space/sidebar"),
            },
            {
              link: {
                type: "generated-index",
                title: "Video",
                description:
                  "Below are the available Video REST APIs categorized by their endpoints.",
                slug: "/rest/signalwire-rest/endpoints/video",
              },
              type: "category",
              label: "Video",
              items: require("../../docs/rest/signalwire-rest/endpoints/video/sidebar"),
            },
            {
              link: {
                type: "generated-index",
                title: "Voice",
                description:
                  "Below are the available Voice REST APIs categorized by their endpoints.",
                slug: "/rest/signalwire-rest/endpoints/voice",
              },
              type: "category",
              label: "Voice",
              items: require("../../docs/rest/signalwire-rest/endpoints/voice/sidebar"),
            },
          ],
        },
        {
          type: "category",
          label: "Guides",
          collapsed: true,
          items: [
            {
              type: "autogenerated",
              dirName: "rest/signalwire-rest/guides",
            },
          ],
        },
      ],
    },
  ],
};

export default apiSidebar;