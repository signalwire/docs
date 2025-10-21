/**
 * Configuration for the site's navbar.
 *
 * Used by: docusaurus.config.ts
 * Within: config.themeConfig.navbar.items
 *
 * Docusaurus technical reference: https://docusaurus.io/docs/api/themes/configuration#navbar
 */

import type { NavbarItem } from "@docusaurus/theme-common";

const navbar: NavbarItem[] = [
  /// Guides -------- ///
  { to: "/guides", label: "Guides", position: "left" },

  /// Products Dropdown -------- ///
  {
    type: "dropdown",
    label: "Products",
    position: "left",
    items: [
      {
        type: "html",
        value: '<div class="nav-dropdown-title" href="/rest">Calling</div>',
      },
      {
        label: "Voice",
        to: "/voice",
      },
      {
        label: "AI",
        to: "/ai",
      },
      {
        label: "Video",
        to: "/video",
      },
      {
        label: "Fax",
        to: "/fax",
      },
      { type: "html", value: '<hr class="dropdown-separator">' },
      {
        type: "html",
        value: '<div class="nav-dropdown-title" href="/rest">Messaging</div>',
      },
      {
        label: "SMS",
        to: "/messaging",
      },
      {
        label: "Chat",
        to: "/chat",
      },
      { type: "html", value: '<hr class="dropdown-separator">' },

      {
        label: "SWML",
        to: "/swml",
      },
      {
        label: "Call Flow Builder",
        to: "/call-flow-builder",
      },
      {
        label: "Datasphere",
        to: "/rest/signalwire-rest/guides/datasphere/curl-usage",
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
        label: "Agents SDK (New!)",
        to: "/sdks/agents-sdk",
      },
      {
        label: "RELAY Browser SDK",
        to: "/sdks/browser-sdk/",
      },
      // {
      //   label: "SignalWire Client SDK",
      //   to: "/sdks/signalwire-client-sdk/",
      // },
      {
        label: "RELAY Realtime Server SDK",
        to: "/sdks/realtime-sdk/",
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
  {
    type: "docsVersionDropdown",
    position: "right",
    dropdownActiveClassDisabled: true,
  },

  { to: "/blog", label: "Blog", position: "right" },

  /// Support Dropdown -------- ///
  {
    type: "dropdown",
    label: "Support",
    position: "right",
    items: [
      {
        href: "https://signalwire.zohodesk.com/portal/en/newticket",
        label: "Create a Ticket",
        "aria-label": "Support",
      },
      {
        href: "https://signalwire.zohodesk.com/portal/en/myarea",
        label: "My Tickets",
        "aria-label": "Support",
      },
      {
        href: "https://status.signalwire.com",
        label: "Platform Status",
        "aria-label": "Platform Status",
      },
    ],
  },

  /// Community Dropdown -------- ///
  {
    to: "https://signalwire.zohodesk.com/portal/en/community",
    label: "Community",
    position: "right",
  },

  /// Platform Dropdown -------- ///
  {
    to: "/platform/dashboard",
    label: "Platform",
    position: "right",
    type: "dropdown",
    items: [
      {
        href: "https://signalwire.com/signup",
        label: "SignalWire Space (Signup)",
        className: "dashboard-navbar-link",
        "aria-label": "Open SignalWire Dashboard",
      },
      {
        href: "https://status.signalwire.com",
        label: "Platform Status",
        "aria-label": "Platform Status",
      },
      { type: "html", value: '<hr class="dropdown-separator">' },
      {
        label: "Call Fabric",
        to: "/platform/call-fabric",
      },
      {
        label: "Dashboard Documentation",
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

  {
    href: "https://discord.com/invite/F2WNYTNjuF",
    position: "right",
    "aria-label": "Discord server",
    className: "header-discord-link",
  },

  {
    href: "https://github.com/signalwire/docs",
    position: "right",
    className: "header-github-link",
    "aria-label": "GitHub repository",
  },
];

export default navbar;
