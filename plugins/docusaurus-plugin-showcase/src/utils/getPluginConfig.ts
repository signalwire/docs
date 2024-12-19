// @ts-ignore
import siteConfig from "@generated/docusaurus.config";

const pluginName: string = "docusaurus-plugin-showcase";
const plugins = siteConfig.plugins;


export interface PluginConfig {
  title: string;
  include: string;
  ignore: string;
  onLogFailedAttempts: boolean;
  prioritizeTags: string[];
  description: string;
  path: string;
  page: string;
  displayFavorites: boolean
  displayTableOfContents: boolean
  tags: [];
  logging: boolean;
}

function getPluginConfig(): PluginConfig {
  // Search for the plugin in the plugins array
  const plugin = plugins.find((p: any) =>
    Array.isArray(p) && p.length > 1 && typeof p[0] === 'string' && p[0] === pluginName
  );

  // Check if the plugin was found and is an array
  if (!plugin || !Array.isArray(plugin)) {
    throw new Error(`Plugin with name '${pluginName}' not found.`);
  }

  // Return the plugin configuration
  return plugin[1] as unknown as PluginConfig;
}

export default getPluginConfig;
