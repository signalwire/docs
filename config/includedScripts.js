/**
 * Configuration for the site's included scripts.
 *
 * Used by: docusaurus.config.js
 * Within: config.scripts
 *
 * Docusaurus technical reference: https://docusaurus.io/docs/api/docusaurus-config#scripts
 */

module.exports = [
  {
    src: "/scripts/apollo.js",
    async: true,
    nonce: "SIGNALWIRE_DOCS_CSP_NONCE",
  },
  {
    src: "/scripts/koala.js",
    async: true,
    nonce: "SIGNALWIRE_DOCS_CSP_NONCE",
  },
  {
    src: "/scripts/fullstory.js",
    async: true,
    nonce: "SIGNALWIRE_DOCS_CSP_NONCE",
  },
  {
    src: "/scripts/munchkin.js",
    async: true,
    nonce: "SIGNALWIRE_DOCS_CSP_NONCE",
  },
  {
    src: "/scripts/zendesk.js",
    async: true,
    nonce: "SIGNALWIRE_DOCS_CSP_NONCE",
  },
];
