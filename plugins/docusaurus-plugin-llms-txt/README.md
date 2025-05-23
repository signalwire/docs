# docusaurus-plugin-llms-txt

A Docusaurus plugin that generates Markdown versions of your HTML pages and creates an `llms.txt` index file for LLM consumption.

## Features

- 🔄 **Dual Output Modes**: Generate individual Markdown files and/or a consolidated `llms.txt` index
- 🏗️ **Hierarchical Organization**: Automatically builds document trees with configurable depth
- ⚡ **Performance Optimized**: Built-in caching system and streaming processing
- 🎯 **Flexible Content Extraction**: Configurable CSS selectors for content areas
- 🔧 **Path-Based Rules**: Apply different configurations to specific URL patterns
- 📱 **CLI Support**: Manual execution with `llms-txt` and `llms-txt-clean` commands
- 🌐 **URL Handling**: Supports both relative and absolute path generation
- 🚫 **Smart Exclusions**: Exclude specific paths with glob patterns


## Quick Start

Add the plugin to your `docusaurus.config.js`:

```javascript
module.exports = {
  plugins: [
    [
      'docusaurus-plugin-llms-txt',
      {
        siteTitle: 'My Documentation',
        siteDescription: 'Comprehensive documentation for our platform',
        enableMarkdownFiles: true,
      },
    ],
  ],
};
```

Run your Docusaurus build:

```bash
npm run build
```

The plugin will generate:
- Individual `.md` files in your build directory (if `enableMarkdownFiles: true`)
- An `llms.txt` file in your build root (always generated)

## Configuration

### Basic Configuration

```javascript
{
  // Core functionality
  enableMarkdownFiles: true,        // Generate individual .md files (llms.txt always generated)
  runOnPostBuild: true,            // Run during Docusaurus build
  
  // Site information
  siteTitle: 'My Documentation',    // Override site title
  siteDescription: 'Site description', // Add site description
  
  // Performance
  enableCache: true,                // Enable caching for faster rebuilds
  logLevel: 2,                     // 0=ERROR, 1=WARN, 2=INFO, 3=DEBUG
}
```

### Advanced Configuration

```javascript
{
  // Content extraction
  contentSelectors: [
    '.theme-doc-markdown',          // Docusaurus default content area
    'article',                      // Fallback to article tag
    'main .container'               // Fallback to main container
  ],
  
  // Directory structure
  docsRoot: '',                     // Docs directory relative to build output
  outputDir: 'markdown-output',     // Custom output directory for .md files
  buildDir: 'build',               // Build directory name
  
  // Document organization
  depth: 2,                        // Category depth (1-5)
  excludePaths: [
    '/blog/**',                    // Exclude blog posts
    '/api-internal/**',            // Exclude internal APIs
    '/404.html'                    // Exclude error pages
  ],
  
  // URL handling
  relativePaths: false,            // Use absolute paths with baseUrl
  enableDescriptions: true,        // Include descriptions in llms.txt
  
  // Markdown processing (exposes library options directly)
  remarkStringify: {
    bullet: '*',                   // Use * for bullets instead of -
    emphasis: '*',                 // Use * for emphasis instead of _
    incrementListMarker: false     // Don't increment ordered list markers
  },
  remarkGfm: {
    singleTilde: true,             // Allow single ~ for strikethrough
    tableCellPadding: false        // Remove padding from table cells
  },
  
  // Path-specific rules
  pathRules: [
    {
      path: '/api/**',
      depth: 3,                    // Deeper nesting for API docs
      contentSelectors: ['.api-content']
    },
    {
      path: '/guides/**',
      category: 'User Guides',     // Override category name
      depth: 2
    },
    {
      path: "/swml/**",
      category: "SWML",  // Override category display name
      depth: 2
    },
    {
      path: "/api/reference/**",
      contentSelectors: [".api-content"],
      excludePaths: ["/api/reference/internal/**"]
    }
  ],
  
  // Additional content
  optionalLinks: [
    {
      title: 'GitHub Repository',
      url: 'https://github.com/myorg/myrepo',
      description: 'Source code and issues'
    },
    {
      title: 'Support Portal',
      url: 'https://support.mysite.com'
    }
  ]
}
```

## CLI Usage

The plugin provides CLI commands for manual execution:

### Generate Files

```bash
# Use current directory
npx docusaurus llms-txt

# Specify site directory
npx docusaurus llms-txt /path/to/site

# This uses your plugin configuration from docusaurus.config.js
```

### Clean Generated Files

```bash
# Remove all generated .md files and llms.txt
npx docusaurus llms-txt-clean

# Specify site directory
npx docusaurus llms-txt-clean /path/to/site
```

## Output Examples

### llms.txt Output

```markdown
# My Documentation

> Comprehensive documentation for our platform

- [Home](/)
- [Getting Started](/getting-started): Quick start guide

## API Reference

- [API Overview](/api): Complete API documentation
- [Authentication](/api/auth): API authentication methods
- [REST Endpoints](/api/rest): RESTful API endpoints

## User Guides

- [Installation Guide](/guides/installation): How to install our software
- [Configuration](/guides/config): Configuration options

## Optional

- [GitHub Repository](https://github.com/myorg/myrepo): Source code and issues
- [Support Portal](https://support.mysite.com)
```

### Generated Markdown Files

Individual `.md` files are created for each HTML page:
- `getting-started.md`
- `api.md`
- `api/auth.md`
- `guides/installation.md`

## Configuration Reference

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `enableMarkdownFiles` | `boolean` | `true` | Generate individual .md files |
| `runOnPostBuild` | `boolean` | `true` | Run during Docusaurus postBuild |
| `siteTitle` | `string` | `""` | Custom title for llms.txt (overrides site title) |
| `siteDescription` | `string` | `""` | Description shown in llms.txt |
| `enableCache` | `boolean` | `true` | Enable caching for performance |
| `relativePaths` | `boolean` | `true` | Use relative paths (true) or absolute with baseUrl (false) |
| `enableDescriptions` | `boolean` | `true` | Include page descriptions in llms.txt |
| `contentSelectors` | `string[]` | `['.theme-doc-markdown', 'article', 'main .container']` | CSS selectors for content extraction |
| `docsRoot` | `string` | `""` | Root directory for docs relative to build output |
| `outputDir` | `string` | `""` | Directory for .md files (defaults to build directory) |
| `buildDir` | `string` | `"build"` | Build directory name relative to site root |
| `depth` | `1\|2\|3\|4\|5` | `1` | Default category depth for document tree |
| `excludePaths` | `string[]` | `[]` | Glob patterns to exclude from processing |
| `pathRules` | `PathRule[]` | `[]` | Path-specific configuration overrides |
| `remarkStringify` | `object` | See below | Options for [remark-stringify](https://www.npmjs.com/package/remark-stringify) (exposes library options directly) |
| `remarkGfm` | `boolean\|object` | `true` | Options for [remark-gfm](https://www.npmjs.com/package/remark-gfm) (exposes library options directly) |
| `rehypeProcessTables` | `boolean` | `true` | Enable custom table processing |
| `optionalLinks` | `OptionalLink[]` | `[]` | Additional links to include in llms.txt |
| `logLevel` | `0\|1\|2\|3` | `2` | Logging verbosity (ERROR/WARN/INFO/DEBUG) |

### Path Rules

Path rules allow you to configure **how to process** specific paths. For excluding files entirely, use `excludePaths` instead.

```typescript
{
  // Control WHETHER to process files
  excludePaths: ["/internal/**", "/temp/**"],
  
  // Control HOW to process files
  pathRules: [
    {
      path: "/swml/**",
      category: "SWML",  // Override category display name
      depth: 2
    },
    {
      path: "/api/reference/**",
      contentSelectors: [".api-content"],
      excludePaths: ["/api/reference/internal/**"]
    }
  ]
}
```

#### Path Rule Options

- **`path`** (required): Glob pattern to match route paths (e.g., `/swml/**`, `/docs/api/*`)
- **`depth`**: Override categorization depth for this path
- **`category`**: Override the display name for the category
- **`excludePaths`**: Exclude sub-paths from this rule  
- **`contentSelectors`**: Override content selectors for this path

#### Category Override Examples

```typescript
// Example 1: Rename top-level category
{
  pathRules: [
    {
      path: "/swml/**",
      category: "SWML Documentation"  // /swml → "SWML Documentation"
    }
  ]
}
// Result: All files under /swml/ will be categorized under "SWML Documentation"

// Example 2: Multiple category overrides
{
  pathRules: [
    {
      path: "/swml/**",
      category: "SWML"
    },
    {
      path: "/swml/methods/**", 
      category: "SWML Methods"  // More specific override
    }
  ]
}
// Result: 
// - /swml/guides/... → "SWML" > "guides"
// - /swml/methods/... → "SWML Methods" > subcategories
```

#### Excluding Files vs. Configuring Processing

```typescript
{
  // ✅ Use excludePaths to skip files entirely
  excludePaths: [
    "/internal/**",     // Internal documentation
    "/temp/**",         // Temporary files
    "/node_modules/**"  // Dependencies
  ],

  // ✅ Use pathRules to configure how to process files
  pathRules: [
    {
      path: "/api/**",
      depth: 3,
      category: "API Documentation",
      contentSelectors: [".api-content"]
    }
  ]
}
```

#### Link Handling for Excluded Paths

When files reference excluded paths, the links are handled intelligently:

**With `relativePaths: false` (absolute URLs):**
```typescript
{
  excludePaths: ["/internal/**"],
  relativePaths: false,
  baseUrl: "https://example.com"
}
```

**Result:** Links to excluded paths get the base URL but no `.md` extension since no file is generated.
- `<a href="/internal/debug">` → `<a href="https://example.com/internal/debug">`
- `<a href="/docs/guide">` → `<a href="https://example.com/docs/guide.md">` (processed file)

**With `relativePaths: true` (relative URLs):**
Excluded links are left unchanged since no transformation is needed for relative paths.

### PathRule Configuration

```typescript
interface PathRule {
  path: string;                    // Glob pattern to match routes
  depth?: 1|2|3|4|5;              // Override depth for this path
  excludePaths?: string[];         // Exclude sub-paths from this rule
  contentSelectors?: string[];     // Override content selectors
  category?: string;               // Override category name
}
```

### OptionalLink Configuration

```typescript
interface OptionalLink {
  title: string;                   // Link title
  url: string;                     // Link URL
  description?: string;            // Optional description
}
```

### Default remarkStringify Options

The plugin exposes [remark-stringify](https://www.npmjs.com/package/remark-stringify) options directly for full customization of Markdown output formatting. Default values:

```javascript
{
  bullet: '-',
  emphasis: '_',
  strong: '*',
  fence: '`',
  fences: true,
  incrementListMarker: true,
  listItemIndent: 'one',
  tightDefinitions: true,
  setext: false
}
```

For all available options, see the [remark-stringify documentation](https://github.com/remarkjs/remark/tree/main/packages/remark-stringify#options).

### remarkGfm Configuration

The `remarkGfm` option exposes [remark-gfm](https://www.npmjs.com/package/remark-gfm) configuration directly:

- `false`: Disable GitHub Flavored Markdown entirely
- `true`: Enable with plugin defaults (recommended)
- `object`: Custom configuration merged with defaults

```javascript
// Custom GFM configuration
remarkGfm: {
  singleTilde: false,        // Require ~~ for strikethrough (not single ~)
  tableCellPadding: true,    // Add padding to table cells
  tablePipeAlign: true,      // Align table pipes
  stringLength: stringWidth  // Function to measure string width
}
```

For all available options, see the [remark-gfm documentation](https://github.com/remarkjs/remark-gfm#options).

## Use Cases

### LLM Training Data
- Generate clean Markdown versions of your documentation
- Create hierarchical index files for better LLM consumption
- Exclude irrelevant content (navigation, footers, etc.)

### Documentation Backup
- Create Markdown backups of your Docusaurus site
- Version control your documentation in Markdown format
- Archive documentation snapshots

### Content Migration
- Export Docusaurus content to other platforms
- Convert to other documentation formats
- Integrate with external documentation tools

## Troubleshooting

### Build Directory Not Found
```
Error: Build directory not found: /path/to/build
```
**Solution**: Run `npm run build` first to generate the HTML files, or specify a custom `buildDir` in the configuration.

### No Content Extracted
**Issue**: Empty Markdown files or missing content in llms.txt
**Solution**: Adjust `contentSelectors` to match your site's HTML structure. Use browser dev tools to identify the correct CSS selectors.

### Performance Issues
**Issue**: Slow build times
**Solutions**:
- Enable caching: `enableCache: true`
- Exclude unnecessary paths: Add patterns to `excludePaths`
- Reduce processing: Set `enableMarkdownFiles: false` if you only need llms.txt

### Path Issues
**Issue**: Incorrect links in generated files
**Solutions**:
- Check `relativePaths` setting
- Verify `baseUrl` in your Docusaurus config
- Use path rules for specific URL patterns

**Note**: The plugin automatically normalizes URLs by removing trailing slashes and file extensions before applying transformations. For example, `/docs/api/` becomes `/docs/api.md` (not `/docs/api/.md`).

## TypeScript Support

The plugin is fully typed. Import types for configuration:

```typescript
import { PluginOptions, LogLevel, Depth } from 'docusaurus-plugin-llms-txt';

const config: PluginOptions = {
  enableMarkdownFiles: true,  // llms.txt always generated
  logLevel: LogLevel.INFO,
  depth: Depth.TWO,
  // ... other options
};
```

## License

MIT

## Contributing

See [CONTRIBUTE.md](./CONTRIBUTE.md) for development guidelines and architecture details. 