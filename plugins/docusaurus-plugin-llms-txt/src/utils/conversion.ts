import path from 'path';
import { PluginOptions, LogLevel, DocInfo, TreeNode } from '../types/plugin';
import { getConfig } from '../config/options';
import { saveMarkdownFile } from '../fs/io/write';
import { walkHtmlFiles } from '../fs/io/read';
import { processHtmlFilesStream } from '../pipeline/orchestrator';
import { buildTree } from '../pipeline/tree-builder';
import { renderTreeMarkdown } from '../pipeline/markdown-renderer';
import { createLogger } from '../logging/logger';
import { LLMS_TXT_FILENAME } from '../constants';

/**
 * Setup and validate directory paths for the conversion process
 */
function setupDirectories(
  siteDir: string, 
  config: PluginOptions
): { outDir: string; docsDir: string; mdOutDir: string } {
  const outDir = path.join(siteDir, config.buildDir || 'build');
  const docsDir = path.join(outDir, config.docsRoot || '');
  const mdOutDir = config.outputDir ? path.join(siteDir, config.outputDir) : docsDir;
  
  return { outDir, docsDir, mdOutDir };
}

/**
 * Resolve the document title from various sources with proper priority
 */
function resolveDocumentTitle(
  config: PluginOptions, 
  siteTitle: string, 
  rootDoc?: DocInfo
): string {
  // Prioritize sources for the title in this order:
  // 1. Config title (siteTitle)
  // 2. Docusaurus site title
  // 3. Root document's title
  // 4. Fallback to "Documentation"
  return config.siteTitle || siteTitle || (rootDoc?.title) || 'Documentation';
}

/**
 * Generate the complete llms.txt markdown content
 */
function generateLlmsTxtContent(
  tree: TreeNode,
  config: PluginOptions,
  baseUrl: string,
  documentTitle: string,
  rootDoc?: DocInfo
): string {
  let markdown = `# ${documentTitle}\n\n`;
  
  // Check if descriptions are enabled (default is true)
  const enableDescriptions = config.enableDescriptions !== false;
  
  // Add site description only if descriptions are enabled
  if (enableDescriptions) {
    // Use the configured siteDescription if available, otherwise try to use the root document's description
    const description = config.siteDescription || (rootDoc?.description);
    if (description) {
      markdown += `> ${description}\n\n`;
    }
  }
  
  const useRelativePaths = config.relativePaths !== false;
  markdown += renderTreeMarkdown(
    tree, 
    2, 
    true, 
    baseUrl, 
    useRelativePaths, 
    !!config.enableMarkdownFiles,
    enableDescriptions
  );
  
  if (config.optionalLinks?.length) {
    markdown += `\n## Optional\n`;
    for (const l of config.optionalLinks) {
      // Apply description setting to optional links too
      const descPart = enableDescriptions && l.description ? `: ${l.description}` : '';
      markdown += `- [${l.title}](${l.url})${descPart}\n`;
    }
  }
  
  return markdown;
}

/**
 * Shared helper with unified logging and error handling
 * 
 * @param siteDir - Site directory
 * @param cfgOverride - Options to override default config
 * @param title - Site title for llms.txt
 * @param baseUrl - Base URL of the site (from Docusaurus config)
 */
export async function runConversion(
  siteDir: string,
  cfgOverride: Partial<PluginOptions>,
  title: string,
  baseUrl: string = '',
): Promise<void> {
  // Create the logger based on the configuration
  const config = getConfig(cfgOverride);
  const name = 'docusaurus-plugin-llms-txt';
  
  // Use the new factory function for dependency injection
  const log = createLogger(name, config.logLevel || LogLevel.INFO);

  try {
    const { outDir, docsDir, mdOutDir } = setupDirectories(siteDir, config);

    log.info(`Processing HTML files in ${docsDir}`);
    const htmlStream = walkHtmlFiles(docsDir, docsDir);

    const docs = await processHtmlFilesStream(
      htmlStream, 
      docsDir, 
      mdOutDir, 
      siteDir, 
      config, 
      log, 
      baseUrl
    );

    if (config.enableLlmsTxt && docs.length) {
      const tree = buildTree(docs, config);
      
      // Look for the root document (index page)
      const rootDoc = docs.find(doc => doc.routePath === '/index.md' || doc.routePath === 'index.md');
      
      const documentTitle = resolveDocumentTitle(config, title, rootDoc);
      const markdown = generateLlmsTxtContent(tree, config, baseUrl, documentTitle, rootDoc);
      
      await saveMarkdownFile(
        path.join(outDir, LLMS_TXT_FILENAME),
        markdown,
      );
      log.info('llms.txt written');
    }

    log.info('llms-txt conversion completed');
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : String(error);
    log.error(`Error: ${errorMessage}`);
    throw error;
  }
} 