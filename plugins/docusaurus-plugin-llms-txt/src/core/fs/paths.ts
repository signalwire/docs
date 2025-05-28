/**
 * Comprehensive path utilities for directory setup and cross-platform operations
 * Consolidates path handling logic from multiple modules for better maintainability
 */

import path from 'path';
import { normalizeUrl } from '@docusaurus/utils';
import { PluginOptions, DirectoryConfig } from '../../types';
import { DEFAULT_DOCS_ROOT, MD_EXTENSION } from '../../constants';

/**
 * Path management service that consolidates common path operations
 * @internal
 */
export class PathManager {
  public readonly directories: DirectoryConfig;

  constructor(siteDir: string, config: PluginOptions, outDir?: string) {
    this.directories = setupDirectories(siteDir, config, outDir);
  }

  /** Get normalized relative HTML path */
  getRelativeHtmlPath(fullHtmlPath: string): string {
    const relativePath = path.relative(this.directories.docsDir, fullHtmlPath);
    return normalizeCrossPlatformPath(relativePath);
  }

  /** Get normalized relative markdown path */
  getRelativeMarkdownPath(mdPath: string): string {
    const relativePath = path.relative(this.directories.mdOutDir, mdPath);
    return normalizeCrossPlatformPath(relativePath);
  }
}

/**
 * Setup directory paths based on plugin configuration
 * Centralizes the repeated directory setup pattern used across the plugin
 * @internal
 * 
 * @param siteDir - Site root directory
 * @param config - Plugin configuration
 * @param outDir - Optional build output directory (if not provided, calculated from siteDir)
 * @returns Directory configuration object
 */
export function setupDirectories(
  siteDir: string,
  config: PluginOptions,
  outDir?: string
): DirectoryConfig {
  // Use provided outDir from Docusaurus, no need to calculate from buildDir
  if (!outDir) {
    throw new Error(
      `outDir must be provided - this should come from Docusaurus postBuild context. ` +
      `Received: siteDir="${siteDir}", outDir="${outDir}"`
    );
  }
  
  const docsDir = path.join(outDir, config.docsRoot || DEFAULT_DOCS_ROOT);
  const mdOutDir = config.outputDir ? path.join(siteDir, config.outputDir) : docsDir;
  
  return {
    siteDir,
    outDir,
    docsDir,
    mdOutDir,
  };
}

/**
 * Build site URL from site configuration using Docusaurus normalizeUrl utility
 * Centralizes the repeated site URL building pattern
 * @internal
 * 
 * @param siteConfig - Docusaurus site configuration
 * @returns Complete site URL
 */
export function buildSiteUrl({ url, baseUrl }: { url: string; baseUrl: string }): string {
  // Use Docusaurus's normalizeUrl for proper URL construction
  return normalizeUrl([url, baseUrl]);
}

// === CROSS-PLATFORM PATH NORMALIZATION ===
// Consolidated from path-normalization.ts for better organization

/**
 * Normalize path separators for cross-platform compatibility
 * Replaces Windows backslashes with forward slashes
 * @internal
 * 
 * @param filePath - Path to normalize
 * @returns Path with forward slashes
 */
export function normalizeCrossPlatformPath(filePath: string): string {
  return filePath.replace(/\\/g, '/');
}

// === HTML TO MARKDOWN PATH CONVERSION ===
// Consolidated from fs/path.ts

/**
 * Convert a relative HTML path to its corresponding Markdown file path
 * Uses Docusaurus-style path conversion logic
 * @internal
 * 
 * Examples:
 *   index.html        → index.md
 *   blog/index.html   → blog.md
 *   api/reference.html → api/reference.md
 */
export function htmlPathToMdPath(relHtmlPath: string, mdOutDir: string): string {
  // Handle index.html files - convert to directory name
  const indexMatch = relHtmlPath.match(/^(.*)\/index\.html?$/i);
  if (indexMatch) {
    const dirPath = indexMatch[1] || '';
    // For root index.html, use 'index.md', for others use 'dirname.md'
    const mdFileName = dirPath === '' ? 'index' + MD_EXTENSION : dirPath + MD_EXTENSION;
    return path.join(mdOutDir, mdFileName);
  }
  
  // Handle root index.html case (just "index.html")
  if (relHtmlPath === 'index.html') {
    return path.join(mdOutDir, 'index' + MD_EXTENSION);
  }
  
  // Handle regular HTML files - replace extension
  const withoutExt = relHtmlPath.replace(/\.html?$/i, '');
  return path.join(mdOutDir, withoutExt + MD_EXTENSION);
} 