# HTML Converter

## Overview

The HTML Converter (`src/pipeline/html/html-converter.ts`) is responsible for the actual conversion of HTML content to Markdown format. It serves as the bridge between raw HTML and structured Markdown, handling content extraction, metadata parsing, and unified processor coordination.

## Core Responsibilities

1. **Content Extraction**: Extracts main content from HTML using CSS selectors
2. **Metadata Parsing**: Extracts titles and descriptions from HTML documents
3. **HTML-to-Markdown Conversion**: Converts HTML AST to Markdown AST using unified
4. **Title Extraction**: Uses multiple strategies to reliably extract document titles
5. **Lightweight Processing**: Provides metadata-only extraction for performance

## Key Functions

### `processHtmlToMarkdown()`

The main conversion function that transforms HTML to Markdown with full processing:

```typescript
export async function processHtmlToMarkdown(
  html: string,
  options: MarkdownConversionOptions = {},
  selectors: readonly string[] = [],
): Promise<ConversionResult>
```

#### Processing Flow

1. **HTML Parsing**
   ```typescript
   const parser = unified().use(rehypeParse, { fragment: false });
   const htmlAst = parser.parse(html) as HostHast.Root;
   ```

2. **Content Extraction**
   ```typescript
   const { content, title, description } = extractContent(htmlAst, selectors);
   ```

3. **Content Conversion**
   ```typescript
   const contentHtml = toHtml(content as HostHast.Nodes);
   const processor = buildMarkdownProcessor(options);
   const result = await processor.process(contentHtml);
   ```

4. **Result Assembly**
   ```typescript
   return { 
     content: String(result), 
     title: title || 'Untitled Document', 
     description: description || '' 
   };
   ```

### `extractHtmlMetadata()`

Lightweight function for extracting only metadata without full content conversion:

```typescript
export async function extractHtmlMetadata(
  html: string,
  _selectors: readonly string[] = [],
): Promise<{ title: string; description: string }>
```

**Use Cases:**
- `llms.txt` generation without individual Markdown files
- Performance optimization for metadata-only operations
- Quick document indexing and cataloging

#### Processing Flow

1. **Parse HTML**
   ```typescript
   const parser = unified().use(rehypeParse, { fragment: false });
   const htmlAst = parser.parse(html) as HostHast.Root;
   ```

2. **Extract Metadata**
   ```typescript
   const metaDesc = select('meta[name="description"]', htmlAst);
   const description = metaDesc ? (metaDesc.properties?.content as string) : '';
   const title = extractTitle(htmlAst);
   ```

3. **Return Results**
   ```typescript
   return { 
     title: title || 'Untitled Document', 
     description: description || '' 
   };
   ```

## Content Extraction Strategy

### `extractContent()`

Internal function that extracts content, title, and description from HTML AST:

```typescript
function extractContent(
  tree: HostHast.Root, 
  selectors: readonly string[]
): { content: HostHast.Element | null; title: string; description: string }
```

#### Extraction Process

1. **Meta Description Extraction**
   ```typescript
   const metaDesc = select('meta[name="description"]', tree) as HostHast.Element | null;
   const description = metaDesc ? ((metaDesc.properties?.content as string) || '') : '';
   ```

2. **Title Extraction**
   ```typescript
   const title = extractTitle(tree);
   ```

3. **Content Area Selection**
   ```typescript
   let content: HostHast.Element | null = null;
   
   // Try each selector in order until we find content
   for (const sel of selectors) {
     const node = select(sel, tree) as HostHast.Element | null;
     if (node) { 
       content = node; 
       break; 
     }
   }
   
   // Fall back to body if no selectors matched
   if (!content) {
     content = select('body', tree) as HostHast.Element | null;
   }
   ```

### Content Selector Strategy

The converter uses a **fallback strategy** for content extraction:

1. **Primary Selectors**: User-configured CSS selectors
2. **Default Selectors**: Plugin defaults (`.theme-doc-markdown`, `article`, etc.)
3. **Fallback**: `body` element if no selectors match

**Benefits:**
- **Flexibility**: Works with different site structures
- **Reliability**: Always finds some content to process
- **Customization**: Users can specify their own selectors
- **Graceful Degradation**: Falls back to reasonable defaults

## Title Extraction Integration

### Strategy Pattern Implementation

```typescript
const title = extractTitle(tree);
```

The converter integrates with the title extraction system:

**Title Extraction Strategies:**
1. **Header H1**: `header h1` elements (most specific)
2. **Content H1**: First tries `main h1`, `.main-wrapper h1`, `article h1`, then any `h1` element
3. **Document Title**: `<title>` tag with site name removal

**Fallback Logic:**
- Tries each strategy in order of specificity
- Returns first successful extraction
- Falls back to "Untitled Document" if all fail

## Unified Processor Integration

### Processor Configuration

```typescript
const processor = buildMarkdownProcessor({
  remarkGfm: options.remarkGfm,
  remarkStringify: options.remarkStringify,
  rehypeProcessTables: options.rehypeProcessTables,
  rehypeProcessLinks: options.rehypeProcessLinks,
  baseUrl: options.baseUrl,
  relativePaths: options.relativePaths,
  enableMarkdownFiles: options.enableMarkdownFiles,
  excludePaths: options.excludePaths,
  logger: options.logger,
});
```

**Configuration Options:**
- **remarkGfm**: GitHub Flavored Markdown support
- **remarkStringify**: Markdown output formatting
- **rehypeProcessTables**: Table processing for Markdown compatibility
- **rehypeProcessLinks**: Internal link transformation
- **excludePaths**: Link exclusion patterns
- **logger**: Debug logging support

### Processing Pipeline

The converter coordinates the unified processing pipeline:

1. **HTML Parsing**: Parse HTML string to AST
2. **Content Extraction**: Select relevant content areas
3. **HTML Serialization**: Convert content AST back to HTML string
4. **Unified Processing**: Apply rehype and remark plugins
5. **Markdown Generation**: Convert final AST to Markdown string

## Error Handling

### Conversion Error Handling

```typescript
try {
  // Conversion logic
} catch (error) {
  throw createConversionError(
    `Error processing HTML to Markdown: ${error instanceof Error ? error.message : String(error)}`,
    error instanceof Error ? error : undefined,
  );
}
```

**Error Strategy:**
- **Typed Errors**: Uses `createConversionError()` for consistent error types
- **Context Preservation**: Maintains original error information
- **Graceful Degradation**: Returns empty content rather than failing completely
- **Detailed Messages**: Provides specific error context

### Metadata Extraction Error Handling

```typescript
try {
  // Metadata extraction
} catch (error) {
  throw createConversionError(
    `Error extracting HTML metadata: ${error instanceof Error ? error.message : String(error)}`,
    error instanceof Error ? error : undefined,
  );
}
```

**Features:**
- **Non-Critical Failures**: Metadata extraction failures don't stop processing
- **Fallback Values**: Returns default values when extraction fails
- **Error Context**: Preserves original error for debugging

## Performance Considerations

### Processing Mode Optimization

```typescript
if (config.enableMarkdownFiles) {
  // Full processing for individual markdown files
  const result = await processHtmlToMarkdown(html, conversionOptions, contentSelectors);
} else {
  // Lightweight processing for llms.txt only
  const result = await extractHtmlMetadata(html, contentSelectors);
}
```

**Benefits:**
- **Conditional Processing**: Only does expensive conversion when needed
- **Memory Efficiency**: Metadata-only mode uses less memory
- **Performance**: Faster processing for `llms.txt`-only generation

### AST Processing Efficiency

```typescript
const contentHtml = toHtml(content as HostHast.Nodes);
const processor = buildMarkdownProcessor(options);
const result = await processor.process(contentHtml);
```

**Optimizations:**
- **Selective Processing**: Only processes extracted content, not entire document
- **Reusable Processors**: Processor configuration is cached
- **Streaming**: Uses unified's streaming processing capabilities

## Configuration Integration

### Content Selector Configuration

```typescript
const contentSelectors = config.contentSelectors ? [...config.contentSelectors] : [];
```

**Features:**
- **User Customization**: Respects user-provided selectors
- **Default Fallbacks**: Uses plugin defaults when not specified
- **Array Copying**: Prevents mutation of original configuration

### Processing Options

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
```

**Configuration Mapping:**
- **Direct Mapping**: Most options map directly from plugin config
- **Computed Values**: Some options are computed based on context
- **Type Safety**: All options are type-checked at compile time

## Usage Examples

### Full HTML to Markdown Conversion

```typescript
const options: MarkdownConversionOptions = {
  remarkGfm: true,
  remarkStringify: { bullet: '-' },
  rehypeProcessTables: true,
  enableMarkdownFiles: true,
  excludePaths: ['/api/**']
};

const result = await processHtmlToMarkdown(
  htmlContent,
  options,
  ['.content', 'article', 'main']
);

console.log(result.title);       // "API Documentation"
console.log(result.description); // "Complete API reference"
console.log(result.content);     // "# API Documentation\n\n..."
```

### Metadata-Only Extraction

```typescript
const metadata = await extractHtmlMetadata(
  htmlContent,
  ['.content', 'article']
);

console.log(metadata.title);       // "API Documentation"
console.log(metadata.description); // "Complete API reference"
// No content property - much faster for indexing
```

### Custom Content Selectors

```typescript
const customSelectors = [
  '.documentation-content',
  '.api-reference',
  '.user-guide',
  'main .container'
];

const result = await processHtmlToMarkdown(
  htmlContent,
  options,
  customSelectors
);
```

### Error Handling

```typescript
try {
  const result = await processHtmlToMarkdown(html, options, selectors);
  return result;
} catch (error) {
  if (error instanceof PluginError && error.type === 'conversion') {
    console.warn('Conversion failed, using fallback');
    return { content: '', title: 'Untitled', description: '' };
  }
  throw error;
}
```

## Best Practices

### Content Selector Design

1. **Specificity**: Use specific selectors for your site structure
2. **Fallbacks**: Provide multiple selector options
3. **Testing**: Test selectors with representative content
4. **Documentation**: Document custom selectors for team members

### Performance Optimization

1. **Mode Selection**: Use metadata-only mode when possible
2. **Selector Efficiency**: Use efficient CSS selectors
3. **Content Size**: Consider content size when processing large documents
4. **Caching**: Leverage caching for repeated processing

### Error Handling

1. **Graceful Degradation**: Handle conversion failures gracefully
2. **Logging**: Log conversion issues for debugging
3. **Fallbacks**: Provide reasonable fallback values
4. **Context**: Preserve error context for troubleshooting

## Related Components

- **[HTML Processor](./html-processor.md)**: Coordinates HTML file processing
- **[Pipeline Builder](./pipeline-builder.md)**: Builds unified processors
- **[Title Extractors](../plugins/title-extractors.md)**: Provides title extraction strategies
- **[Plugin Registry](./plugin-registry.md)**: Manages unified plugins 