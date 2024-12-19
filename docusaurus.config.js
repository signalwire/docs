
// Learn more about Docusaurus configuration at: https://docusaurus.io/docs/api/docusaurus-config

import dotenv from "dotenv";
dotenv.config(); // Imports environment variables from the .env file. The .env file should be in the root of the project.


const branding = require("./config/branding.js"); // Imports all branding options from the /config/branding.js file.

/** @type {import('@docusaurus/types').Config} */
const config = {
  markdown: {
    mermaid: true, // enables mermaid diagrams in markdown files
  },
  themes: [
    "@docusaurus/theme-mermaid", // Imports the mermaid library for rendering diagrams
    "docusaurus-theme-openapi-docs", // Imports the openapi-docs theme for rendering OpenAPI documentation
    "docusaurus-theme-search-typesense", // Imports the typesense theme for rendering search results
  ],


  // All branding options can be modified at the /config/branding.js file.

  title: branding.title,
  url: branding.url,
  baseUrl: branding.baseUrl ?? "/",
  favicon: branding.favicon ?? "/favicon.ico", 


/*  Errors are thrown if broken links, markdown links, anchors, or duplicate routes are found.
    This is useful for catching errors during development.
    More information can be found at: https://docusaurus.io/docs/api/docusaurus-config
*/


  onBrokenLinks: "throw",
  onBrokenMarkdownLinks: "throw",
  onBrokenAnchors: "throw",
  onDuplicateRoutes: "throw",


  i18n: {
    defaultLocale: "en-US", // Sets useful metadata for the site, such as HTML lang attribute.
    locales: ["en-US"],
  },


  presets: require("./config/presets"), // All preset options can be modified at the /config/presets.js file.
  plugins: require("./config/pluginsConfig"), // plugins of the site. All plugin options can be modified at the /config/pluginsConfig/index.ts file.

  
  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: branding.navbar, // navbar of the site
      typesense: require("./config/typesense"), // typesense configuration. All typesense options can be modified at the /config/typesense.js file.
      ...require("./config/themeConfig/config.js"), // theme configuration. All theme options can be modified at the /config/themeConfig/config.js file.
    }),


  stylesheets: require("./config/stylesheets.js"), // stylesheets of the site. All stylesheet options can be modified at the /config/stylesheets.js file.
  scripts: require("./config/includedScripts.js"), // scripts of the site. All script options can be modified at the /config/includedScripts.js file.
};

module.exports = config;