/**
 * Configuration for the site's branding.
 *
 * Used by: docusaurus.config.js
 * Within: config
 *
 * Docusaurus technical reference: https://docusaurus.io/docs/api/themes/configuration#navbar
 */

module.exports = {
  title: "SignalWire Developer Portal", // Set to the title of the site. This is added to the window title.
  url: "https://developer.signalwire.com", // Set to the URL of the site.
  baseUrl: "/", // Set to the base URL of the site.
  favicon: "img/favicon.svg", // set in the 'static/img' folder

  navbar: { // Read more about the navbar options at: https://docusaurus.io/docs/api/themes/configuration#navbar
    logo: {
      alt: "SignalWire", // Set to the alt text of the logo.
      src: "img/logo.svg", // set in the 'static/img' folder
      href: "pathname:///", // redirect to the root of the site
      target: "_self", // open in the same tab
    },
    items: require("./navbar.js"), // All navbar options can be modified at the /config/navbar.js file.
  },
};