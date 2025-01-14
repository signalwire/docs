/**
 * Configuration for the site's navbar.
 *
 * Used by: docusaurus.config.js
 * Within: config.themeConfig.navbar.items
 *
 * Docusaurus technical reference: https://docusaurus.io/docs/api/themes/configuration#navbar
 */

module.exports = [
  /// Guides -------- ///
  { to: "/guides", label: "Guides", position: "left" },

  /// Platform Dropdown -------- ///
  {
    to: "/platform",
    label: "Platform",
    position: "left",
    type: "dropdown",
    items: [
      {
        label: "Call Fabric",
        to: "/platform/call-fabric",
      },
      {
        label: "Dashboard",
        to: "/platform/dashboard",
      },
      {
        label: "Integrations",
        to: "/platform/integrations",
      },
      {
        label: "Phone Numbers",
        to: "/platform/phone-numbers",
      },
      {
        label: "Platform Basics",
        to: "/platform/basics",
      },
    ],
  },

  /// Products Dropdown -------- ///
  {
    type: "dropdown",
    label: "Products",
    position: "left",
    items: [
      {
        label: "Voice",
        to: "/voice",
      },
      {
        label: "Messaging",
        to: "/messaging",
      },
      {
        label: "Chat",
        to: "/chat",
      },
      {
        label: "Fax",
        to: "/fax",
      },
      {
        label: "Video",
        to: "/video",
      },
      { type: "html", value: '<hr class="dropdown-separator">' },
      {
        label: "AI",
        to: "/ai",
      },
      {
        label: "SWML",
        to: "/swml",
      },
      {
        label: "Call Flow Builder",
        to: "/call-flow-builder",
      },
      {
        label: "RELAY",
        to: "/sdks/overview/what-is-relay",
      },
      {
        label: "Compatibility API",
        to: "/compatibility-api",
      },
    ],
  },

  /// API & SDK Reference Dropdown -------- ///
  {
    type: "dropdown",
    label: "APIs & SDKs",
    position: "left",
    items: [
      {
        type: "html",
        value: '<div class="nav-dropdown-title" href="/rest">SignalWire</div>',
      },
      {
        label: "REST API",
        to: "/rest/signalwire-rest/overview/",
      },
      {
        label: "RELAY Browser SDK",
        to: "/sdks/reference/browser-sdk/",
      },
      {
        label: "RELAY Realtime Server SDK",
        to: "/sdks/reference/realtime-sdk/relay-v4",
      },
      { type: "html", value: '<hr class="dropdown-separator">' },
      {
        type: "html",
        value: '<div class="nav-dropdown-title" href="/sdks/">Compatibility</div>',
      },
      {
        label: "REST API",
        to: "/rest/compatibility-api/overview/",
      },
      {
        label: "SDKs",
        to: "/compatibility-api/sdks",
      },
      {
        label: "cXML",
        to: "/compatibility-api/cxml",
      },
      { type: "html", value: '<hr class="dropdown-separator">' },
      {
        label: "All REST APIs",
        to: "/rest",
      },
      {
        label: "All RELAY SDKs",
        to: "/sdks",
      },
    ],
  },

  { to: "/blog", label: "Blog", position: "right" },

  /// Support Dropdown -------- ///
  {
    type: "dropdown",
    label: "Support",
    position: "right",
    items: [
      {
        href: "https://support.signalwire.com",
        label: "Contact Support",
        "aria-label": "Support",
      },

      {
        href: "https://status.signalwire.com",
        label: "Platform Status",
        "aria-label": "Platform Status",
      },

      {
        href: "https://signalwire-community.slack.com/",
        label: "Slack",
        "aria-label": "Slack Community",
      },
    ],
  },

  {
    href: "https://id.signalwire.com",
    label: "Dashboard",
    position: "right",
    className: "dashboard-navbar-link",
    "aria-label": "Dashboard",
  },
];