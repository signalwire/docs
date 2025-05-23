import type { Options as RemarkGfmOptions } from 'remark-gfm';
import type { Options as RemarkStringifyOptions } from 'remark-stringify';
import { Joi } from '@docusaurus/utils-validation';
import { DEFAULT_CONTENT_SELECTORS } from '../constants';
import type * as HostHast from 'hast';

/**
 * Depth levels for document categorization
 */
export enum Depth {
  ONE = 1,
  TWO = 2,
  THREE = 3,
  FOUR = 4,
  FIVE = 5
}

/**
 * Log level to control verbosity
 */
export enum LogLevel {
  /** Only errors are logged */
  ERROR = 0,
  /** Errors and warnings are logged */
  WARN = 1,
  /** Regular information logs (default) */
  INFO = 2,
  /** Detailed logs for debugging */
  DEBUG = 3
}

/**
 * Configuration for processing specific route paths
 */
export interface PathRule {
  /** Glob pattern to match route paths */
  readonly path: string;
  /** Override depth for this path */
  readonly depth?: Depth;
  /** Exclude these sub-paths from this rule */
  readonly excludePaths?: readonly string[];
  /** Override content selectors for this path */
  readonly contentSelectors?: readonly string[];
  /** Category override for this path */
  readonly category?: string;
  /** If true, skip processing this path entirely */
  readonly skipProcessing?: boolean;
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
 * Main plugin configuration options
 * This should always be aligned with the JOI schema below
 */
export interface PluginOptions {
  // Core functionality options

  readonly enableLlmsTxt?: boolean;
  /** Whether to generate individual Markdown files */
  readonly enableMarkdownFiles?: boolean;
  /** Custom title for the llms.txt file, overrides site title from Docusaurus config */
  readonly siteTitle?: string;
  /** Whether to enable caching for better performance */
  readonly enableCache?: boolean;
  /** Whether to use relative paths (true) or absolute paths with baseUrl (false) */
  readonly relativePaths?: boolean;
  /** Whether to include descriptions in llms.txt file (true by default) */
  readonly enableDescriptions?: boolean;
  
  // Content extraction options
  /** CSS selectors to extract content from HTML files */
  readonly contentSelectors?: readonly string[];
  /** Root directory for docs relative to build output */
  readonly docsRoot?: string;
  /** Directory (relative to site root) where Markdown files will be written. Defaults to same as docsRoot build directory. */
  readonly outputDir?: string;
  /** Build directory name relative to site root (default: 'build') */
  readonly buildDir?: string;
  
  // Structure options
  /** Default category depth to use for the document tree */
  readonly depth?: Depth;
  /** Glob patterns to exclude from processing */
  readonly excludePaths?: readonly string[];
  /** Path-specific rules */
  readonly pathRules?: readonly PathRule[];
  
  // Format options
  /** Options for remark-stringify when using remark converter */
  readonly remarkStringify?: Readonly<RemarkStringifyOptions>;
  /**
   * Configuration for remark-gfm (GitHub Flavoured Markdown).
   * - `false`  → disable the plugin entirely
   * - `true`   → enable with built-in defaults
   * - `object` → enable and merge with defaults
   */
  readonly remarkGfm?: boolean | Readonly<RemarkGfmOptions>;

  /** Enable or disable the custom table-list fixer */
  readonly rehypeProcessTables?: boolean;
  
  // Additional features
  /** Site description to include in llms.txt */
  readonly siteDescription?: string;
  /** Additional links to include in llms.txt */
  readonly optionalLinks?: readonly OptionalLink[];
  
  // Logging
  /** Log level to control verbosity */
  readonly logLevel?: LogLevel;

  /** If false, plugin does nothing during Docusaurus postBuild; conversion can be run via CLI. Default true */
  readonly runOnPostBuild?: boolean;
}

/**
 * Configuration with path rule applied
 */
export type EffectiveConfig = PluginOptions & PathRule;

/**
 * Information about a document
 */
export interface DocInfo {
  /** Route path for the document */
  readonly routePath: string;
  /** HTML file path */
  readonly htmlPath: string;
  /** Document title */
  readonly title: string;
  /** Document description */
  readonly description: string;
}

/**
 * Represents a node in the document tree
 */
export interface TreeNode {
  /** Category name */
  readonly name: string;
  /** Relative path */
  readonly relPath: string;
  /** Category title (optional) */
  readonly title?: string;
  /** Category description (optional) */
  readonly description?: string;
  /** Index document for this category */
  indexDoc?: DocInfo;
  /** Documents in this category */
  docs: DocInfo[];
  /** Sub-categories */
  subCategories: TreeNode[];
}

/**
 * HTML to Markdown conversion options
 */
export interface MarkdownConversionOptions {
  /** Options for remark-stringify */
  readonly remarkStringify?: Readonly<RemarkStringifyOptions>;
  /**
   * Configuration for remark-gfm (GitHub Flavoured Markdown).
   * - `false`  → disable the plugin entirely
   * - `true`   → enable with built-in defaults
   * - `object` → enable and merge with defaults
   */
  readonly remarkGfm?: boolean | Readonly<RemarkGfmOptions>;

  /** Enable or disable the custom table-list fixer */
  readonly rehypeProcessTables?: boolean;
  
  /** Enable or disable internal link transformation (automatically determined) */
  readonly rehypeProcessLinks?: boolean;
  
  /** Base URL for link transformation */
  readonly baseUrl?: string;
  
  /** Whether to use relative paths */
  readonly relativePaths?: boolean;
  
  /** Whether markdown files are enabled */
  readonly enableMarkdownFiles?: boolean;
}

/**
 * HTML to Markdown conversion result
 */
export interface ConversionResult {
  /** Markdown content */
  readonly content: string;
  /** Document title */
  readonly title: string;
  /** Document description */
  readonly description: string;
}

/**
 * Joi schema matching the PluginOptions interface.
 * Keep this as the single source of truth for runtime validation.
 */
export const pluginOptionsSchema = Joi.object({
  // Core toggles
  enableLlmsTxt: Joi.boolean().default(true),
  enableMarkdownFiles: Joi.boolean().default(true),
  runOnPostBuild: Joi.boolean().default(true),
  siteTitle: Joi.string().allow('').default(''),
  enableCache: Joi.boolean().default(true),
  relativePaths: Joi.boolean().default(true),
  enableDescriptions: Joi.boolean().default(true),

  // Extraction / path options
  docsRoot: Joi.string().allow('').default(''),
  contentSelectors: Joi.array().items(Joi.string()).default([...DEFAULT_CONTENT_SELECTORS]),
  depth: Joi.number().integer().min(1).max(5).default(1),
  excludePaths: Joi.array().items(Joi.string()).default([]),
  outputDir: Joi.string().allow('').default(''),
  buildDir: Joi.string().allow('').default('build'),

  // Path-specific rules
  pathRules: Joi.array().items(
    Joi.object({
      path: Joi.string().required(),
      depth: Joi.number().integer().min(1).max(5),
      excludePaths: Joi.array().items(Joi.string()),
      contentSelectors: Joi.array().items(Joi.string()),
      category: Joi.string(),
      skipProcessing: Joi.boolean(),
    }).unknown(false)
  ).default([]),

  // Markdown / remark settings
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

  // Misc
  siteDescription: Joi.string().allow('').default(''),
  optionalLinks: Joi.array().items(
    Joi.object({
      title: Joi.string().required(),
      url: Joi.string().required(),
      description: Joi.string().optional(),
    })
  ).default([]),
  logLevel: Joi.number().integer().min(0).max(3).default(2),
});

/**
 * Type for title extraction strategy functions
 */
export type TitleExtractor = (tree: HostHast.Root) => string | null;

/**
 * Runtime config used by processors – identical to PluginOptions but adds mutable properties
 */
export interface RuntimeConfig extends Omit<PluginOptions, 'remarkGfm'> {
  remarkGfm?: boolean | Record<string, unknown>;
  rehypeProcessTables?: boolean;
} 