// Processing pipeline: walk HTML → convert → build tree → write llms.txt

import path from 'path';
import type { HtmlFileEntry } from '../types/fs';
import { DocInfo, PluginOptions } from '../types/plugin';
import type { Logger } from '../types/logging';
import { loadCache, saveCache, calcConfigHash, fileUnchanged, toFingerprint, hashFile } from '../fs/cache/manager';
import { getErrorMessage, getErrorCause } from '../utils/errors';
import { generateRoutePath } from '../fs/path';
import { createMatcher } from '@docusaurus/utils';
import pkg from '../../package.json';

// Import from newly created modules
import { processHtmlFile, checkMarkdownFileExists } from './html-processor';
import { cleanupMarkdownFiles } from '../fs/cache/cleaner';

// plugin version for cache busting
const pluginVersion: string = (pkg as { version?: string }).version ?? '0.0.0';

/** Main streaming processor with cache */
export async function processHtmlFilesStream(
  htmlFiles: AsyncIterable<HtmlFileEntry>,
  docsDir: string,
  mdOutDir: string,
  siteDir: string,
  config: PluginOptions,
  logger: Logger,
  baseUrl: string = '',
): Promise<DocInfo[]> {
  // Use the provided logger directly
  const log = logger;
  
  // If markdown files are disabled, clean up existing ones
  if (!config.enableMarkdownFiles) {
    await cleanupMarkdownFiles(mdOutDir, siteDir, log);
  }
  
  // Setup exclusion matcher
  const isExcluded = config.excludePaths?.length 
    ? createMatcher([...config.excludePaths])
    : (): boolean => false;
  
  // Always create/update the cache regardless of enableCache setting
  // This ensures we have a record of files for cleanup purposes
  const { cache, dir: cacheDir } = await loadCache(siteDir);
  const cfgHash = calcConfigHash(config);
  
  // Create a mutable copy of the cache to avoid modifying read-only properties
  const mutableCache = {
    pluginVersion,
    configHash: cfgHash, 
    files: { ...cache.files }
  };
  
  // Reset cache if version changed
  if (mutableCache.pluginVersion !== pluginVersion) {
    mutableCache.files = {};
    mutableCache.pluginVersion = pluginVersion;
  }
  
  const docs: DocInfo[] = [];
  const errors: Error[] = [];

  log.debug('Processing HTML files (stream)');

  const tasks: Promise<void>[] = [];
  const visited = new Set<string>();

  for await (const { relPath } of htmlFiles) {
    visited.add(relPath);
    
    // Check exclusion against the original HTML path, but normalize it to match exclude patterns
    // Exclude patterns are written like "/rest/**" but relPath is like "rest/index.html"
    const normalizedPath = relPath.startsWith('/') ? relPath : `/${relPath}`;
    if (isExcluded(normalizedPath)) {
      log.debug(`Skipping excluded path: ${relPath}`);
      continue;
    }
    
    const abs = path.join(docsDir, relPath);
    let hash: string;
    try { 
      hash = await hashFile(abs);
    } catch (error) { 
      const errorMsg = getErrorMessage(error);
      log.error(`Failed to hash ${relPath}: ${errorMsg}`); 
      hash = ''; 
    }

    // Check if caching is enabled and we can use the cache
    const cached = mutableCache.files[relPath];
    const shouldUseCache = cached && fileUnchanged(cached, hash);
    
    // Check if we can use cache but also need to verify the markdown file exists
    if (shouldUseCache && config.enableMarkdownFiles) {
      const mdExists = await checkMarkdownFileExists(relPath, mdOutDir);
      
      if (!mdExists) {
        // We need to regenerate even though the HTML hasn't changed
        log.debug(`Markdown file missing for ${relPath}, regenerating`);
        await processAndAddToCache(relPath, hash);
        continue;
      }
    }
    
    // Only use cache if the enableCache option is true
    if (shouldUseCache && config.enableCache !== false) {
      // Generate route path for cached entry
      const routePath = generateRoutePath(relPath, !!config.enableMarkdownFiles, log);
      docs.push({ 
        routePath,
        htmlPath: relPath, 
        title: cached.title, 
        description: cached.description 
      });
      continue;
    }

    await processAndAddToCache(relPath, hash);
  }
  
  // Helper function to process an HTML file and add to cache
  async function processAndAddToCache(relPath: string, hash: string): Promise<void> {
    const t = processHtmlFile(relPath, docsDir, mdOutDir, config, log, baseUrl)
      .then((doc): void => {
        docs.push(doc);
        // Always update cache regardless of enableCache setting
        // This helps with future cleanup operations
        mutableCache.files[relPath] = toFingerprint(hash, doc);
      })
      .catch((error): void => {
        const errorMsg = getErrorMessage(error);
        const errorCause = getErrorCause(error);
        log.error(`Error processing ${relPath}: ${errorMsg}`);
        errors.push(errorCause || new Error(String(error)));
      });
    tasks.push(t);
  }

  await Promise.all(tasks);

  // Clean up cache entries
  Object.keys(mutableCache.files).forEach(k => { 
    // Remove entries for files that no longer exist
    if (!visited.has(k)) {
      delete mutableCache.files[k];
      return;
    }
    
    // Remove entries for files that are now excluded
    const normalizedPath = k.startsWith('/') ? k : `/${k}`;
    if (isExcluded(normalizedPath)) {
      log.debug(`Removing excluded file from cache: ${k}`);
      delete mutableCache.files[k];
    }
  });

  // Save cache regardless of enableCache setting
  // This ensures we have up-to-date records for cleanup
  try { 
    await saveCache(cacheDir, mutableCache); 
    log.info(`llms-txt cache saved (${Object.keys(mutableCache.files).length} entries)`);
  } catch (error) {
    const errorMsg = getErrorMessage(error);
    log.error(`Failed to save llms-txt cache: ${errorMsg}`);
  }

  return docs;
}
