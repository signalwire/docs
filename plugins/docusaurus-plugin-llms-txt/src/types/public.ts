/**
 * Public type definitions for docusaurus-plugin-llms-txt
 * Only exports types that plugin users need to configure and use the plugin
 */

import { Joi } from '@docusaurus/utils-validation';
import type { Options as RemarkGfmOptions } from 'remark-gfm';
import type { Options as RemarkStringifyOptions } from 'remark-stringify';
import { 
  DEFAULT_CONTENT_SELECTORS, 
  DEFAULT_DOCS_ROOT, 
  DEFAULT_OUTPUT_DIR, 
  DEFAULT_DEPTH, 
  LogLevelType 
} from '../constants';

// ============================================================================
// USER CONFIGURATION TYPES
// ============================================================================

/**
 * Depth levels for document categorization
 */
export type Depth = 1 | 2 | 3 | 4 | 5;

/**
 * Configuration for processing specific route paths
 */
export interface RouteRule {
  /** Route pattern to match (glob pattern, no file extension) */
  readonly route: string;
  /** Override depth for this path */
  readonly depth?: Depth;
  /** Override content selectors for this path */
  readonly contentSelectors?: readonly string[];
  /** Category name override for this path */
  readonly categoryName?: string;
  /** Path-specific ordering of subcategories (glob patterns) */
  readonly includeOrder?: readonly string[];
}

/**
 * Optional link for inclusion in llms.txt
 */
export interface OptionalLink {
  /** Link title */
  readonly title: string;
  /** Link URL */
  readonly url: string;
  /** Optional description */
  readonly description?: string;
}

/**
 * Content processing options that affect individual markdown file generation
 */
export interface ContentOptions {
  /** Whether to generate individual markdown files (default: true) */
  readonly enableMarkdownFiles?: boolean;
  /** Whether to use relative paths in links (default: true) */
  readonly relativePaths?: boolean;
  
  // Content filtering
  /** Include blog posts (default: false) */
  readonly includeBlog?: boolean;
  /** Include pages (default: false) */
  readonly includePages?: boolean;
  /** Include docs (default: true) */
  readonly includeDocs?: boolean;
  /** Glob patterns to exclude from processing */
  readonly excludeRoutes?: readonly string[];
  
  // Content extraction
  /** CSS selectors for content extraction */
  readonly contentSelectors?: readonly string[];
  /** Route-specific processing rules */
  readonly routeRules?: readonly RouteRule[];
  
  // Format options
  /** Remark stringify options for markdown generation */
  readonly remarkStringify?: Readonly<RemarkStringifyOptions>;
  /** Remark GFM options for markdown processing */
  readonly remarkGfm?: boolean | Readonly<RemarkGfmOptions>;
  /** Whether to process tables with rehype (default: true) */
  readonly rehypeProcessTables?: boolean;
}

/**
 * Main plugin configuration options
 */
export interface PluginOptions {
  /** Content processing options (affects individual file generation) */
  readonly content?: ContentOptions;
  
  // Structure options (affect llms.txt generation only)
  /** Categorization depth for document tree (default: 1) */
  readonly depth?: Depth;
  /** Whether to include descriptions in llms.txt links (default: true) */
  readonly enableDescriptions?: boolean;
  /** Site title for llms.txt header */
  readonly siteTitle?: string;
  /** Site description for llms.txt header */
  readonly siteDescription?: string;
  /** Additional links to include in llms.txt */
  readonly optionalLinks?: readonly OptionalLink[];
  /** Global ordering of categories (glob patterns) */
  readonly includeOrder?: readonly string[];
  
  // Environment options (execution settings)
  /** Whether to enable caching (default: true) */
  readonly enableCache?: boolean;
  /** Root directory for docs relative to build output */
  readonly docsRoot?: string;
  /** Output directory for generated markdown files */
  readonly outputDir?: string;
  /** Logging verbosity level (default: 2/INFO) */
  readonly logLevel?: LogLevelType;
  /** Whether to run during postBuild phase (default: true) */
  readonly runOnPostBuild?: boolean;
}

// ============================================================================
// USER ERROR HANDLING
// ============================================================================

/**
 * Re-export error types from the main errors module to avoid duplication
 */
export type { 
  PluginError, 
  PluginConfigError, 
  PluginValidationError 
} from '../errors';

export { isPluginError } from '../errors';

// ============================================================================
// LOGGING INTERFACE
// ============================================================================

/**
 * Logger interface for plugin operations
 * Users might need this if they're extending the plugin
 */
export interface Logger {
  /** Log an error message */
  error: (_msg: string) => void;
  /** Log a warning message */
  warn: (_msg: string) => void;
  /** Log an info message */
  info: (_msg: string) => void;
  /** Log a debug message */
  debug: (_msg: string) => void;
}

// ============================================================================
// VALIDATION SCHEMA
// ============================================================================

/**
 * Joi schema for runtime validation
 */
export const pluginOptionsSchema = Joi.object({
  // Content processing options
  content: Joi.object({
    enableMarkdownFiles: Joi.boolean().default(true),
    relativePaths: Joi.boolean().default(true),
    
    // Content filtering
    includeBlog: Joi.boolean().default(false),
    includePages: Joi.boolean().default(false),
    includeDocs: Joi.boolean().default(true),
    excludeRoutes: Joi.array().items(Joi.string()).default([]),
    
    // Content extraction
    contentSelectors: Joi.array().items(Joi.string()).default([...DEFAULT_CONTENT_SELECTORS]),
    routeRules: Joi.array().items(
      Joi.object({
        route: Joi.string().required(),
        depth: Joi.number().integer().min(1).max(5),
        contentSelectors: Joi.array().items(Joi.string()),
        categoryName: Joi.string(),
        includeOrder: Joi.array().items(Joi.string()),
      }).unknown(false)
    ).default([]),
    
    // Format options
    remarkStringify: Joi.object().unknown(true).default({
      bullet: '-',
      emphasis: '_',
      strong: '*',
      fence: '`',
      fences: true,
      incrementListMarker: true,
      listItemIndent: 'one',
      tightDefinitions: true,
      setext: false,
    }),
    remarkGfm: Joi.alternatives().try(Joi.boolean(), Joi.object().unknown(true)).default(true),
    rehypeProcessTables: Joi.boolean().default(true),
  }).default({}),

  // Structure options (llms.txt generation)
  depth: Joi.number().integer().min(1).max(5).default(DEFAULT_DEPTH),
  enableDescriptions: Joi.boolean().default(true),
  siteTitle: Joi.string().allow('').default(''),
  siteDescription: Joi.string().allow('').default(''),
  optionalLinks: Joi.array().items(
    Joi.object({
      title: Joi.string().required(),
      url: Joi.string().required(),
      description: Joi.string().optional(),
    })
  ).default([]),
  includeOrder: Joi.array().items(Joi.string()).default([]),

  // Environment options
  enableCache: Joi.boolean().default(true),
  docsRoot: Joi.string().allow('').default(DEFAULT_DOCS_ROOT),
  outputDir: Joi.string().allow('').default(DEFAULT_OUTPUT_DIR),
  logLevel: Joi.number().integer().min(0).max(3).default(2),
  runOnPostBuild: Joi.boolean().default(true),
}); 