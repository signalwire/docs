import { visit } from 'unist-util-visit';
import type { Root, Element } from 'hast';
import { formatDocUrl } from '../utils/url';
import { parseLocalURLPath } from '@docusaurus/utils';
import type { RehypeLinksOptions } from '../types/unified';

/**
 * Check if a URL is an internal relative link using Docusaurus utilities
 * Uses parseLocalURLPath which handles edge cases better than custom regex
 */
function isInternalLink(href: string): boolean {
  if (!href || href.startsWith('#')) {
    return false;
  }
  
  // Use Docusaurus parseLocalURLPath which returns null for external URLs
  const parsed = parseLocalURLPath(href);
  return parsed !== null;
}

/**
 * Transform a relative link based on configuration
 */
function transformInternalLink(
  href: string,
  options: RehypeLinksOptions
): string {
  const { enableMarkdownFiles = true, relativePaths = true, baseUrl = '' } = options;

  // Parse the URL to handle query params and hash fragments properly
  const parsed = parseLocalURLPath(href);
  if (!parsed) {
    return href; // Fallback if parsing fails
  }

  let { pathname } = parsed;
  
  // Convert to standardized path (remove leading ./ if present)
  if (pathname.startsWith('./')) {
    pathname = pathname.slice(2);
  }
  
  // If it starts with /, it's already an absolute path from site root
  if (!pathname.startsWith('/')) {
    pathname = `/${pathname}`;
  }
  
  // Remove any existing file extensions for consistent processing
  pathname = pathname.replace(/\.(html|md)$/, '');
  
  // Use our URL formatting utility for the pathname
  const transformedPathname = formatDocUrl(
    pathname, 
    { relativePaths, enableMarkdownFiles }, 
    baseUrl
  );
  
  // Reconstruct the URL with query params and hash if they exist
  const search = parsed.search ? `?${parsed.search}` : '';
  const hash = parsed.hash ? `#${parsed.hash}` : '';
  
  return `${transformedPathname}${search}${hash}`;
}

/**
 * Rehype plugin that transforms internal links based on plugin configuration.
 * 
 * This plugin automatically determines when to run:
 * - If relativePaths=true AND enableMarkdownFiles=false → plugin disabled (no transformation needed)
 * - If relativePaths=false → prepend baseUrl to internal links  
 * - If enableMarkdownFiles=true → append .md to internal links
 * - If relativePaths=false AND enableMarkdownFiles=true → do both
 */
export default function rehypeLinks(options: RehypeLinksOptions = {}) {
  return function transformer(tree: Root): Root {
    const { enableMarkdownFiles = true, relativePaths = true } = options;
    
    // If relative paths are enabled and markdown files are disabled,
    // skip processing as links don't need transformation
    if (relativePaths && !enableMarkdownFiles) {
      return tree;
    }
    
    visit(tree, 'element', (node: Element) => {
      // Only process anchor elements with href attributes
      if (node.tagName !== 'a' || !node.properties?.href) {
        return;
      }
      
      const href = String(node.properties.href);
      
      // Only transform internal links
      if (!isInternalLink(href)) {
        return;
      }
      
      // Transform the link
      const transformedHref = transformInternalLink(href, options);
      
      // Update the href attribute
      node.properties.href = transformedHref;
    });
    
    return tree;
  };
} 