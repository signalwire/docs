/**
 * Utilities for URL handling and formatting
 */

import { normalizeUrl, encodePath, isValidPathname, parseURLOrPath } from '@docusaurus/utils';
import type { Logger } from '../types/logging';
import { createLogger } from '../logging/logger';

/**
 * Validate and format a URL path safely
 * 
 * @param path - The path to validate and format
 * @param logger - Logger instance for warnings
 * @returns Validated and normalized path, or fallback if invalid
 */
function validateAndFormatPath(path: string, logger?: Logger): string {
  const log = logger || createLogger('docusaurus-plugin-llms-txt');
  
  if (!path) return '/';
  
  try {
    const normalized = normalizeUrl([path]);
    
    // Validate the pathname component
    if (isValidPathname(normalized)) {
      return normalized;
    }
    
    log.warn(`Invalid pathname generated: ${normalized}, falling back to root`);
    return '/';
  } catch (error) {
    log.warn(`Error normalizing path ${path}: ${error instanceof Error ? error.message : String(error)}`);
    return '/';
  }
}

/**
 * Format a path according to configuration settings using Docusaurus utilities
 * 
 * @param path - The path to format
 * @param baseUrl - The base URL to prepend for absolute paths
 * @param useRelativePaths - Whether to use relative paths (true) or absolute paths (false)
 * @param logger - Logger instance for warnings
 * @returns Formatted URL
 */
export function formatUrl(
  path: string, 
  baseUrl = '', 
  useRelativePaths = true,
  logger?: Logger
): string {
  const log = logger || createLogger('docusaurus-plugin-llms-txt');
  
  if (!path) {
    return useRelativePaths || !baseUrl ? '/' : normalizeUrl([baseUrl]);
  }

  if (useRelativePaths || !baseUrl) {
    return validateAndFormatPath(path, log);
  } else {
    // Use Docusaurus normalizeUrl for robust URL joining
    try {
      const result = normalizeUrl([baseUrl, path]);
      
      // For absolute URLs, we should validate the base URL too
      if (baseUrl) {
        parseURLOrPath(result); // This will throw if invalid
      }
      
      return result;
    } catch (error) {
      log.warn(`Error formatting URL with baseUrl ${baseUrl} and path ${path}: ${error instanceof Error ? error.message : String(error)}`);
      return validateAndFormatPath(path, log);
    }
  }
}

/**
 * Format a document path for llms.txt output
 * 
 * @param path - Document path
 * @param config - Configuration options
 * @param baseUrl - Base URL for absolute paths
 * @param logger - Logger instance for warnings
 * @returns Formatted document URL
 */
export function formatDocUrl(
  path: string,
  config: { relativePaths?: boolean; enableMarkdownFiles?: boolean },
  baseUrl = '',
  logger?: Logger
): string {
  const log = logger || createLogger('docusaurus-plugin-llms-txt');
  
  if (!path) {
    return formatUrl('/', baseUrl, config.relativePaths !== false, log);
  }

  // Use the relativePaths option (default to true)
  const useRelativePaths = config.relativePaths !== false;
  
  // Ensure the path has the correct extension (or no extension) based on config
  let formattedPath = path;
  
  // Handle .md extension based on enableMarkdownFiles setting
  if (config.enableMarkdownFiles === true) {
    // Add .md extension if not already present
    if (!formattedPath.endsWith('.md')) {
      formattedPath = `${formattedPath}.md`;
    }
  } else if (config.enableMarkdownFiles === false) {
    // Remove .md extension if present
    if (formattedPath.endsWith('.md')) {
      formattedPath = formattedPath.slice(0, -3);
    }
  }
  
  // Use Docusaurus encodePath for proper URL encoding
  const encodedPath = encodePath(formattedPath);
  
  // Format the URL according to relativePaths setting
  return formatUrl(encodedPath, baseUrl, useRelativePaths, log);
} 