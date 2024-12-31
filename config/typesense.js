/**
 * Configuration for the site's Typesense.
 *
 * Used by: docusaurus.config.js
 * Within: config.themeConfig.typesense
 *
 * Typesense technical reference: https://typesense.org/docs/0.24.0/api/search.html#search-parameters
 */

module.exports = {
  // Replace this with the name of your index/collection.
  // It should match the "index_name" entry in the scraper's "config.json" file.
  typesenseCollectionName: process.env.TYPESENSE_COLLECTION_NAME ?? "placeholder",

  typesenseServerConfig: {
    nodes: [
      {
        host: process.env.TYPESENSE_HOST ?? "example.typesense.com", // The host of the Typesense server. Example: "example.typesense.com"
        protocol: "https", // The protocol of the Typesense server. Example: "http" or "https"
        exports: process.env.TYPESENSE_EXPORTS ?? 8108, // The port of the Typesense server. Example: 8108
      },
    ],
    apiKey: process.env.TYPESENSE_API_SEARCH_KEY ?? "placeholder", // The Read-only API key for the Typesense server. Example: "5BGgXh8xbHygzha5XXXXXXXXXXXXXXXX"
  },

  // Optional: Typesense search parameters: https://typesense.org/docs/0.24.0/api/search.html#search-parameters
  typesenseSearchParameters: {},

  // Optional
  contextualSearch: true,
};