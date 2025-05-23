# Path Utilities

## Overview

The Path Utilities (`src/filesystem/path.ts`) provide essential path transformation and routing functions for the plugin. They handle the complex task of converting HTML file paths to appropriate route paths and Markdown file paths, ensuring consistency across different operating systems and use cases.

## Core Functions

### `generateRoutePath()`

The primary function for converting HTML file paths to route paths using Docusaurus conventions:

```typescript
export function generateRoutePath(
  relHtmlPath: string, 
  enableMarkdownFiles: boolean, 
  logger?: Logger
): string
```

**Purpose:**
- Converts HTML file paths to clean, Docusaurus-compatible route paths
- Handles index files, extensions, and path normalization
- Integrates with Docusaurus's `fileToPath()` utility for consistency

#### Implementation Strategy

```typescript
export function generateRoutePath(
  relHtmlPath: string, 
  enableMarkdownFiles: boolean, 
  logger?: Logger
): string {
  const log = logger || createLogger('docusaurus-plugin-llms-txt');
  
  if (!relHtmlPath) return '/';
  
  // Convert HTML path to a virtual source path that fileToPath() can handle properly
  const virtualSourcePath = htmlToVirtualSourcePath(relHtmlPath, enableMarkdownFiles);
  
  // Let Docusaurus handle all the complex path logic (index files, extensions, etc.)
  let routePath = fileToPath(virtualSourcePath);
  
  // Special handling for root index.html file
  if (relHtmlPath === 'index.html') {
    routePath = enableMarkdownFiles ? '/index.md' : '/';
  } else {
    // fileToPath() for .md files adds trailing slash for directories, but we want clean paths
    if (routePath.endsWith('/') && routePath !== '/') {
      routePath = routePath.slice(0, -1);
    }
    
    // Add .md extension back if needed
    if (enableMarkdownFiles && !routePath.endsWith('.md')) {
      routePath += MD_EXTENSION;
    }
  }
  
  // Validate the generated pathname
  const pathToValidate = enableMarkdownFiles ? routePath.replace(/\.md$/, '') : routePath;
  if (!isValidPathname(pathToValidate)) {
    log.warn(`Generated invalid pathname: ${pathToValidate} from ${relHtmlPath}`);
    return enableMarkdownFiles ? '/index.md' : '/';
  }
  
  return routePath;
}
```

#### Path Transformation Examples

| Input HTML Path | `enableMarkdownFiles: true` | `enableMarkdownFiles: false` |
|-----------------|----------------------------|------------------------------|
| `index.html` | `/index.md` | `/` |
| `docs/api.html` | `/docs/api.md` | `/docs/api` |
| `blog/index.html` | `/blog.md` | `/blog` |
| `guides/getting-started.html` | `/guides/getting-started.md` | `/guides/getting-started` |

### `htmlPathToMdPath()`

Converts HTML file paths to corresponding Markdown file paths:

```typescript
export function htmlPathToMdPath(relHtmlPath: string, mdOutDir: string): string
```

**Features:**
- **Index File Handling**: Converts `blog/index.html` → `blog.md`
- **Regular Files**: Converts `api/reference.html` → `api/reference.md`
- **Directory Structure**: Maintains directory hierarchy
- **Output Directory**: Places files in specified output directory

#### Implementation Details

```typescript
export function htmlPathToMdPath(relHtmlPath: string, mdOutDir: string): string {
  if (/[/\\]index\.html$/.test(relHtmlPath)) {
    return path.join(mdOutDir, relHtmlPath.replace(/[/\\]index\.html$/, '') + MD_EXTENSION);
  }
  return path.join(mdOutDir, relHtmlPath.replace(/\.html$/, MD_EXTENSION));
}
```

**Transformation Examples:**
- `blog/index.html` → `{mdOutDir}/blog.md`
- `api/reference.html` → `{mdOutDir}/api/reference.md`
- `guides/setup.html` → `{mdOutDir}/guides/setup.md`

### `toPosixPath()`

Converts OS-specific paths to POSIX (forward slash) format:

```typescript
export function toPosixPath(p: string): string
```

**Purpose:**
- **Cross-Platform Compatibility**: Ensures consistent path format
- **Route Generation**: Creates predictable route paths
- **Cache Keys**: Provides consistent cache key format
- **URL Building**: Prepares paths for URL construction

#### Usage Examples

```typescript
// Windows path
toPosixPath('docs\\api\\index.html');  // → 'docs/api/index.html'

// Already POSIX
toPosixPath('docs/api/index.html');    // → 'docs/api/index.html'

// Mixed separators
toPosixPath('docs/api\\reference.html'); // → 'docs/api/reference.html'
```

## Cache Path Functions

### `getCacheDir()`

Builds the cache directory path:

```typescript
export function getCacheDir(siteDir: string): string
```

**Path Structure:**
```
{siteDir}/.docusaurus/.llms-txt/
```

### `getCacheFilePath()`

Builds the complete cache file path:

```typescript
export function getCacheFilePath(siteDir: string): string
```

**Path Structure:**
```
{siteDir}/.docusaurus/.llms-txt/cache.json
```

## Virtual Source Path Strategy

### `htmlToVirtualSourcePath()`

Internal function that converts HTML paths to virtual source paths for `fileToPath()` processing:

```typescript
function htmlToVirtualSourcePath(htmlPath: string, enableMarkdownFiles: boolean): string {
  const posixPath = toPosixPath(htmlPath);
  
  if (enableMarkdownFiles) {
    // Convert .html to .md so fileToPath() handles it as a markdown file
    return posixPath.replace(/\.html?$/i, '.md');
  } else {
    // Convert .html to .txt so fileToPath() strips the extension 
    return posixPath.replace(/\.html?$/i, '.txt');
  }
}
```

**Strategy Explanation:**
- **Markdown Mode**: Converts to `.md` extension for proper `fileToPath()` handling
- **HTML Mode**: Converts to `.txt` extension so `fileToPath()` strips it
- **Docusaurus Integration**: Leverages Docusaurus's proven path processing logic

## Path Validation

### Pathname Validation

```typescript
const pathToValidate = enableMarkdownFiles ? routePath.replace(/\.md$/, '') : routePath;
if (!isValidPathname(pathToValidate)) {
  log.warn(`Generated invalid pathname: ${pathToValidate} from ${relHtmlPath}`);
  return enableMarkdownFiles ? '/index.md' : '/';
}
```

**Validation Features:**
- **Docusaurus Compatibility**: Uses `isValidPathname()` from Docusaurus utils
- **Fallback Handling**: Returns safe fallback for invalid paths
- **Warning Logging**: Logs warnings for debugging invalid path generation
- **Extension Handling**: Validates paths without extensions for broader compatibility

## Error Handling and Logging

### Warning System

```typescript
const log = logger || createLogger('docusaurus-plugin-llms-txt');

if (!isValidPathname(pathToValidate)) {
  log.warn(`Generated invalid pathname: ${pathToValidate} from ${relHtmlPath}`);
  return enableMarkdownFiles ? '/index.md' : '/';
}
```

**Features:**
- **Optional Logging**: Accepts optional logger parameter
- **Fallback Logger**: Creates default logger if none provided
- **Warning Messages**: Provides specific warning messages
- **Safe Fallbacks**: Returns safe paths when validation fails

### Graceful Degradation

```typescript
if (!relHtmlPath) return '/';

// ... processing logic ...

// Fallback for invalid paths
return enableMarkdownFiles ? '/index.md' : '/';
```

**Degradation Strategy:**
- **Empty Path Handling**: Returns root path for empty inputs
- **Invalid Path Recovery**: Returns safe fallback for invalid generated paths
- **Mode Awareness**: Fallbacks respect the `enableMarkdownFiles` setting

## Integration with Docusaurus

### `fileToPath()` Integration

```typescript
// Let Docusaurus handle all the complex path logic
let routePath = fileToPath(virtualSourcePath);
```

**Benefits:**
- **Proven Logic**: Uses Docusaurus's battle-tested path processing
- **Consistency**: Ensures paths match Docusaurus conventions
- **Index Handling**: Proper handling of index files and directories
- **Extension Management**: Correct extension handling for different file types

### Validation Integration

```typescript
if (!isValidPathname(pathToValidate)) {
  // Handle invalid paths
}
```

**Features:**
- **Docusaurus Standards**: Uses same validation as Docusaurus core
- **Route Compatibility**: Ensures generated routes work with Docusaurus router
- **Security**: Prevents invalid or potentially dangerous paths

## Performance Considerations

### Path Caching

```typescript
// Paths are processed once and cached in DocInfo objects
const routePath = generateRoutePath(relHtmlPath, !!config.enableMarkdownFiles, logger);
```

**Optimizations:**
- **Single Processing**: Each path is processed once during file processing
- **Result Caching**: Results are stored in `DocInfo` objects
- **Minimal Allocations**: Efficient string operations
- **Native Operations**: Uses Node.js native path operations

### Efficient String Operations

```typescript
// Efficient regex-based transformations
if (/[/\\]index\.html$/.test(relHtmlPath)) {
  return path.join(mdOutDir, relHtmlPath.replace(/[/\\]index\.html$/, '') + MD_EXTENSION);
}
```

**Features:**
- **Regex Efficiency**: Uses compiled regex patterns
- **Single Pass**: Transforms paths in one operation
- **Minimal String Creation**: Reduces temporary string allocations

## Usage Examples

### Basic Route Generation

```typescript
// Generate route for Markdown files
const routePath = generateRoutePath('docs/api.html', true);
console.log(routePath); // '/docs/api.md'

// Generate route for HTML-only mode
const routePath = generateRoutePath('docs/api.html', false);
console.log(routePath); // '/docs/api'
```

### Markdown File Path Generation

```typescript
const mdPath = htmlPathToMdPath('blog/index.html', '/output');
console.log(mdPath); // '/output/blog.md'

const mdPath = htmlPathToMdPath('guides/setup.html', '/output');
console.log(mdPath); // '/output/guides/setup.md'
```

### Path Normalization

```typescript
// Cross-platform path normalization
const posixPath = toPosixPath('docs\\api\\index.html');
console.log(posixPath); // 'docs/api/index.html'
```

### Cache Path Generation

```typescript
const cacheDir = getCacheDir('/my-site');
console.log(cacheDir); // '/my-site/.docusaurus/.llms-txt'

const cachePath = getCacheFilePath('/my-site');
console.log(cachePath); // '/my-site/.docusaurus/.llms-txt/cache.json'
```

## Best Practices

### Path Generation

1. **Consistent Format**: Always use POSIX paths for internal processing
2. **Validation**: Validate generated paths before use
3. **Logging**: Log warnings for invalid path generation
4. **Fallbacks**: Provide safe fallbacks for edge cases

### Performance

1. **Single Processing**: Process each path only once
2. **Cache Results**: Store processed paths in data structures
3. **Efficient Operations**: Use native path operations where possible
4. **Minimal Allocations**: Avoid unnecessary string creation

### Error Handling

1. **Graceful Degradation**: Handle invalid inputs gracefully
2. **Warning Logging**: Log issues for debugging
3. **Safe Fallbacks**: Return safe paths when processing fails
4. **Context Preservation**: Maintain original path information for debugging

## Related Components

- **[File I/O](./io.md)**: Uses path utilities for file operations
- **[HTML Processor](../pipeline/html-processor.md)**: Consumes route generation functions
- **[Cache Management](./cache.md)**: Uses cache path functions
- **[URL Utilities](../utils/url-utilities.md)**: Builds on path utilities for URL formatting 