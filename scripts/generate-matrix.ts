import { openapiPlugin } from '../config/pluginsConfig/docusaurus-plugin-openapi-docs';
import type { PluginOptions } from 'docusaurus-plugin-openapi-docs/src/types';

const pluginConfig = (openapiPlugin as unknown as [string, PluginOptions])[1].config;

const matrix = Object.entries(pluginConfig).map(([name, config]) => ({
  name,
  path: config.specPath
}));

console.log(JSON.stringify(matrix)); 