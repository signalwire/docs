import path from 'path';
import type { LoadContext, Plugin } from '@docusaurus/types';
import { PluginOptions, pluginOptionsSchema } from './types';
import { getConfig } from './config';
import { createLogger } from './logging';
import { registerLlmsTxt, registerLlmsTxtClean } from './cli/command';
import { runConversion } from './utils/conversion';
import { LogLevel } from './constants';

/**
 * Docusaurus plugin to generate Markdown versions of HTML pages and an llms.txt index file.
 * 
 * This plugin runs after the build process and:
 * 1. Converts HTML pages to Markdown using rehype/remark
 * 2. Creates an llms.txt index file with links to all documents
 */
export default function llmsTxtPlugin(
  context: LoadContext,
  options: Partial<PluginOptions> = {}
): Plugin<void> {
  // Plugin instance name - helps with debugging
  const name = 'docusaurus-plugin-llms-txt';
  
  return {
    name,
    
    async postBuild({ outDir, siteConfig }): Promise<void> {
      // Check if we should run during postBuild
      const config = getConfig(options);
      
      // Create logger using factory function
      const log = createLogger(name, config.logLevel || LogLevel.INFO);
      
      if (config.runOnPostBuild === false) {
        log.info('Skipping postBuild processing (runOnPostBuild=false)');
        return;
      }
      
      // Get full site URL by combining url and baseUrl
      const siteUrl = siteConfig.url + (siteConfig.baseUrl !== '/' ? siteConfig.baseUrl : '');
      
      // Run the conversion process with the site's full URL
      await runConversion(path.dirname(outDir), options, siteConfig.title, siteUrl);
    },

    extendCli(cli): void {
      // Pass context directly so CLI commands can access siteConfig when executed
      registerLlmsTxt(cli, name, options, context);
      registerLlmsTxtClean(cli, name, options);
    },
  };
}

// Type-safe validation function
export function validateOptions({ 
  options, 
  validate 
}: {
  options: unknown;
  validate: (schema: unknown, options: unknown) => PluginOptions;
}): PluginOptions {
  return validate(pluginOptionsSchema, options);
}
