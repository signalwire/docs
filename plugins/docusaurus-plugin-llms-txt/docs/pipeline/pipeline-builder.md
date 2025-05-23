# Pipeline Builder

## Overview

The Pipeline Builder (`src/pipeline/core/pipeline-builder.ts`) is responsible for constructing unified processors that convert HTML to Markdown. It orchestrates the complex process of building a processing pipeline with the correct plugins, configurations, and processing stages.

## Core Responsibility

The pipeline builder creates a **unified processor** that transforms HTML content through multiple stages:

1. **HTML Parsing** → Parse HTML string to AST
2. **Rehype Processing** → Apply HTML-focused plugins
3. **HTML-to-Markdown Bridge** → Convert HTML AST to Markdown AST
4. **Remark Processing** → Apply Markdown-focused plugins
5. **Markdown Generation** → Convert final AST to Markdown string

## Main Function

### `buildMarkdownProcessor()`

The primary function that constructs a complete HTML-to-Markdown processor:

```typescript
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
```

## Processing Stages

### Stage 1: HTML Parsing

```typescript
const proc = unified();
proc.use(rehypeParse, { fragment: false });
```

**Configuration:**
- **`fragment: false`**: Parses complete HTML documents (not fragments)
- **Full Document**: Includes `<html>`, `<head>`, `<body>` elements
- **Robust Parsing**: Handles malformed HTML gracefully

**Purpose:**
- Converts HTML string to rehype AST (HTML Abstract Syntax Tree)
- Provides foundation for all subsequent processing
- Ensures consistent AST structure for plugins

### Stage 2: Rehype Plugin Application

```typescript
const rehypePlugins = getPluginsByStage('rehype');
applyPluginsToProcessor(proc, rehypePlugins, opts);
```

**Rehype Plugins Applied:**
- **`rehype-tables`**: Flattens lists in table cells for Markdown compatibility
- **`rehype-links`**: Transforms internal links based on configuration

**Processing Focus:**
- **HTML-Specific**: Operates on HTML AST structure
- **Content Preparation**: Prepares content for Markdown conversion
- **Link Processing**: Handles URL transformations and exclusions

### Stage 3: HTML-to-Markdown Bridge

```typescript
proc.use(rehypeRemark, {
  handlers: { br: () => ({ type: 'html', value: '<br />' }) },
});
```

**Bridge Configuration:**
- **Custom BR Handler**: Preserves `<br />` tags as HTML in Markdown
- **AST Conversion**: Transforms rehype AST to remark AST
- **Content Preservation**: Maintains content structure during conversion

**Why Custom BR Handler:**
- **Line Break Preservation**: Ensures line breaks are maintained in output
- **Markdown Compatibility**: `<br />` is valid HTML in Markdown
- **Table Support**: Critical for table content with line breaks

### Stage 4: Remark Plugin Application

```typescript
const remarkPlugins = getPluginsByStage('remark');
applyPluginsToProcessor(proc, remarkPlugins, opts);
```

**Remark Plugins Applied:**
- **`remark-gfm`**: Adds GitHub Flavored Markdown support
- **`remark-stringify`**: Converts final AST to Markdown string

**Processing Focus:**
- **Markdown-Specific**: Operates on Markdown AST structure
- **Output Formatting**: Controls final Markdown formatting
- **Feature Enhancement**: Adds advanced Markdown features

## Configuration Integration

### Options Processing

```typescript
export function buildMarkdownProcessor(opts: MarkdownConversionOptions): Processor
```

**Configuration Options:**
```typescript
interface MarkdownConversionOptions {
  remarkStringify?: Readonly<RemarkStringifyOptions>;
  remarkGfm?: boolean | Readonly<RemarkGfmOptions>;
  rehypeProcessTables?: boolean;
  rehypeProcessLinks?: boolean;
  baseUrl?: string;
  relativePaths?: boolean;
  enableMarkdownFiles?: boolean;
  excludePaths?: readonly string[];
  logger?: Logger;
}
```

### Plugin Configuration Flow

```typescript
// Configuration flows through plugin registry
applyPluginsToProcessor(proc, rehypePlugins, opts);
applyPluginsToProcessor(proc, remarkPlugins, opts);
```

**Flow Process:**
1. **Options Passed**: Configuration options passed to plugin registry
2. **Plugin Filtering**: Registry filters plugins by stage
3. **Options Mapping**: Each plugin receives relevant configuration
4. **Type Safety**: Options are validated and type-checked

## Plugin Integration

### Plugin Registry Integration

```typescript
const rehypePlugins = getPluginsByStage('rehype');
const remarkPlugins = getPluginsByStage('remark');
```

**Benefits:**
- **Centralized Management**: All plugins managed through registry
- **Stage Separation**: Clear separation between HTML and Markdown processing
- **Type Safety**: Compile-time validation of plugin configurations
- **Extensibility**: Easy to add new plugins to the pipeline

### Plugin Application

```typescript
applyPluginsToProcessor(proc, rehypePlugins, opts);
```

**Features:**
- **Conditional Application**: Plugins can be enabled/disabled via configuration
- **Options Handling**: Each plugin receives appropriate configuration
- **Error Handling**: Plugin application errors are handled gracefully
- **Order Management**: Plugins applied in correct order

## Advanced Configuration

### Custom BR Handling

```typescript
proc.use(rehypeRemark, {
  handlers: { br: () => ({ type: 'html', value: '<br />' }) },
});
```

**Rationale:**
- **Default Behavior**: rehype-remark normally converts `<br>` to line breaks
- **Table Compatibility**: Line breaks in tables need to be preserved as HTML
- **Markdown Validity**: `<br />` is valid HTML within Markdown
- **Content Fidelity**: Maintains original formatting intent

### Plugin Ordering

```typescript
// Order matters: rehype plugins before bridge, remark plugins after
const proc = unified();
proc.use(rehypeParse);           // 1. Parse HTML
// rehype plugins applied here    // 2. Process HTML AST
proc.use(rehypeRemark);          // 3. Convert to Markdown AST
// remark plugins applied here    // 4. Process Markdown AST
```

**Critical Ordering:**
- **Rehype First**: HTML processing must happen before conversion
- **Bridge Middle**: Conversion happens between HTML and Markdown processing
- **Remark Last**: Markdown processing happens after conversion

## Error Handling

### Processor Creation

```typescript
export function buildMarkdownProcessor(opts: MarkdownConversionOptions): Processor {
  try {
    const proc = unified();
    // ... processor building
    return proc;
  } catch (error) {
    // Error handling would be implemented here
    throw error;
  }
}
```

**Error Sources:**
- **Plugin Loading**: Plugins may fail to load or initialize
- **Configuration Errors**: Invalid plugin configurations
- **Dependency Issues**: Missing required dependencies

### Plugin Application Errors

```typescript
// Plugin registry handles individual plugin errors
applyPluginsToProcessor(proc, rehypePlugins, opts);
```

**Error Strategy:**
- **Individual Plugin Errors**: Handled by plugin registry
- **Graceful Degradation**: Failed plugins don't break entire pipeline
- **Error Logging**: Plugin errors are logged for debugging

## Performance Considerations

### Processor Reuse

```typescript
// Processors can be reused for multiple documents
const processor = buildMarkdownProcessor(options);

// Process multiple documents with same processor
const result1 = await processor.process(html1);
const result2 = await processor.process(html2);
```

**Benefits:**
- **Setup Cost**: Processor creation is expensive, reuse amortizes cost
- **Plugin Initialization**: Plugins are initialized once per processor
- **Memory Efficiency**: Shared processor state reduces memory usage

### Plugin Optimization

```typescript
// Plugins are only applied if enabled
if (opts.rehypeProcessTables !== false) {
  // Apply table processing plugin
}
```

**Optimizations:**
- **Conditional Application**: Disabled plugins are not added to pipeline
- **Minimal Processing**: Only necessary plugins are included
- **Configuration Caching**: Plugin configurations are processed once

## Usage Examples

### Basic Processor Creation

```typescript
const options: MarkdownConversionOptions = {
  remarkGfm: true,
  remarkStringify: { bullet: '-' },
  rehypeProcessTables: true,
  rehypeProcessLinks: true,
};

const processor = buildMarkdownProcessor(options);
```

### Processing HTML Content

```typescript
const processor = buildMarkdownProcessor(options);

const html = `
<html>
  <body>
    <h1>Title</h1>
    <p>Content with <strong>bold</strong> text.</p>
  </body>
</html>
`;

const result = await processor.process(html);
const markdown = String(result);
console.log(markdown); // "# Title\n\nContent with **bold** text.\n"
```

### Custom Configuration

```typescript
const options: MarkdownConversionOptions = {
  remarkGfm: {
    singleTilde: false,
    tableCellPadding: true,
  },
  remarkStringify: {
    bullet: '*',
    emphasis: '_',
    strong: '*',
  },
  rehypeProcessTables: false, // Disable table processing
  baseUrl: 'https://example.com',
  excludePaths: ['/internal/**'],
};

const processor = buildMarkdownProcessor(options);
```

### Error Handling

```typescript
try {
  const processor = buildMarkdownProcessor(options);
  const result = await processor.process(html);
  return String(result);
} catch (error) {
  console.error('Processing failed:', error.message);
  throw error;
}
```

## Integration Points

### With HTML Converter

```typescript
// HTML converter uses pipeline builder
const processor = buildMarkdownProcessor(options);
const result = await processor.process(contentHtml);
const markdown = String(result);
```

### With Plugin Registry

```typescript
// Pipeline builder delegates to plugin registry
const rehypePlugins = getPluginsByStage('rehype');
applyPluginsToProcessor(proc, rehypePlugins, opts);
```

### With Configuration System

```typescript
// Configuration flows from plugin options to processor
const conversionOptions: MarkdownConversionOptions = {
  remarkStringify: config.remarkStringify,
  remarkGfm: config.remarkGfm,
  // ... other options
};

const processor = buildMarkdownProcessor(conversionOptions);
```

## Best Practices

### Processor Management

1. **Reuse Processors**: Create once, use multiple times for same configuration
2. **Configuration Stability**: Use stable configurations to enable processor reuse
3. **Error Handling**: Always wrap processor creation and usage in try-catch
4. **Memory Management**: Don't create unnecessary processors

### Configuration

1. **Minimal Options**: Only specify options that differ from defaults
2. **Type Safety**: Use TypeScript interfaces for configuration validation
3. **Documentation**: Document custom configurations and their effects
4. **Testing**: Test processor with representative HTML content

### Performance

1. **Plugin Selection**: Only enable plugins you actually need
2. **Configuration Caching**: Cache processor configurations when possible
3. **Batch Processing**: Process multiple documents with same processor
4. **Memory Monitoring**: Monitor memory usage with large document sets

## Related Components

- **[Plugin Registry](./plugin-registry.md)**: Provides plugins and manages their application
- **[HTML Converter](./html-converter.md)**: Uses pipeline builder to create processors
- **[Rehype Links](../plugins/rehype-links.md)**: Rehype plugin applied by pipeline
- **[Rehype Tables](../plugins/rehype-tables.md)**: Rehype plugin applied by pipeline 