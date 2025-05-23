import type { Processor } from 'unified';
import type { RehypeLinksOptions, BuiltInPluginEntry, MarkdownConversionOptions } from '../../types';
import rehypeTables from './rehype-tables';
import rehypeLinks from './rehype-links';
import remarkGfm, { Options as RemarkGfmOptions } from 'remark-gfm';
import remarkStringify, { Options as RemarkStringifyOptions } from 'remark-stringify';
import { DEFAULT_GFM } from '../../constants';

/**
 * Rehype plugins (HTML processing stage)
 */
const builtInRehypePlugins = [
  {
    key: 'rehypeProcessTables',
    plugin: rehypeTables,
    stage: 'rehype',
  },
  {
    key: 'rehypeProcessLinks',
    plugin: rehypeLinks,
    stage: 'rehype',
    always: true,
    optionsHandler: (options: unknown): RehypeLinksOptions => {
      // This will receive the constructed options from applyPluginsToProcessor
      if (typeof options === 'object' && options !== null) {
        return options as RehypeLinksOptions;
      }
      
      return {
        baseUrl: '',
        relativePaths: true,
        enableMarkdownFiles: true,
      };
    }
  }
] as const satisfies readonly BuiltInPluginEntry<unknown>[];

/**
 * Remark plugins (Markdown processing stage)  
 */
const builtInRemarkPlugins = [
  {
    key: 'remarkGfm',
    plugin: remarkGfm,
    stage: 'remark',
    defaultOptions: DEFAULT_GFM,
    optionsHandler: (options: unknown): RemarkGfmOptions | false => {
      if (options === false) return false;
      if (typeof options === 'object' && options !== null) {
        return { ...DEFAULT_GFM, ...options as Partial<RemarkGfmOptions> };
      }
      return DEFAULT_GFM;
    }
  },
  {
    key: 'remarkStringify',
    plugin: remarkStringify,
    stage: 'remark',
    always: true,
    optionsHandler: (options: unknown): RemarkStringifyOptions => {
      return typeof options === 'object' && options !== null 
        ? options as RemarkStringifyOptions 
        : {};
    }
  }
] as const satisfies readonly BuiltInPluginEntry<unknown>[];

/**
 * Combined registry for easy access
 */
export const allBuiltInPlugins: readonly BuiltInPluginEntry<unknown>[] = [
  ...builtInRehypePlugins,
  ...builtInRemarkPlugins
];

/**
 * Type-safe plugin application function that handles options correctly
 */
function applyBuiltInPlugin<T>(
  processor: Processor,
  entry: BuiltInPluginEntry<T>,
  options: unknown
): void {
  // Skip if explicitly disabled and not forced
  if (!entry.always && options === false) {
    return;
  }
  
  // Apply plugin with type-safe options handling
  if (entry.optionsHandler) {
    const processedOptions = entry.optionsHandler(options);
    if (processedOptions === false) return;
    processor.use(entry.plugin, processedOptions);
  } else {
    processor.use(entry.plugin);
  }
}

/**
 * Apply plugins to a processor using the type-safe registry
 */
export function applyPluginsToProcessor(
  processor: Processor,
  plugins: readonly BuiltInPluginEntry<unknown>[],
  options: MarkdownConversionOptions
): void {
  for (const entry of plugins) {
    // Special handling for rehype-links since it needs multiple config values
    if (entry.key === 'rehypeProcessLinks') {
      // Only apply rehype-links when generating individual markdown files
      // llms.txt generation uses formatDocUrl() directly on routePaths
      if (options.enableMarkdownFiles) {
        const linkOptions: RehypeLinksOptions = {
          baseUrl: options.baseUrl || '',
          relativePaths: options.relativePaths !== false,
          enableMarkdownFiles: options.enableMarkdownFiles === true,
          excludePaths: options.excludePaths || [],
        };
        applyBuiltInPlugin(processor, entry, linkOptions);
      }
      continue;
    }
    
    const pluginOptions = options[entry.key];
    applyBuiltInPlugin(processor, entry, pluginOptions);
  }
}

/**
 * Get plugins filtered by stage
 */
export function getPluginsByStage(stage: 'rehype' | 'remark'): readonly BuiltInPluginEntry<unknown>[] {
  return allBuiltInPlugins.filter(p => p.stage === stage);
} 