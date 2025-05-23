import type { CommanderStatic } from 'commander';
import path from 'path';
import fs from 'fs-extra';
import type { LoadContext } from '@docusaurus/types';
import { PluginOptions, LogLevel } from '../types/plugin';
// Import the shared runConversion function from utils
import { runConversion } from '../utils/conversion';
import { createLogger } from '../logging/logger';
import { cleanupMarkdownFiles } from '../fs/cache/cleaner';
import { LLMS_TXT_FILENAME } from '../constants';

/**
 * Register the `llms-txt` command on Docusaurus' CLI instance.
 * 
 * @param cli - Docusaurus CLI instance
 * @param pluginName - Plugin name for logging
 * @param baseOptions - Base plugin options from the config
 * @param context - Docusaurus load context containing siteConfig
 */
export function registerLlmsTxt(
  cli: CommanderStatic,
  pluginName: string,
  baseOptions: Partial<PluginOptions>,
  context: LoadContext,
): void {
  cli
    .command('llms-txt [siteDir]')
    .description('Generate llms.txt and/or Markdown files using site configuration')
    .action(async (
      siteDirArg: string | undefined,
    ) => {
      const siteDir = siteDirArg ? path.resolve(siteDirArg) : process.cwd();
      
      // Create logger using factory function
      const log = createLogger(pluginName, LogLevel.INFO);
      
      // Check if build directory exists before proceeding
      const buildDir = path.join(siteDir, baseOptions.buildDir || 'build');
      if (!await fs.pathExists(buildDir)) {
        log.error(`Build directory not found: ${buildDir}`);
        log.error('Please run "npm run build" or "yarn build" first to generate the site build.');
        log.error('Alternatively, specify a custom build directory using the buildDir option in your plugin configuration.');
        process.exit(1);
      }
      
      // Simplified logging - only show core configuration details
      log.info('Starting llms-txt conversion');
      log.info(`Using configuration: llms.txt=${baseOptions.enableLlmsTxt ? 'enabled' : 'disabled'}, markdown=${baseOptions.enableMarkdownFiles ? 'enabled' : 'disabled'}`);
      log.info(`Build directory: ${buildDir}`);
      
      // Access siteConfig from context when the command is executed
      const title = context.siteConfig.title;
      const siteUrl = context.siteConfig.url + (context.siteConfig.baseUrl !== '/' ? context.siteConfig.baseUrl : '');
      
      // Call the shared conversion function with the original plugin options
      await runConversion(siteDir, baseOptions, title, siteUrl);
    });
}

/**
 * Register the `llms-txt-clean` command on Docusaurus' CLI instance.
 * 
 * @param cli - Docusaurus CLI instance
 * @param pluginName - Plugin name for logging
 * @param baseOptions - Base plugin options from the config
 */
export function registerLlmsTxtClean(
  cli: CommanderStatic,
  pluginName: string,
  baseOptions: Partial<PluginOptions>,
): void {
  cli
    .command('llms-txt-clean [siteDir]')
    .description('Remove all generated markdown files and llms.txt from the plugin')
    .action(async (
      siteDirArg: string | undefined,
    ) => {
      const siteDir = siteDirArg ? path.resolve(siteDirArg) : process.cwd();
      
      // Create logger using factory function
      const log = createLogger(pluginName, LogLevel.INFO);
      
      log.info('Starting llms-txt cleanup');
      
      // Determine directories from config
      const config = baseOptions;
      const outDir = path.join(siteDir, config.buildDir || 'build');
      const docsDir = path.join(outDir, config.docsRoot || '');
      const mdOutDir = config.outputDir ? path.join(siteDir, config.outputDir) : docsDir;
      
      // Check if build directory exists (but don't fail if it doesn't for cleanup)
      if (!await fs.pathExists(outDir)) {
        log.info(`Build directory not found: ${outDir} (already clean)`);
        return;
      }
      
      try {
        // Clean up markdown files
        await cleanupMarkdownFiles(mdOutDir, siteDir, log);
        
        // Clean up llms.txt file
        const llmsTxtPath = path.join(outDir, LLMS_TXT_FILENAME);
        if (await fs.pathExists(llmsTxtPath)) {
          await fs.remove(llmsTxtPath);
          log.info(`Removed ${LLMS_TXT_FILENAME}`);
        } else {
          log.info(`${LLMS_TXT_FILENAME} not found (already clean)`);
        }
        
        log.info('✅ Cleanup completed successfully');
      } catch (error) {
        const errorMessage = error instanceof Error ? error.message : String(error);
        log.error(`❌ Cleanup failed: ${errorMessage}`);
        process.exit(1);
      }
    });
} 