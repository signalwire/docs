/**
 * Configuration for the site's stylesheets.
 *
 * Used by: docusaurus.config.ts
 * Within: config.stylesheets
 *
 * Docusaurus technical reference: https://docusaurus.io/docs/api/docusaurus-config#stylesheets
 */

import type { Config } from '@docusaurus/types';

const stylesheets: NonNullable<Config['stylesheets']> = [
  "https://fonts.googleapis.com/css2?family=Inter:wght@100;300;400;500;700&display=swap",
  "https://fonts.googleapis.com/icon?family=Material+Icons"
];

export default stylesheets; 