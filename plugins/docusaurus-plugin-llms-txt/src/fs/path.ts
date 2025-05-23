import path from 'path';
import { posixPath, fileToPath, isValidPathname } from '@docusaurus/utils';
import { DOCUSAURUS_CACHE_DIR, CACHE_FOLDER_NAME, CACHE_FILE_NAME, MD_EXTENSION } from '../constants';
import type { Logger } from '../types/logging';
import { createLogger } from '../logging/logger';

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
 * Convert HTML path to virtual source file path for fileToPath() processing
 * This makes fileToPath() work correctly with our HTML files by giving them appropriate extensions
 * 
 * @param htmlPath - HTML file path like "blog/index.html" or "docs/api.html"
 * @param enableMarkdownFiles - Whether to simulate .md files or extensionless files
 * @returns Path that fileToPath() can process correctly
 */
function htmlToVirtualSourcePath(htmlPath: string, enableMarkdownFiles: boolean): string {
  const posixPath = toPosixPath(htmlPath);
  
  if (enableMarkdownFiles) {
    // Convert .html to .md so fileToPath() handles it as a markdown file
    return posixPath.replace(/\.html?$/i, '.md');
  } else {
    // Convert .html to .txt so fileToPath() strips the extension 
    // (we can't use no extension because fileToPath() expects some extension)
    return posixPath.replace(/\.html?$/i, '.txt');
  }
}

/**
 * Generate route path from HTML path using Docusaurus fileToPath() directly
 * This eliminates our custom logic and uses Docusaurus's proven path processing
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
  
  if (!relHtmlPath) return '/';
  
  // Convert HTML path to a virtual source path that fileToPath() can handle properly
  const virtualSourcePath = htmlToVirtualSourcePath(relHtmlPath, enableMarkdownFiles);
  
  // Let Docusaurus handle all the complex path logic (index files, extensions, etc.)
  let routePath = fileToPath(virtualSourcePath);
  
  // Special handling for root index.html file
  if (relHtmlPath === 'index.html') {
    routePath = enableMarkdownFiles ? '/index.md' : '/';
  } else {
    // fileToPath() for .md files adds trailing slash for directories, but we want clean paths
    // "blog/index.md" → "/blog/" → "/blog"
    if (routePath.endsWith('/') && routePath !== '/') {
      routePath = routePath.slice(0, -1);
    }
    
    // Add .md extension back if needed (fileToPath strips it for processing)
    if (enableMarkdownFiles && !routePath.endsWith('.md')) {
      routePath += MD_EXTENSION;
    }
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