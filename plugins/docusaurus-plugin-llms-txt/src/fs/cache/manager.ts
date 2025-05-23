import fs from 'fs-extra';
import path from 'path';
import { DocInfo, PluginOptions, FileFingerprint, CacheSchema } from '../../types';
import { createFileError, getErrorCause } from '../../utils';
import { writeJsonAtomic } from '../io/atomic';
import { md5Hash } from '@docusaurus/utils';
import { getCacheDir, getCacheFilePath } from '../path';
import { CACHE_FILE_NAME } from '../../constants';

/**
 * Extract only the options that affect content generation.
 * Changes to these options should invalidate the cache.
 * 
 * INCLUDED (affect content):
 * - enableMarkdownFiles: affects link formats and file generation
 * - relativePaths: affects link formats in generated content  
 * - enableDescriptions: affects whether descriptions are included in output
 * - contentSelectors: affects what content is extracted from HTML
 * - depth: affects categorization and tree structure
 * - pathRules: affects categorization, content selectors, and processing
 * - remarkStringify: affects Markdown output formatting
 * - remarkGfm: affects Markdown features and formatting
 * - rehypeProcessTables: affects how tables are processed
 * - siteTitle: affects the title in llms.txt
 * - siteDescription: affects the description in llms.txt
 * - optionalLinks: affects content in llms.txt
 * - excludePaths: affects which links are processed by rehype-links
 * 
 * EXCLUDED (don't affect content):
 * - logLevel: only affects logging verbosity
 * - enableCache: affects caching behavior, not content
 * - runOnPostBuild: affects when plugin runs, not content
 * - docsRoot, outputDir, buildDir: affect file paths, not content
 */
function getContentAffectingOptions(options: Partial<PluginOptions>): Partial<PluginOptions> {
  const {
    // Content generation options
    enableMarkdownFiles,
    relativePaths,
    enableDescriptions,
    
    // Content extraction options
    contentSelectors,
    
    // Structure options
    depth,
    pathRules,
    
    // Format options
    remarkStringify,
    remarkGfm,
    rehypeProcessTables,
    
    // Content options
    siteTitle,
    siteDescription,
    optionalLinks,
    
    // Processing options that affect content
    excludePaths,
    
    // Note: We DON'T include options that don't affect content:
    // - logLevel: only affects logging
    // - enableCache: affects caching behavior, not content
    // - runOnPostBuild: affects when plugin runs, not content
    // - docsRoot, outputDir, buildDir: affect file paths, not content
  } = options;

  return {
    enableMarkdownFiles,
    relativePaths,
    enableDescriptions,
    contentSelectors,
    depth,
    pathRules,
    remarkStringify,
    remarkGfm,
    rehypeProcessTables,
    siteTitle,
    siteDescription,
    optionalLinks,
    excludePaths,
  };
}

export function calcConfigHash(options: Partial<PluginOptions>): string {
  const contentOptions = getContentAffectingOptions(options);
  
  // Remove undefined values to ensure stable serialization
  const stableOptions = Object.fromEntries(
    Object.entries(contentOptions).filter(([_, value]) => value !== undefined)
  );
  
  const stable = JSON.stringify(stableOptions, Object.keys(stableOptions).sort());
  return md5Hash(stable);
}

export async function loadCache(siteDir: string): Promise<{ cache: CacheSchema; dir: string }> {
  const cacheDir = getCacheDir(siteDir);
  const cachePath = getCacheFilePath(siteDir);
  try {
    const data = await fs.readJson(cachePath);
    return { cache: data as CacheSchema, dir: cacheDir };
  } catch (error) {
    // Non-critical - return empty cache if we can't load
    return { cache: { pluginVersion: '', configHash: '', files: {} }, dir: cacheDir };
  }
}

export async function saveCache(cacheDir: string, cache: CacheSchema): Promise<void> {
  const cachePath = path.join(cacheDir, CACHE_FILE_NAME);
  try {
    await writeJsonAtomic(cachePath, cache);
  } catch (error) {
    const errorCause = getErrorCause(error);
    throw createFileError('Failed to write cache file', cachePath, errorCause);
  }
}

export function fileUnchanged(entry: FileFingerprint, hash: string): boolean {
  return entry?.hash === hash;
}

export function toFingerprint(hash: string, doc: DocInfo): FileFingerprint {
  return { hash, title: doc.title, description: doc.description };
}

export async function hashFile(filePath: string): Promise<string> {
  const content = await fs.readFile(filePath, 'utf8');
  return md5Hash(content);
} 