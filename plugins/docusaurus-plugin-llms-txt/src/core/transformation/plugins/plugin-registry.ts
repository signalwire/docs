/**
 * Plugin registry for unified processors
 * Handles both built-in and user plugins with proper typing
 */

import type { Processor, Plugin } from 'unified';
import type { Node, Root } from 'hast';
import rehypeParse, { Options as RehypeParseOptions } from 'rehype-parse';
import rehypeRemark from 'rehype-remark';
import remarkGfm from 'remark-gfm';
import remarkStringify from 'remark-stringify';
import rehypeLinks from './rehype-links';
import rehypeTables from './rehype-tables';
import type { MarkdownConversionOptions, RehypeLinksOptions } from '../../../types';

/**
 * Built-in plugin configurations
 */
interface BuiltinPluginConfig {
  readonly name: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  readonly plugin: Plugin<any, any, any>;
  readonly options?: unknown;
  readonly stage: 'parse' | 'rehype' | 'remark' | 'stringify';
}

const BUILTIN_PLUGINS: BuiltinPluginConfig[] = [
  {
    name: 'rehype-parse',
    plugin: rehypeParse,
    options: { fragment: false },
    stage: 'parse',
  },
  {
    name: 'rehype-tables',
    plugin: rehypeTables,
    stage: 'rehype',
  },
  {
    name: 'rehype-links',
    plugin: rehypeLinks,
    stage: 'rehype',
  },
  {
    name: 'rehype-remark',
    plugin: rehypeRemark,
    options: {
      handlers: { br: () => ({ type: 'html', value: '<br />' }) },
    },
    stage: 'rehype',
  },
  {
    name: 'remark-gfm',
    plugin: remarkGfm,
    stage: 'remark',
  },
  {
    name: 'remark-stringify',
    plugin: remarkStringify,
    stage: 'stringify',
  },
];

/**
 * Plugin registry class
 */
export class PluginRegistry {
  private plugins: Map<string, BuiltinPluginConfig> = new Map();

  constructor() {
    // Register built-in plugins
    BUILTIN_PLUGINS.forEach(plugin => {
      this.plugins.set(plugin.name, plugin);
    });
  }

  /**
   * Apply HTML parsing plugins to processor
   */
  applyHtmlParsingPlugins(
    processor: Processor,
    _options: MarkdownConversionOptions
  ): void {
    // Parse stage
    const parsePlugin = this.plugins.get('rehype-parse');
    if (parsePlugin && parsePlugin.options !== undefined) {
      // Type assertion is safe here as we know this plugin takes RehypeParseOptions
      const typedPlugin = parsePlugin.plugin as Plugin<
        [(RehypeParseOptions | null | undefined)?], 
        string, 
        Root
      >;
      processor.use(typedPlugin, parsePlugin.options as RehypeParseOptions);
    } else if (parsePlugin) {
      const typedPlugin = parsePlugin.plugin as Plugin<[RehypeParseOptions?], string, Root>;
      processor.use(typedPlugin);
    }
  }

  /**
   * Apply rehype (HTML processing) plugins to processor
   */
  applyRehypePlugins(
    processor: Processor,
    options: MarkdownConversionOptions
  ): void {
    // Tables processing
    if (options.rehypeProcessTables !== false) {
      const tablesPlugin = this.plugins.get('rehype-tables');
      if (tablesPlugin) {
        processor.use(tablesPlugin.plugin as Plugin<[], Root, Root>);
      }
    }

    // Links processing
    if (options.rehypeProcessLinks !== false) {
      const linksPlugin = this.plugins.get('rehype-links');
      if (linksPlugin) {
        const linkOptions: RehypeLinksOptions = {
          baseUrl: options.baseUrl || '',
          relativePaths: options.relativePaths !== false,
          enableMarkdownFiles: options.enableMarkdownFiles !== false,
          excludeRoutes: options.excludeRoutes || [],
        };
        processor.use(
          linksPlugin.plugin as Plugin<[RehypeLinksOptions], Root, Root>, 
          linkOptions
        );
      }
    }

    // Bridge to remark (always applied last in rehype stage)
    const remarkPlugin = this.plugins.get('rehype-remark');
    if (remarkPlugin && remarkPlugin.options !== undefined) {
      const typedPlugin = remarkPlugin.plugin as Plugin<
        [import('rehype-remark').Options?], 
        Root, 
        Node
      >;
      processor.use(typedPlugin, remarkPlugin.options as import('rehype-remark').Options);
    } else if (remarkPlugin) {
      const typedPlugin = remarkPlugin.plugin as Plugin<
        [import('rehype-remark').Options?], 
        Root, 
        Node
      >;
      processor.use(typedPlugin);
    }
  }

  /**
   * Apply remark (Markdown processing) plugins to processor
   */
  applyRemarkPlugins(
    processor: Processor,
    options: MarkdownConversionOptions
  ): void {
    // GitHub Flavored Markdown
    if (options.remarkGfm !== false) {
      const gfmPlugin = this.plugins.get('remark-gfm');
      if (gfmPlugin) {
        const gfmOptions = typeof options.remarkGfm === 'object' && options.remarkGfm !== null
          ? options.remarkGfm
          : undefined;
        if (gfmOptions !== undefined) {
          processor.use(gfmPlugin.plugin, gfmOptions);
        } else {
          processor.use(gfmPlugin.plugin);
        }
      }
    }
  }

  /**
   * Apply stringify plugins to processor
   */
  applyStringifyPlugins(
    processor: Processor,
    options: MarkdownConversionOptions
  ): void {
    const stringifyPlugin = this.plugins.get('remark-stringify');
    if (stringifyPlugin) {
      const stringifyOptions = options.remarkStringify || {};
      const typedPlugin = stringifyPlugin.plugin as Plugin<
        [import('remark-stringify').Options?], 
        Node, 
        string
      >;
      processor.use(typedPlugin, stringifyOptions);
    }
  }

  /**
   * Create a complete processor pipeline for HTML to Markdown conversion
   */
  createHtmlToMarkdownProcessor(options: MarkdownConversionOptions): {
    htmlProcessor: Processor;
    markdownProcessor: Processor;
  } {
    // HTML processing pipeline (hast)
    const htmlProcessor = new (require('unified').unified)();
    this.applyRehypePlugins(htmlProcessor, options);
    
    // Markdown processing pipeline (mdast)
    const markdownProcessor = new (require('unified').unified)();
    this.applyRemarkPlugins(markdownProcessor, options);
    this.applyStringifyPlugins(markdownProcessor, options);
    
    return { htmlProcessor, markdownProcessor };
  }

  /**
   * Create a lightweight processor for metadata extraction only
   */
  createMetadataProcessor(): Processor {
    const processor = new (require('unified').unified)();
    
    const parsePlugin = this.plugins.get('rehype-parse');
    if (parsePlugin && parsePlugin.options !== undefined) {
      const typedPlugin = parsePlugin.plugin as Plugin<
        [(RehypeParseOptions | null | undefined)?], 
        string, 
        Root
      >;
      processor.use(typedPlugin, parsePlugin.options as RehypeParseOptions);
    } else if (parsePlugin) {
      const typedPlugin = parsePlugin.plugin as Plugin<
        [(RehypeParseOptions | null | undefined)?], 
        string, 
        Root
      >;
      processor.use(typedPlugin);
    }
    
    return processor;
  }
}

/**
 * Default plugin registry instance
 */
export const defaultPluginRegistry = new PluginRegistry(); 