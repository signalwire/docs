import { Processor, unified } from 'unified';
import rehypeParse from 'rehype-parse';
import rehypeRemark from 'rehype-remark';
import { getPluginsByStage, applyPluginsToProcessor } from '../plugins/plugin-registry';
import { MarkdownConversionOptions } from '../../types';

/**
 * Builds a unified markdown processor with configurable pipeline.
 * 
 * The pipeline stages are:
 * 1. Parse HTML (rehypeParse)
 * 2. Apply rehype plugins while content is still HTML (rehypeProcessTables, etc.)
 * 3. Convert to markdown AST (rehypeRemark)
 * 4. Apply remark plugins to markdown (remarkGfm, remarkStringify, etc.)
 * 
 * @param opts - Markdown conversion options
 * @returns A configured unified processor
 */
export function buildMarkdownProcessor(opts: MarkdownConversionOptions): Processor {
  // Start with HTML parser
  const proc = unified();
  proc.use(rehypeParse, { fragment: false });

  // Stage 1: Apply rehype plugins (HTML processing)
  const rehypePlugins = getPluginsByStage('rehype');
  applyPluginsToProcessor(proc, rehypePlugins, opts);

  // Stage 2: Bridge from HTML to Markdown - convert <br> to HTML to preserve line breaks
  proc.use(rehypeRemark, {
    handlers: { br: () => ({ type: 'html', value: '<br />' }) },
  });

  // Stage 3: Apply remark plugins (Markdown processing)
  const remarkPlugins = getPluginsByStage('remark');
  applyPluginsToProcessor(proc, remarkPlugins, opts);

  return proc;
} 