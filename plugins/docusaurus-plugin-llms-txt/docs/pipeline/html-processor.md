# HTML Processor

## Overview

The HTML Processor (`src/pipeline/html/html-processor.ts`) is responsible for processing individual HTML files and converting them into structured document information. It serves as the bridge between raw HTML files and the plugin's internal document representation.

## Core Responsibilities

1. **File Processing**: Converts individual HTML files to `DocInfo` objects
2. **Route Generation**: Creates appropriate route paths for documents
3. **Content Extraction**: Delegates to HTML converter for content processing
4. **Metadata Extraction**: Extracts titles and descriptions from HTML
5. **File Management**: Handles Markdown file creation and existence checking

## Key Functions

### `processHtmlFile()`

The main function that processes a single HTML file through the complete pipeline.

```typescript
export async function processHtmlFile(
  relHtmlPath: string,      // Relative path to HTML file
  docsDir: string,          // Base docs directory
  mdOutDir: string,         // Markdown output directory
  config: PluginOptions,    // Plugin configuration
  logger: Logger,           // Logger instance
  baseUrl: string,          // Site base URL
): Promise<DocInfo>
```

#### Processing Flow

1. **Path Generation**
   ```typescript
   const routePath = generateRoutePath(relHtmlPath, !!config.enableMarkdownFiles, logger);
   ```
   - Uses `generateRoutePath()` to create clean, Docusaurus-compatible routes
   - Handles index files, extensions, and path normalization

2. **HTML Reading**
   ```typescript
   const html = await fs.readFile(absHtmlPath, 'utf8');
   ```
   - Reads the HTML file content from disk
   - Uses UTF-8 encoding for proper character handling

3. **Content Processing** (Conditional)
   
   **For Markdown File Generation:**
   ```typescript
   const conversionOptions: MarkdownConversionOptions = {
     remarkStringify: config.remarkStringify,
     remarkGfm: config.remarkGfm,
     rehypeProcessTables: config.rehypeProcessTables,
     rehypeProcessLinks: true,
     baseUrl: baseUrl,
     relativePaths: config.relativePaths,
     enableMarkdownFiles: config.enableMarkdownFiles,
     excludePaths: config.excludePaths,
     logger: logger,
   };
   
   const result = await processHtmlToMarkdown(html, conversionOptions, contentSelectors);
   ```
   
   **For Metadata-Only Processing:**
   ```typescript
   const result = await extractHtmlMetadata(html, contentSelectors);
   ```

4. **File Output** (If Enabled)
   ```typescript
   const mdPath = htmlPathToMdPath(relHtmlPath, mdOutDir);
   await saveMarkdownFile(mdPath, markdown);
   ```

### `checkMarkdownFileExists()`

Utility function to verify if a Markdown file already exists for a given HTML path.

```typescript
export async function checkMarkdownFileExists(
  relHtmlPath: string, 
  mdOutDir: string
): Promise<boolean>
```

**Use Cases:**
- Cache validation: Ensure generated files still exist
- Incremental builds: Skip processing if output is current
- Cleanup verification: Confirm file removal

## Configuration Integration

The HTML processor integrates deeply with the plugin configuration:

### Content Selectors
```typescript
const contentSelectors = config.contentSelectors ? [...config.contentSelectors] : [];
```
- Uses configured CSS selectors for content extraction
- Falls back to default selectors if none specified
- Passes selectors to HTML converter for processing

### Processing Modes

**Full Processing Mode** (`enableMarkdownFiles: true`):
- Converts HTML to Markdown
- Applies all unified plugins
- Saves individual `.md` files
- Processes links and tables

**Metadata-Only Mode** (`enableMarkdownFiles: false`):
- Extracts only title and description
- Skips content conversion
- No file output
- Optimized for `llms.txt` generation only

### Path Rules Integration

The processor respects path-specific rules through the configuration:
- Uses effective config for the specific path
- Applies custom content selectors if specified
- Handles path-specific exclusions

## Error Handling

The HTML processor implements comprehensive error handling:

### Error Types
- **File Read Errors**: HTML file not found or unreadable
- **Conversion Errors**: HTML to Markdown conversion failures
- **File Write Errors**: Markdown file creation failures
- **Path Generation Errors**: Invalid route path generation

### Error Strategy
```typescript
try {
  // Processing logic
} catch (error) {
  const errorMsg = getErrorMessage(error);
  const errorCause = getErrorCause(error);
  
  logger.debug(`Error processing ${relHtmlPath}: ${errorMsg}`);
  throw createDocumentError(`Failed to process HTML file: ${errorMsg}`, relHtmlPath, errorCause);
}
```

- Uses typed error creation with `createDocumentError()`
- Preserves original error context
- Provides detailed logging for debugging
- Includes file path in error context

## Performance Considerations

### Memory Management
- Processes one file at a time (no batch loading)
- Releases HTML content after processing
- Uses streaming for large files

### Caching Integration
- Works with the orchestrator's caching system
- Provides file existence checking for cache validation
- Supports incremental processing

### Logging Optimization
- Uses debug-level logging for detailed operations
- Truncates long titles in log messages
- Provides progress indicators

## Integration Points

### With HTML Converter
```typescript
const result = await processHtmlToMarkdown(html, conversionOptions, contentSelectors);
```
- Delegates actual HTML-to-Markdown conversion
- Passes configuration and selectors
- Receives structured conversion results

### With Path Utilities
```typescript
const routePath = generateRoutePath(relHtmlPath, !!config.enableMarkdownFiles, logger);
const mdPath = htmlPathToMdPath(relHtmlPath, mdOutDir);
```
- Uses path utilities for route generation
- Handles Markdown file path creation
- Ensures consistent path handling

### With File I/O
```typescript
await saveMarkdownFile(mdPath, markdown);
```
- Uses atomic file operations
- Ensures directory creation
- Handles file system errors gracefully

## Usage Examples

### Basic File Processing
```typescript
const docInfo = await processHtmlFile(
  'docs/api/index.html',
  '/build',
  '/build/markdown',
  config,
  logger,
  'https://example.com'
);

console.log(docInfo);
// {
//   routePath: '/docs/api',
//   htmlPath: 'docs/api/index.html',
//   title: 'API Documentation',
//   description: 'Complete API reference'
// }
```

### Metadata-Only Processing
```typescript
const config = { enableMarkdownFiles: false };
const docInfo = await processHtmlFile(htmlPath, docsDir, mdOutDir, config, logger, baseUrl);
// Only extracts metadata, no Markdown file created
```

### With Custom Content Selectors
```typescript
const config = {
  contentSelectors: ['.api-content', '.documentation', 'main']
};
const docInfo = await processHtmlFile(htmlPath, docsDir, mdOutDir, config, logger, baseUrl);
// Uses custom selectors for content extraction
```

## Best Practices

1. **Error Handling**: Always wrap processing in try-catch blocks
2. **Logging**: Use appropriate log levels for different operations
3. **Configuration**: Validate configuration before processing
4. **Path Handling**: Use provided utilities for consistent path operations
5. **Memory**: Process files individually to avoid memory issues

## Related Components

- **[HTML Converter](./html-converter.md)**: Handles actual HTML-to-Markdown conversion
- **[Path Utilities](../filesystem/path.md)**: Provides path transformation functions
- **[File I/O](../filesystem/io.md)**: Handles file reading and writing operations
- **[Orchestrator](./orchestrator.md)**: Coordinates multiple file processing 