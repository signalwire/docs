# docusaurus-plugin-llms-txt

A powerful Docusaurus plugin that generates Markdown versions of your HTML pages and creates an `llms.txt` index file for AI/LLM consumption. Perfect for making your documentation easily accessible to Large Language Models while maintaining human-readable markdown files.

## Features

- 🔄 **HTML to Markdown Conversion**: Automatically converts your Docusaurus HTML pages to clean markdown files
- 📝 **llms.txt Generation**: Creates a comprehensive index file with links to all your documentation
- 🗂️ **Hierarchical Organization**: Intelligently organizes documents into categories with configurable depth
- ⚡ **Smart Caching**: Efficient caching system for fast incremental builds
- 🎯 **Content Filtering**: Flexible filtering by content type (docs, blog, pages) and custom patterns
- 🔧 **Route Rules**: Advanced configuration for specific routes with custom processing
- 💻 **CLI Commands**: Standalone CLI for generation and cleanup operations
- 🎨 **Customizable Content Extraction**: Configurable CSS selectors for precise content extraction
- 📊 **Table Processing**: Intelligent table handling with rehype processing
- 🔗 **Link Management**: Smart internal link processing with relative/absolute path options

## Installation

```bash
npm install docusaurus-plugin-llms-txt
```

### Peer Dependencies

This plugin requires several peer dependencies. Install them if not already present:

```bash
npm install @docusaurus/core @docusaurus/logger @docusaurus/utils @docusaurus/utils-validation unified rehype-parse rehype-remark remark-gfm remark-stringify unist-util-visit fs-extra string-width
```

## Quick Start

### Basic Setup

Add the plugin to your `docusaurus.config.js`:

```javascript
module.exports = {
  plugins: [
    'docusaurus-plugin-llms-txt'
  ]
};
```

### Basic Configuration

```javascript
module.exports = {
  plugins: [
    [
      'docusaurus-plugin-llms-txt',
      {
        siteTitle: 'My Documentation',
        siteDescription: 'Comprehensive guide to our platform',
        depth: 2,
        content: {
          includeBlog: true,
          includePages: true
        }
      }
    ]
  ]
};
```

After building your site (`npm run build`), you'll find:
- `llms.txt` in your build output directory
- Individual markdown files for each page (if enabled)

## Configuration Options

### Main Plugin Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `siteTitle` | `string` | Site config title | Title for the llms.txt header. Can be empty string. |
| `siteDescription` | `string` | `undefined` | Description for the llms.txt header. Can be empty string. |
| `depth` | `1\|2\|3\|4\|5` | `1` | Categorization depth for document hierarchy. [Details →](#depth-configuration) |
| `enableDescriptions` | `boolean` | `true` | Include descriptions in llms.txt links |
| `optionalLinks` | `OptionalLink[]` | `[]` | Additional external links. [Details →](#optional-links) |
| `includeOrder` | `string[]` | `[]` | Global category ordering (glob patterns). [Details →](#include-order) |
| `runOnPostBuild` | `boolean` | `true` | Whether to run during postBuild phase |
| `onRouteError` | `'ignore'\|'log'\|'warn'\|'throw'` | `'warn'` | Route processing failure handling. [Details →](#error-handling) |
| `logLevel` | `0\|1\|2\|3` | `1` | Logging verbosity. **Range**: 0-3. [Details →](#logging-levels) |

### Content Options (`content`)

**Note**: All content options are optional. If you don't specify a `content` object, all options use their defaults.

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `enableMarkdownFiles` | `boolean` | `true` | Generate individual markdown files |
| `relativePaths` | `boolean` | `true` | Use relative paths in links. [Details →](#path-configuration) |
| `includeBlog` | `boolean` | `false` | Include blog posts |
| `includePages` | `boolean` | `false` | Include pages |
| `includeDocs` | `boolean` | `true` | Include documentation |
| `excludeRoutes` | `string[]` | `[]` | Glob patterns to exclude. [Details →](#route-exclusion) |
| `contentSelectors` | `string[]` | Default selectors | CSS selectors for content extraction. [Details →](#content-selectors) |
| `routeRules` | `RouteRule[]` | `[]` | Route-specific processing rules. [Details →](#route-rules) |
| `remarkStringify` | `object` | `{}` | Markdown formatting options. [Details →](#markdown-processing) |
| `remarkGfm` | `boolean\|object` | `true` | GitHub Flavored Markdown options. [Details →](#markdown-processing) |
| `rehypeProcessTables` | `boolean` | `true` | Process HTML tables for markdown conversion |

## Detailed Configuration

### Depth Configuration

The `depth` option controls how deep the hierarchical organization goes in your document tree. This is crucial for determining how your URLs are categorized.

**How it works:**
- **`depth: 1`**: `/api/users` → `api` category
- **`depth: 2`**: `/api/users/create` → `api/users` category  
- **`depth: 3`**: `/api/users/create/advanced` → `api/users/create` category

```javascript
// Shallow categorization - good for simple sites
{ depth: 1 }  // /docs/guide/advanced → "docs" category

// Deep categorization - good for complex sites
{ depth: 3 }  // /docs/guide/advanced → "docs/guide/advanced" category
```

**Use cases:**
- `depth: 1` - Simple sites with few top-level sections
- `depth: 2` - Most documentation sites with clear section/subsection structure  
- `depth: 3+` - Complex sites with deep hierarchies or very specific organization needs

### Optional Links

Add external or additional links to your llms.txt in a separate "Optional" section.

**Structure:**
```typescript
{
  title: string;        // REQUIRED: Display text for the link
  url: string;          // REQUIRED: Full URL (can be external or internal)
  description?: string; // Optional description (respects enableDescriptions)
}
```

**Required fields:**
- `title` - Display text for the link
- `url` - The URL to link to

**Example:**
```javascript
{
  optionalLinks: [
    {
      title: 'Live API Status',          // REQUIRED
      url: 'https://status.myapi.com',   // REQUIRED
      description: 'Real-time system status and uptime monitoring'
    },
    {
      title: 'Community Discord',        // REQUIRED
      url: 'https://discord.gg/myapi'   // REQUIRED
      // description is optional
    },
    {
      title: 'Legacy v1 Docs',          // REQUIRED
      url: '/legacy/v1/',               // REQUIRED
      description: 'Documentation for API version 1.x (deprecated)'
    }
  ]
}
```

**Output:**
```markdown
## Optional
- [Live API Status](https://status.myapi.com): Real-time system status and uptime monitoring
- [Community Discord](https://discord.gg/myapi)
- [Legacy v1 Docs](/legacy/v1/): Documentation for API version 1.x (deprecated)
```

### Include Order

Controls the order in which categories appear in your llms.txt using glob patterns. Categories matching earlier patterns appear first.

```javascript
{
  includeOrder: [
    '/getting-started/**',  // Getting started content first
    '/api/auth/**',         // Authentication second
    '/api/reference/**',    // API reference third
    '/guides/**',           // Guides fourth
    '/examples/**'          // Examples last
  ]
}
```

**Pattern matching rules:**
- Use `/**` for matching entire directory trees
- Use `*` for single-level wildcards
- Patterns are matched against the full route path
- More specific patterns should come before general ones

### Error Handling

The `onRouteError` option controls what happens when individual pages fail to process. **Valid values**: `'ignore'`, `'log'`, `'warn'`, `'throw'`.

- **`'ignore'`**: Skip failed routes silently
- **`'log'`**: Log failures but continue (no console output in normal mode)
- **`'warn'`**: Show warnings for failures but continue (recommended)
- **`'throw'`**: Stop entire build on first failure

```javascript
// For production builds - continue despite individual failures
{ onRouteError: 'warn' }

// For development - fail fast to catch issues
{ onRouteError: 'throw' }

// For large sites with some problematic pages
{ onRouteError: 'ignore' }
```

### Logging Levels

The `logLevel` option controls verbosity of console output. **Range**: 0-3 (integer).

- **`0` (Quiet)**: Only errors and final success/failure
- **`1` (Normal)**: Errors, warnings, and completion messages *(default)*
- **`2` (Verbose)**: Above + processing info and statistics
- **`3` (Debug)**: Above + detailed debug information

```javascript
// Production builds - minimal output
{ logLevel: 0 }

// Development - maximum detail
{ logLevel: 3 }

// CI/CD - standard output
{ logLevel: 1 }
```

### Path Configuration

The `relativePaths` option controls link format in both `llms.txt` and markdown files:

- **`true`**: `./getting-started/index.md`, `../api/reference.md`
- **`false`**: `https://mysite.com/getting-started/`, `https://mysite.com/api/reference/`

**When to use relative paths:**
- Documentation distributed as files
- Offline usage requirements
- Maximum portability

**When to use absolute paths:**
- Web-only consumption
- Integration with web-based tools
- Cleaner link appearance
- When you want full URLs with your site domain

### Route Exclusion

Use glob patterns to exclude specific routes or route patterns:

```javascript
{
  content: {
    excludeRoutes: [
      '/admin/**',           // Exclude all admin pages
      '/api/internal/**',    // Exclude internal API docs
      '**/_category_/**',    // Exclude Docusaurus category pages
      '/legacy/**',          // Exclude legacy documentation
      '**/*.xml',           // Exclude XML files
      '**/*.json',          // Exclude JSON files
      '/search',            // Exclude specific page
      '/404'                // Exclude error pages
    ]
  }
}
```

**Common exclusion patterns:**
- `**/_category_/**` - Docusaurus auto-generated category pages
- `/tags/**` - Blog tag pages
- `/archive/**` - Archived content
- `**/*.xml` - Sitemap and RSS files
- `**/internal/**` - Internal documentation

### Content Selectors

CSS selectors used to extract main content from HTML pages. The plugin tries each selector in order until it finds content.

**Default selectors (used when `contentSelectors` is not specified):**
```javascript
[
  '.theme-doc-markdown',     // Docusaurus main content area
  'main .container .col',    // Bootstrap-style layout
  'main .theme-doc-wrapper', // Docusaurus wrapper
  'article',                 // Semantic article element
  'main .container',         // Broader container
  'main'                     // Fallback to main element
]
```

**How it works:**
- The plugin tries each selector in the array order
- First selector that finds content is used
- If no selectors find content, the page is skipped with a warning
- Empty array `[]` will use the default selectors above

**Custom selectors for different themes:**
```javascript
{
  content: {
    contentSelectors: [
      '.custom-content-area',    // Your custom theme
      '.docs-wrapper .content',  // Custom documentation wrapper
      '#main-content',           // ID-based selector
      '.prose',                  // Tailwind typography
      'main'                     // Fallback
    ]
  }
}
```

**Important notes:**
- More specific selectors should come first
- Always include a fallback selector (like `'main'` or `'article'`)
- Selectors are standard CSS selectors (class, ID, element, attribute, etc.)
- Use browser dev tools to inspect your page structure if content isn't being extracted

**Debugging content extraction:**
1. Set `logLevel: 3` to see which selector is being used for each page
2. Use browser dev tools to inspect your page's HTML structure
3. Test selectors in browser console with `document.querySelector('your-selector')`
4. Add more specific selectors before general ones

### Markdown Processing

#### `remarkStringify` Options

Controls how the HTML→Markdown conversion formats the output. These options are passed directly to the **[remark-stringify](https://github.com/remarkjs/remark/tree/main/packages/remark-stringify)** library.

```javascript
{
  content: {
    remarkStringify: {
      bullet: '-',              // Use - for bullet points (vs *)
      emphasis: '_',            // Use _ for italic (vs *)
      strong: '**',             // Use ** for bold
      fence: '`',               // Use ` for code fences (vs ~)
      fences: true,             // Use fenced code blocks
      listItemIndent: 'one',    // Indent list items with 1 space
      rule: '-',                // Use - for horizontal rules
      ruleRepetition: 3,        // Repeat rule character 3 times
      ruleSpaces: false         // No spaces around rules
    }
  }
}
```

📖 **For complete option reference, see**: [remark-stringify options](https://github.com/remarkjs/remark/tree/main/packages/remark-stringify#options)

#### `remarkGfm` Options

Controls table processing, strikethrough text, task lists, and other GitHub-style markdown features. These options are passed directly to the **[remark-gfm](https://github.com/remarkjs/remark-gfm)** library.

```javascript
// Enable with defaults
{ content: { remarkGfm: true } }

// Disable entirely
{ content: { remarkGfm: false } }

// Custom options
{
  content: {
    remarkGfm: {
      singleTilde: false,      // Require ~~ for strikethrough (not ~)
      tableCellPadding: true,  // Add padding around table cells
      tablePipeAlign: true,    // Align table pipes
      stringLength: stringWidth // Custom string length function
    }
  }
}
```

**Default values when `remarkGfm: true`:**
When you set `remarkGfm: true`, the plugin automatically applies these defaults:
```javascript
{
  singleTilde: false,        // Require ~~ for strikethrough
  tableCellPadding: true,    // Add padding around table cells  
  tablePipeAlign: true,      // Align table pipes
  stringLength: stringWidth  // Use string-width for accurate measurements
}
```

You can override any of these by providing an object instead of `true`:
```javascript
{
  content: {
    remarkGfm: {
      tableCellPadding: false,  // Override: no padding around cells
      // Other defaults will still apply
    }
  }
}
```

📖 **For complete option reference, see**: [remark-gfm options](https://github.com/remarkjs/remark-gfm#options)

#### `rehypeProcessTables` (Plugin Option)

**Type**: `boolean` | **Default**: `true`

This is a plugin-specific option that controls whether to process HTML tables for better markdown conversion. When enabled, the plugin intelligently processes HTML tables to create clean markdown tables. When disabled, tables are left as raw HTML in the markdown output.

### Route Rules

Route rules provide powerful per-route customization capabilities. They allow you to override any processing option for specific routes or route patterns.

#### Basic Route Rule Structure

```typescript
{
  route: string;              // REQUIRED: Glob pattern to match
  depth?: 1 | 2 | 3 | 4 | 5; // Override categorization depth (range: 1-5)
  categoryName?: string;      // Override category display name
  contentSelectors?: string[]; // Override content extraction selectors
  includeOrder?: string[];    // Override subcategory ordering
}
```

**Required fields:**
- `route` - The glob pattern to match routes against

**Optional fields (all have validation constraints):**
- `depth` - Must be integer 1-5
- `categoryName` - Any string
- `contentSelectors` - Array of CSS selector strings
- `includeOrder` - Array of glob pattern strings

#### Route Pattern Matching

Route rules use glob patterns to match routes:

```javascript
{
  content: {
    routeRules: [
      {
        route: '/api/**',              // Matches all API routes
        depth: 3
      },
      {
        route: '/guides/getting-started', // Exact match
        categoryName: 'Quick Start'
      },
      {
        route: '/blog/2024/**',        // Year-specific blog posts
        categoryName: '2024 Posts'
      },
      {
        route: '*/advanced',           // Any route ending in /advanced
        depth: 4
      }
    ]
  }
}
```

#### Rule Priority

When multiple rules match the same route, the **most specific** rule wins:

```javascript
{
  content: {
    routeRules: [
      {
        route: '/api/**',              // Less specific
        depth: 2,
        categoryName: 'API'
      },
      {
        route: '/api/reference/**',    // More specific - this wins
        depth: 4,
        categoryName: 'API Reference'
      }
    ]
  }
}
```

#### Advanced Examples

**API Documentation with Custom Structure:**
```javascript
{
  content: {
    routeRules: [
      {
        route: '/api',                    // REQUIRED field
        categoryName: 'API Overview',
        depth: 1                         // Must be 1-5
      },
      {
        route: '/api/reference/**',       // REQUIRED field
        depth: 4,                        // Must be 1-5
        categoryName: 'API Reference',
        contentSelectors: ['.openapi-content', '.api-docs']
      },
      {
        route: '/api/guides/**',          // REQUIRED field
        categoryName: 'API Guides',
        includeOrder: [
          '/api/guides/quickstart',
          '/api/guides/authentication/**',
          '/api/guides/rate-limiting/**'
        ]
      }
    ]
  }
}
```

**Multi-Language Documentation:**
```javascript
{
  content: {
    routeRules: [
      {
        route: '/en/**',
        categoryName: 'English Documentation',
        includeOrder: ['/en/getting-started/**', '/en/api/**']
      },
      {
        route: '/es/**',
        categoryName: 'Documentación en Español',
        includeOrder: ['/es/comenzar/**', '/es/api/**']
      }
    ]
  }
}
```

## CLI Commands

The plugin provides CLI commands for standalone operation and cleanup:

### Generate Command

```bash
npx docusaurus llms-txt [siteDir]
```

Generates `llms.txt` and markdown files using cached routes from a previous build.

**Arguments:**
- `siteDir` (optional) - Path to your Docusaurus site directory. Defaults to current working directory.

**Prerequisites:** 
You must run `npm run build` first to create the route cache.

**Examples:**
```bash
# Generate in current directory
npx docusaurus llms-txt

# Generate for specific site directory
npx docusaurus llms-txt ./my-docs-site

# Generate using absolute path
npx docusaurus llms-txt /home/user/projects/docs
```

**How it works:**
1. Loads cached route information from the previous build
2. Validates that configuration hasn't changed significantly
3. Processes routes using the current plugin configuration
4. Generates output files in the build directory

**When to use:**
- You want to regenerate llms.txt without rebuilding the entire site
- You're in a CI/CD pipeline and want separate build steps
- You have `runOnPostBuild: false` configured

### Clean Command

```bash
npx docusaurus llms-txt-clean [siteDir] [options]
```

Removes all generated markdown files and `llms.txt` using cached file information.

**Arguments:**
- `siteDir` (optional) - Path to your Docusaurus site directory. Defaults to current working directory.

**Options:**
- `--clear-cache` - Also clear the plugin cache directory

**Examples:**
```bash
# Clean generated files but keep cache
npx docusaurus llms-txt-clean

# Clean everything including cache
npx docusaurus llms-txt-clean --clear-cache

# Clean specific directory
npx docusaurus llms-txt-clean ./docs

# Clean with cache clearing for specific directory
npx docusaurus llms-txt-clean ./docs --clear-cache
```

**What gets cleaned:**
- All individual markdown files generated by the plugin
- The `llms.txt` index file
- Cache entries for markdown files (updates cache to reflect removal)
- With `--clear-cache`: The entire plugin cache directory

**Safe operation:**
- Only removes files that were generated by the plugin (tracked in cache)
- Will not remove files that weren't created by the plugin
- Updates cache to maintain consistency
- Provides detailed logging of what was removed

**When to use:**
- Switching between `enableMarkdownFiles: true/false`
- Cleaning up before changing major configuration
- Debugging generation issues
- Preparing for a clean rebuild

## Advanced Configuration Examples

### Multi-Language Support

```javascript
{
  content: {
    routeRules: [
      {
        route: '/en/**',
        categoryName: 'English Documentation',
        includeOrder: ['/en/getting-started/**', '/en/api/**']
      },
      {
        route: '/es/**',
        categoryName: 'Documentación en Español'
      }
    ]
  }
}
```

### API Documentation Focus

```javascript
{
  siteTitle: 'API Documentation',
  depth: 3,
  content: {
    includeBlog: false,
    includePages: true,
    contentSelectors: [
      '.api-docs-content',
      '.theme-doc-markdown',
      'main'
    ],
    routeRules: [
      {
        route: '/api/reference/**',
        depth: 4,
        categoryName: 'API Reference',
        contentSelectors: ['.openapi-content', '.api-section']
      },
      {
        route: '/api/guides/**',
        categoryName: 'API Guides',
        includeOrder: [
          '/api/guides/quickstart',
          '/api/guides/authentication/**',
          '/api/guides/pagination/**'
        ]
      }
    ],
    excludeRoutes: [
      '/api/legacy/**',
      '**/_category_/**'
    ]
  },
  optionalLinks: [
    {
      title: 'OpenAPI Spec',
      url: 'https://api.example.com/openapi.json',
      description: 'Machine-readable API specification'
    }
  ]
}
```

### Blog-Heavy Site

```javascript
{
  siteTitle: 'Tech Blog & Tutorials',
  depth: 2,
  content: {
    includeBlog: true,
    includePages: true,
    includeDocs: true,
    routeRules: [
      {
        route: '/blog/**',
        categoryName: 'Blog Posts',
        includeOrder: ['/blog/2024/**', '/blog/2023/**']
      },
      {
        route: '/tutorials/**',
        depth: 3,
        categoryName: 'Tutorials'
      }
    ]
  }
}
```

### Custom Content Extraction

```javascript
{
  content: {
    contentSelectors: [
      '.custom-content-area',
      '.documentation-body',
      'main .content',
      'article'
    ],
    remarkStringify: {
      bullet: '-',
      emphasis: '_',
      strong: '**',
      listItemIndent: 'one'
    },
    remarkGfm: {
      tablePipeAlign: false,
      singleTilde: false
    }
  }
}
```

## Understanding the Output

### llms.txt Structure

The generated `llms.txt` follows this structure:

```markdown
# Site Title

> Site description (if provided)

## Category Name
- [Document Title](link): description
- [Another Document](link): description

### Subcategory
- [Subcategory Document](link): description

## Optional
- [External Link](url): description
```

### Markdown Files

When `enableMarkdownFiles` is true, individual markdown files are created for each page:
- Files are saved with clean markdown content
- Internal links are processed based on `relativePaths` setting
- Tables are processed for better markdown compatibility
- Content is extracted using configured selectors

## Troubleshooting

### Common Issues

**"No cached routes found"**
- Run `npm run build` first to generate the cache
- Ensure the plugin is properly configured in `docusaurus.config.js`

**Empty or minimal content**
- Check your `contentSelectors` configuration
- Verify that your content matches the default selectors
- Use `logLevel: 3` for debug output

**Route processing failures**
- Set `onRouteError: 'ignore'` to skip problematic routes
- Use `logLevel: 2` to see which routes are failing
- Check `excludeRoutes` to filter out problematic paths

### Debug Configuration

```javascript
{
  logLevel: 3,           // Maximum verbosity
  onRouteError: 'warn',  // Log route errors but continue
  content: {
    // Your config here
  }
}
```

### Performance Optimization

For large sites:

```javascript
{
  content: {
    excludeRoutes: [
      '**/_category_/**',    // Exclude category pages
      '/archive/**',         // Exclude archived content
      '**/*.xml',           // Exclude XML files
      '**/*.json'           // Exclude JSON files
    ]
  },
  logLevel: 1  // Reduce logging overhead
}
```

## Caching

The plugin uses intelligent caching to speed up subsequent builds:
- Cache is stored in `.docusaurus/docusaurus-plugin-llms-txt/`
- Routes are cached with content hashes for change detection
- Configuration changes automatically invalidate relevant cache entries
- Use `llms-txt-clean --clear-cache` to reset the cache

## License

MIT 

### User Plugin System

The plugin supports custom unified.js plugins for advanced content transformation. You can add your own rehype (HTML processing) or remark (Markdown processing) plugins using standard unified patterns.

#### Processing Pipeline Overview

The plugin processes documents through two main stages:

1. **HTML Processing (Rehype)**: Works on HTML AST (hast) - good for DOM-like operations
2. **Markdown Processing (Remark)**: Works on Markdown AST (mdast) - good for markdown-specific transformations

```
HTML Document
     ↓
beforeDefaultRehypePlugins (your HTML preprocessing)
     ↓
Built-in rehype-tables (flatten lists in tables)
     ↓
Built-in rehype-links (process internal links)
     ↓
Built-in rehype-remark (HTML → Markdown AST)
     ↓
rehypePlugins (your HTML postprocessing)
     ↓
Markdown AST
     ↓
beforeDefaultRemarkPlugins (your Markdown preprocessing)
     ↓
Built-in remark-gfm (GitHub Flavored Markdown)
     ↓
remarkPlugins (your Markdown postprocessing)
     ↓
remark-stringify (AST → String)
     ↓
Final Markdown
```

#### When to Use Each Stage

**`beforeDefaultRehypePlugins`** - Use for:
- HTML preprocessing before built-in processing
- Adding/removing HTML attributes
- DOM manipulations that need to happen early
- Custom HTML element transformations

**`rehypePlugins`** - Use for:
- HTML postprocessing after links/tables are handled
- Final HTML cleanup before markdown conversion
- Custom transformations that depend on built-in processing

**`beforeDefaultRemarkPlugins`** - Use for:
- Markdown AST preprocessing before GFM processing
- Custom markdown node transformations
- Adding markdown-specific metadata

**`remarkPlugins`** - Use for:
- Final markdown transformations after GFM
- Custom formatting and cleanup
- Adding final markdown elements

#### Plugin Configuration

The plugin system follows standard unified.js conventions:

```javascript
import myRehypePlugin from './my-rehype-plugin';
import myRemarkPlugin from './my-remark-plugin';
import remarkEmoji from 'remark-emoji';
import rehypeSlug from 'rehype-slug';

module.exports = {
  plugins: [
    [
      'docusaurus-plugin-llms-txt',
      {
        content: {
          // HTML processing - before built-in plugins
          beforeDefaultRehypePlugins: [
            myRehypePlugin,                           // Direct function
            [rehypeSlug, { prefix: 'custom-' }]      // Function with options
          ],
          
          // HTML processing - after built-in plugins
          rehypePlugins: [
            someCleanupPlugin
          ],
          
          // Markdown processing - before built-in plugins
          beforeDefaultRemarkPlugins: [
            [remarkEmoji, { emoticon: true }]
          ],
          
          // Markdown processing - after built-in plugins
          remarkPlugins: [
            myRemarkPlugin
          ]
        }
      }
    ]
  ]
};
```

#### Plugin Input Formats

Following unified.js standards, plugins can be specified as:

- **Direct function**: `myPlugin`
- **Array with options**: `[myPlugin, { option: 'value' }]`
- **Array with options and settings**: `[myPlugin, options, settings]` (rarely used)

#### Complete Working Example

Here's a practical example that demonstrates all four plugin stages:

**File: `custom-plugins.js`**
```javascript
import { visit } from 'unist-util-visit';

// Stage 1: beforeDefaultRehypePlugins (HTML preprocessing)
export const addImageAltText = (options = {}) => (tree) => {
  visit(tree, 'element', (node) => {
    if (node.tagName === 'img' && !node.properties.alt) {
      node.properties.alt = options.defaultAlt || 'Image';
    }
  });
  return tree;
};

// Stage 2: rehypePlugins (HTML postprocessing)
export const removeEmptyParagraphs = () => (tree) => {
  visit(tree, 'element', (node, index, parent) => {
    if (node.tagName === 'p' && 
        (!node.children || node.children.length === 0)) {
      parent.children.splice(index, 1);
      return [visit.SKIP, index];
    }
  });
  return tree;
};

// Stage 3: beforeDefaultRemarkPlugins (Markdown preprocessing)
export const addHeaderAnchors = (options = {}) => (tree) => {
  visit(tree, 'heading', (node) => {
    if (node.depth <= 3 && options.addAnchors) {
      // Add anchor text to heading
      const textNode = node.children.find(child => child.type === 'text');
      if (textNode) {
        textNode.value += ` {#${textNode.value.toLowerCase().replace(/\s+/g, '-')}}`;
      }
    }
  });
  return tree;
};

// Stage 4: remarkPlugins (Markdown postprocessing)
export const addReadingTime = (options = {}) => (tree) => {
  if (!options.addReadingTime) return tree;
  
  let wordCount = 0;
  visit(tree, 'text', (node) => {
    wordCount += node.value.split(/\s+/).length;
  });
  
  const readingTime = Math.ceil(wordCount / 200); // 200 words per minute
  
  // Add reading time as first paragraph
  tree.children.unshift({
    type: 'paragraph',
    children: [{
      type: 'text',
      value: `📖 Reading time: ${readingTime} minute${readingTime !== 1 ? 's' : ''}`
    }]
  });
  
  return tree;
};
```

**Usage in `docusaurus.config.js`:**
```javascript
import { 
  addImageAltText, 
  removeEmptyParagraphs, 
  addHeaderAnchors, 
  addReadingTime 
} from './custom-plugins';

module.exports = {
  plugins: [
    [
      'docusaurus-plugin-llms-txt',
      {
        content: {
          // Stage 1: HTML preprocessing
          beforeDefaultRehypePlugins: [
            [addImageAltText, { defaultAlt: 'Documentation image' }]
          ],
          
          // Stage 2: HTML postprocessing (after tables/links processed)
          rehypePlugins: [
            removeEmptyParagraphs
          ],
          
          // Stage 3: Markdown preprocessing (before GFM)
          beforeDefaultRemarkPlugins: [
            [addHeaderAnchors, { addAnchors: true }]
          ],
          
          // Stage 4: Final markdown processing
          remarkPlugins: [
            [addReadingTime, { addReadingTime: true }]
          ]
        }
      }
    ]
  ]
};
```

#### AST Node Types Reference

**Rehype (HTML) Node Types:**
- `'element'` - HTML elements (div, p, img, etc.)
- `'text'` - Text content
- `'root'` - Document root

**Remark (Markdown) Node Types:**
- `'heading'` - Markdown headers (# ## ###)
- `'paragraph'` - Paragraph text
- `'text'` - Text content
- `'link'` - Markdown links
- `'list'` - Lists (ordered/unordered)
- `'listItem'` - Individual list items
- `'code'` - Inline code
- `'codeBlock'` - Code blocks
- `'blockquote'` - Block quotes

#### Built-in Processing Details

**Rehype Stage (HTML → Markdown AST):**
1. **`beforeDefaultRehypePlugins`**: Your HTML preprocessing
2. **`rehype-tables`**: Flattens nested lists in table cells for better markdown
3. **`rehype-links`**: Processes internal links (adds .md extensions, handles relative paths)
4. **`rehype-remark`**: Converts HTML AST to Markdown AST
5. **`rehypePlugins`**: Your HTML postprocessing

**Remark Stage (Markdown AST → String):**
1. **`beforeDefaultRemarkPlugins`**: Your markdown preprocessing
2. **`remark-gfm`**: GitHub Flavored Markdown (tables, strikethrough, task lists)
3. **`remarkPlugins`**: Your markdown postprocessing
4. **`remark-stringify`**: Converts AST to final markdown string

#### Error Handling and Debugging

**Plugin Error Handling:**
- **Built-in plugin failures**: Stop processing and throw error
- **User plugin failures**: Log warning and continue processing
- **Enable debug logging**: Set `logLevel: 3` to see plugin execution

**Debugging Tips:**
```javascript
// Add logging to your plugins
export const debugPlugin = () => (tree) => {
  console.log('AST structure:', JSON.stringify(tree, null, 2));
  return tree;
};

// Use in config for debugging
beforeDefaultRehypePlugins: [debugPlugin]
```

**Common Plugin Patterns:**
```javascript
// Pattern 1: Conditional processing
const conditionalPlugin = (options = {}) => (tree) => {
  if (!options.enabled) return tree;
  // ... transformation logic
  return tree;
};

// Pattern 2: Node filtering and transformation
const transformSpecificNodes = () => (tree) => {
  visit(tree, (node) => node.tagName === 'img', (node) => {
    // Transform only img elements
    node.properties.loading = 'lazy';
  });
  return tree;
};

// Pattern 3: Adding new nodes
const addMetadata = () => (tree) => {
  tree.children.unshift({
    type: 'paragraph',
    children: [{ type: 'text', value: 'Generated by custom plugin' }]
  });
  return tree;
};
```

For more advanced plugin development, see the [unified.js documentation](https://unifiedjs.com/), [rehype plugin guide](https://github.com/rehypejs/rehype/blob/main/doc/plugins.md), and [remark plugin guide](https://github.com/remarkjs/remark/blob/main/doc/plugins.md).