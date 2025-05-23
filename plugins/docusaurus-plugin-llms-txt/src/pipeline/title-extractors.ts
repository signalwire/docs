import { toString } from 'hast-util-to-string';
import { select } from 'hast-util-select';
import type * as HostHast from 'hast';
import type { TitleExtractor } from '../types/plugin';

/**
 * Extract title from header H1 element (most specific, cleanest in Docusaurus)
 */
export const extractHeaderH1: TitleExtractor = (tree: HostHast.Root): string | null => {
  const headerH1 = select('header h1', tree) as HostHast.Element | null;
  if (headerH1) {
    const title = toString(headerH1 as HostHast.Nodes).trim();
    return title || null;
  }
  return null;
};

/**
 * Extract title from any H1 element on the page
 */
export const extractPageH1: TitleExtractor = (tree: HostHast.Root): string | null => {
  const pageH1 = select('h1', tree) as HostHast.Element | null;
  if (pageH1) {
    const title = toString(pageH1 as HostHast.Nodes).trim();
    return title || null;
  }
  return null;
};

/**
 * Extract title from document title tag
 * Handles site title format like "Page Title | Site Name"
 */
export const extractDocumentTitle: TitleExtractor = (tree: HostHast.Root): string | null => {
  const titleEl = select('title', tree) as HostHast.Element | null;
  if (titleEl) {
    const fullTitle = toString(titleEl as HostHast.Nodes);
    if (fullTitle) {
      // Split on pipe and take the first part (page title)
      const parts = fullTitle.split('|');
      return parts.length > 1 ? parts[0].trim() : fullTitle.trim();
    }
  }
  return null;
};

/**
 * Extract title from main content area heading
 */
export const extractMainContentH1: TitleExtractor = (tree: HostHast.Root): string | null => {
  const mainH1 = select('main h1, .main-wrapper h1, article h1', tree) as HostHast.Element | null;
  if (mainH1) {
    const title = toString(mainH1 as HostHast.Nodes).trim();
    return title || null;
  }
  return null;
};

/**
 * Default title extractor strategy chain
 * Attempts extractors in order of preference until one succeeds
 */
export const defaultTitleExtractors: readonly TitleExtractor[] = [
  extractHeaderH1,
  extractMainContentH1,
  extractPageH1,
  extractDocumentTitle
] as const;

/**
 * Extract title using a strategy chain approach
 * 
 * @param tree - HTML AST to extract title from
 * @param extractors - Array of title extraction strategies to try in order
 * @returns Extracted title or fallback
 */
export function extractTitle(
  tree: HostHast.Root,
  extractors: readonly TitleExtractor[] = defaultTitleExtractors
): string {
  for (const extractor of extractors) {
    const title = extractor(tree);
    if (title) {
      return title;
    }
  }
  
  // Fallback if no extractors succeed
  return 'Untitled Document';
}

/**
 * Create a custom title extractor that uses CSS selectors
 * 
 * @param selectors - CSS selectors to try in order
 * @returns A title extractor function
 */
export function createSelectorExtractor(selectors: readonly string[]): TitleExtractor {
  return (tree: HostHast.Root): string | null => {
    for (const selector of selectors) {
      const element = select(selector, tree) as HostHast.Element | null;
      if (element) {
        const title = toString(element as HostHast.Nodes).trim();
        if (title) {
          return title;
        }
      }
    }
    return null;
  };
} 