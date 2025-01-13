/**
 * Configuration for the site's Typesense.
 *
 * Used by: docusaurus.config.ts
 * Within: config.themeConfig.typesense
 *
 * Typesense technical reference: https://typesense.org/docs/0.24.0/api/search.html#search-parameters
 */

import type { ThemeConfig } from 'docusaurus-theme-search-typesense';
import type { ConfigurationOptions } from 'typesense/lib/Typesense/Configuration';
import type { SearchParams } from 'typesense/lib/Typesense/Documents';

const config: NonNullable<ThemeConfig['typesense']> = {
  typesenseCollectionName: process.env.TYPESENSE_COLLECTION_NAME ?? "placeholder",

  typesenseServerConfig: {
    nodes: [
      {
        host: process.env.TYPESENSE_HOST ?? "example.typesense.com",
        protocol: "https",
        port: Number(process.env.TYPESENSE_EXPORTS) ?? 8108,
      },
    ],
    apiKey: process.env.TYPESENSE_API_SEARCH_KEY ?? "placeholder",
  } satisfies ConfigurationOptions,

  typesenseSearchParameters: {} satisfies SearchParams,

  contextualSearch: true,
  searchPagePath: false,
};

export default config; 