import type { Plugin } from 'unified';
import type { Node } from 'unist';
import type { MarkdownConversionOptions } from './plugin';


/**
 * Type-safe wrapper for unified plugins with options
 * Makes it easier to correctly type plugins that accept optional configuration
 */
export type UnifiedPlugin<Options> = Plugin<[Options?] | [], Node>;


/**
 * Configuration options for the rehype-links plugin
 */
export interface RehypeLinksOptions {
  /** Whether markdown files are enabled */
  enableMarkdownFiles?: boolean;
  /** Whether to use relative paths */
  relativePaths?: boolean;
  /** Base URL of the site */
  baseUrl?: string;
  /** Glob patterns to exclude from link processing */
  excludePaths?: readonly string[];
}

/**
 * Base plugin interface for type-safe plugin handling
 */
export interface PluginEntry<TOptions = unknown> {
  readonly key: keyof MarkdownConversionOptions;
  readonly plugin: UnifiedPlugin<TOptions>;
  readonly stage: 'rehype' | 'remark';
  readonly always?: boolean;
}

/**
 * Built-in plugin entry with type-safe options handling
 */
export interface BuiltInPluginEntry<TOptions> extends PluginEntry<TOptions> {
  readonly defaultOptions?: TOptions;
  readonly optionsHandler?: (options: unknown) => TOptions | false;
} 