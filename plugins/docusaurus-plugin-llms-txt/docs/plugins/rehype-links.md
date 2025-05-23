# Rehype Links Plugin

## Overview

The Rehype Links Plugin (`src/pipeline/plugins/rehype-links.ts`) is a custom unified plugin that transforms internal links in HTML documents based on plugin configuration. It's a critical component that ensures links work correctly in the generated Markdown files while respecting exclusion patterns.

## Core Functionality

The plugin operates on the HTML AST (Abstract Syntax Tree) during the rehype processing stage, before conversion to Markdown. It identifies internal links and transforms them according to configuration settings.

### Key Responsibilities

1. **Link Identification**: Distinguishes between internal and external links
2. **Exclusion Handling**: Skips transformation for excluded paths
3. **Path Transformation**: Applies appropriate transformations based on configuration
4. **URL Preservation**: Maintains query parameters and hash fragments

## Configuration Options

```typescript
interface RehypeLinksOptions {
  enableMarkdownFiles?: boolean;    // Whether to add .md extensions
  relativePaths?: boolean;          // Whether to use relative paths
  baseUrl?: string;                 // Base URL for absolute paths
  excludePaths?: readonly string[]; // Glob patterns to exclude
}
```

### Option Interactions

The plugin's behavior depends on the combination of options:

| `relativePaths` | `enableMarkdownFiles` | Behavior |
|-----------------|----------------------|----------|
| `true` | `false` | **No transformation** - links remain as-is |
| `true` | `true` | Add `.md` extensions to internal links |
| `false` | `false` | Prepend `baseUrl` to internal links |
| `false` | `true` | Prepend `baseUrl` AND add `.md` extensions |

## Core Functions

### `isInternalLink(href: string): boolean`

Determines if a URL is an internal relative link using Docusaurus utilities.

```typescript
function isInternalLink(href: string): boolean {
  if (!href || href.startsWith('#')) {
    return false;
  }
  
  // Use Docusaurus parseLocalURLPath which returns null for external URLs
  const parsed = parseLocalURLPath(href);
  return parsed !== null;
}
```

**Logic:**
- Returns `false` for empty hrefs or hash-only links (`#section`)
- Uses `parseLocalURLPath()` from Docusaurus for robust URL parsing
- External URLs (http://, https://, mailto:, etc.) return `null` from parser

### `isExcludedLink(href: string, excludePaths?: readonly string[]): boolean`

Checks if a URL should be excluded from transformation based on exclude patterns.

```typescript
function isExcludedLink(href: string, excludePaths?: readonly string[]): boolean {
  if (!excludePaths?.length) {
    return false;
  }
  
  // Parse the URL to get the pathname
  const parsed = parseLocalURLPath(href);
  if (!parsed) {
    return false;
  }
  
  let { pathname } = parsed;
  
  // Normalize pathname to match exclude patterns (ensure it starts with /)
  if (!pathname.startsWith('/')) {
    pathname = `/${pathname}`;
  }
  
  // Create matcher and test the pathname
  const isExcluded = createMatcher([...excludePaths]);
  return isExcluded(pathname);
}
```

**Features:**
- Uses Docusaurus `createMatcher()` for glob pattern matching
- Normalizes paths to ensure consistent matching
- Supports complex glob patterns like `/rest/**`, `/api/*/internal`

### `transformInternalLink(href: string, options: RehypeLinksOptions): string`

Transforms a relative link based on configuration.

```typescript
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
```

**Transformation Steps:**
1. **Parse URL**: Extract pathname, search, and hash components
2. **Normalize Path**: Handle relative paths and remove existing extensions
3. **Apply Transformation**: Use `formatDocUrl()` for consistent formatting
4. **Reconstruct URL**: Combine transformed pathname with original query/hash

## Main Plugin Function

```typescript
export default function rehypeLinks(options: RehypeLinksOptions = {}) {
  return function transformer(tree: Root): Root {
    const { enableMarkdownFiles = true, relativePaths = true, excludePaths } = options;
    
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
      
      // Skip transformation if the link is excluded
      if (isExcludedLink(href, excludePaths)) {
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
```

## Transformation Examples

### Basic Link Transformation

**Input HTML:**
```html
<a href="/docs/api">API Documentation</a>
<a href="/docs/api/">API Documentation (with slash)</a>
<a href="./getting-started">Getting Started</a>
<a href="/guides/advanced#configuration">Advanced Guide</a>
```

**With `enableMarkdownFiles: true, relativePaths: true`:**
```html
<a href="/docs/api.md">API Documentation</a>
<a href="/docs/api.md">API Documentation (with slash)</a>
<a href="/getting-started.md">Getting Started</a>
<a href="/guides/advanced.md#configuration">Advanced Guide</a>
```

**With `enableMarkdownFiles: false, relativePaths: false, baseUrl: "https://example.com"`:**
```html
<a href="https://example.com/docs/api">API Documentation</a>
<a href="https://example.com/docs/api">API Documentation (with slash)</a>
<a href="https://example.com/getting-started">Getting Started</a>
<a href="https://example.com/guides/advanced#configuration">Advanced Guide</a>
```

### Exclusion Examples

**Configuration:**
```typescript
{
  excludePaths: ['/rest/**', '/api/internal/**'],
  relativePaths: false,
  baseUrl: 'https://example.com',
  enableMarkdownFiles: true
}
```

**Input HTML:**
```html
<a href="/docs/guide">User Guide</a>           <!-- Processed file -->
<a href="/rest/endpoints">REST API</a>         <!-- Excluded file -->
<a href="/api/internal/debug">Debug API</a>    <!-- Excluded file -->
<a href="/api/public">Public API</a>           <!-- Processed file -->
```

**Output HTML:**
```html
<a href="https://example.com/docs/guide.md">User Guide</a>        <!-- Full transformation -->
<a href="https://example.com/rest/endpoints">REST API</a>         <!-- Base URL only, no .md -->
<a href="https://example.com/api/internal/debug">Debug API</a>    <!-- Base URL only, no .md -->
<a href="https://example.com/api/public.md">Public API</a>        <!-- Full transformation -->
```

**Key behavior:**
- **Processed files**: Get base URL + `.md` extension
- **Excluded files**: Get base URL but NO `.md` extension (since no file is generated)

### Relative vs Absolute Path Handling

**With `relativePaths: true` (default):**
```typescript
{
  excludePaths: ['/internal/**'],
  relativePaths: true,
  enableMarkdownFiles: true
}
```

**Result:** Excluded links are left completely unchanged since relative paths don't need base URL transformation.

**With `relativePaths: false`:**
```typescript
{
  excludePaths: ['/internal/**'],
  relativePaths: false,
  baseUrl: 'https://example.com',
  enableMarkdownFiles: true
}
```

**Result:** Excluded links get base URL prepended but no `.md` extension since we're not generating files for them.

## Integration with Plugin Registry

The plugin is registered and configured through the plugin registry:

```typescript
// In plugin-registry.ts
{
  key: 'rehypeProcessLinks',
  plugin: rehypeLinks,
  stage: 'rehype',
  always: true,
  optionsHandler: (options: unknown): RehypeLinksOptions => {
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
```

**Special Handling in `applyPluginsToProcessor()`:**
```typescript
if (entry.key === 'rehypeProcessLinks') {
  // Only apply rehype-links when generating individual markdown files
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
```

## Performance Considerations

### AST Traversal
- Uses `unist-util-visit` for efficient tree traversal
- Only processes anchor elements with href attributes
- Early returns for non-matching elements

### Pattern Matching
- Creates matcher once per transformation
- Caches compiled glob patterns
- Efficient string operations for path normalization

### Memory Usage
- Processes AST in-place (no copying)
- Minimal string allocations
- Reuses parsed URL components

## Error Handling

The plugin implements defensive programming practices:

### Graceful Degradation
```typescript
const parsed = parseLocalURLPath(href);
if (!parsed) {
  return href; // Fallback if parsing fails
}
```

### Safe Property Access
```typescript
if (node.tagName !== 'a' || !node.properties?.href) {
  return;
}
```

### Robust URL Handling
- Handles malformed URLs gracefully
- Preserves original URLs when transformation fails
- Maintains URL components (query, hash) correctly

## Testing Scenarios

### Internal vs External Links
```typescript
// Internal links (transformed)
'/docs/api'
'./getting-started'
'../overview'
'/guides/advanced#config'

// External links (ignored)
'https://example.com'
'mailto:user@example.com'
'tel:+1234567890'
'#section-anchor'
```

### Exclusion Patterns
```typescript
// Pattern: '/rest/**'
'/rest/api'           // Excluded
'/rest/v1/users'      // Excluded
'/docs/rest'          // Not excluded

// Pattern: '/api/*/internal'
'/api/v1/internal'    // Excluded
'/api/v2/internal'    // Excluded
'/api/public'         // Not excluded
```

### Edge Cases
```typescript
// Empty or invalid hrefs
''                    // Ignored
'#'                   // Ignored
'javascript:void(0)'  // Ignored

// Complex URLs
'/api/users?page=1&sort=name#results'  // Query and hash preserved
'./docs/../guides'                     // Path normalization
```

## URL Normalization

The plugin normalizes URLs before transformation to ensure consistent results:

### Path Cleaning
- **Trailing slashes**: `/docs/api/` → `/docs/api` (except root `/`)
- **File extensions**: `/page.html` → `/page`
- **Relative paths**: `./guide` → `/guide`
- **Parent references**: `../overview` → `/overview`

### Component Preservation
- **Query parameters**: `?page=1&sort=name` preserved
- **Hash fragments**: `#section-anchor` preserved
- **Protocol schemes**: `mailto:`, `tel:`, `javascript:` ignored (external)

### Transformation Examples
| Input | Normalized | With .md | With baseUrl |
|-------|------------|----------|--------------|
| `/api/` | `/api` | `/api.md` | `https://example.com/api` |
| `/guide.html` | `/guide` | `/guide.md` | `https://example.com/guide` |
| `./start` | `/start` | `/start.md` | `https://example.com/start` |
| `/help#faq` | `/help` | `/help.md#faq` | `https://example.com/help#faq` |

## Best Practices

1. **Pattern Design**: Use specific exclusion patterns to avoid over-exclusion
2. **Testing**: Test with various URL formats and edge cases
3. **Performance**: Keep exclusion pattern lists reasonable in size
4. **Debugging**: Use debug logging to trace link transformations

## Related Components

- **[Plugin Registry](../pipeline/plugin-registry.md)**: Manages plugin registration and configuration
- **[URL Utilities](../utils/url-utilities.md)**: Provides URL formatting functions
- **[HTML Converter](../pipeline/html-converter.md)**: Coordinates plugin application
- **[Configuration](../config/plugin-options.md)**: Defines plugin options and validation 