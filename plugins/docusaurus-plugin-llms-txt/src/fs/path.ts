import path from 'path';
import { posixPath, isValidPathname } from '@docusaurus/utils';
import { DOCUSAURUS_CACHE_DIR, CACHE_FOLDER_NAME, CACHE_FILE_NAME, MD_EXTENSION } from '../constants';
import type { Logger } from '../types';
import { createLogger } from '../logging';

/**
 * Convert any OS-specific path string to a POSIX (slash-separated) one.
 * Useful for building route paths and writing predictable keys into llms.txt.
 */
export function toPosixPath(p: string): string {
  return posixPath(p);
}

/**
 * Convert a relative HTML path (from the build output) to its corresponding Markdown
 * file path inside the chosen markdown output directory.
 *
 * Examples:
 *   blog/index.html   → blog.md
 *   api/reference.html → api/reference.md
 */
export function htmlPathToMdPath(relHtmlPath: string, mdOutDir: string): string {
  if (/[/\\]index\.html$/.test(relHtmlPath)) {
    return path.join(mdOutDir, relHtmlPath.replace(/[/\\]index\.html$/, '') + MD_EXTENSION);
  }
  return path.join(mdOutDir, relHtmlPath.replace(/\.html$/, MD_EXTENSION));
}

/**
 * Generate route path from HTML path
 * 
 * @param relHtmlPath - Relative HTML path like "blog/index.html"
 * @param enableMarkdownFiles - Whether to include .md extension in final route
 * @param logger - Logger instance for warnings
 * @returns Generated route path
 */
export function generateRoutePath(
  relHtmlPath: string, 
  enableMarkdownFiles: boolean, 
  logger?: Logger
): string {
  const log = logger || createLogger('docusaurus-plugin-llms-txt');
  
  // Handle empty path
  if (!relHtmlPath) return '/';
  
  // Normalize path to POSIX style
  const posixHtmlPath = toPosixPath(relHtmlPath);
  
  // Begin with clean path processing
  let routePath = '';
  
  // Process index files specially to create clean URLs
  const isIndexFile = /index\.html$/i.test(posixHtmlPath);
  
  if (isIndexFile) {
    // For index.html files we want to create clean URLs:
    // - "index.html" becomes "/" (root)
    // - "blog/index.html" becomes "/blog"
    
    if (posixHtmlPath === 'index.html') {
      // Root index.html
      routePath = '/';
    } else {
      // Nested index.html - remove the index.html part
      routePath = '/' + posixHtmlPath.replace(/\/index\.html$/i, '');
    }
  } else {
    // For non-index files, just remove the .html extension
    routePath = '/' + posixHtmlPath.replace(/\.html$/i, '');
  }
  
  // If markdown files are enabled, add .md extension (except for the root path)
  if (enableMarkdownFiles && routePath !== '/') {
    routePath += MD_EXTENSION;
  }
  
  // Validate the generated pathname using Docusaurus utility
  const pathToValidate = enableMarkdownFiles ? routePath.replace(/\.md$/, '') : routePath;
  if (!isValidPathname(pathToValidate)) {
    log.warn(`Generated invalid pathname: ${pathToValidate} from ${relHtmlPath}`);
    // Return a safe fallback
    return enableMarkdownFiles ? '/index.md' : '/';
  }
  
  return routePath;
}

/**
 * Build cache directory path
 */
export function getCacheDir(siteDir: string): string {
  return path.join(siteDir, DOCUSAURUS_CACHE_DIR, CACHE_FOLDER_NAME);
}

/**
 * Build cache file path
 */
export function getCacheFilePath(siteDir: string): string {
  return path.join(getCacheDir(siteDir), CACHE_FILE_NAME);
} 