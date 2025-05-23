/**
 * Constants used throughout the plugin
 */

// Title and content formatting
export const TITLE_TRUNCATE_LENGTH = 30 as const;
export const DEFAULT_MARKDOWN_HEADER_LEVEL = 2 as const;

// Cache and file system
export const CACHE_FOLDER_NAME = '.llms-txt' as const;
export const CACHE_FILE_NAME = 'cache.json' as const;

// Docusaurus structure
export const DOCUSAURUS_CACHE_DIR = '.docusaurus' as const;

// File extensions
export const HTML_EXTENSION = '.html' as const;
export const MD_EXTENSION = '.md' as const;

// Default content selectors
export const DEFAULT_CONTENT_SELECTORS = [
  '.theme-doc-markdown',
  'article', 
  'main .container'
] as const;

// Output files
export const LLMS_TXT_FILENAME = 'llms.txt' as const; 