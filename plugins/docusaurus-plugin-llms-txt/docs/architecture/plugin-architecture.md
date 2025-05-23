# Plugin Architecture

## Overview

The `docusaurus-plugin-llms-txt` follows a **domain-focused, pipeline-driven architecture** designed for scalability, maintainability, and extensibility. This document explains the architectural decisions, design patterns, and principles that guide the plugin's implementation.

## Architectural Principles

### 1. Domain-Focused Organization

The codebase is organized around **business domains** rather than technical layers:

```
src/
├── pipeline/      # HTML processing workflow
│   ├── core/      # Main pipeline coordination
│   ├── html/      # HTML content extraction/processing
│   └── plugins/   # Unified processor plugins
├── filesystem/    # File operations and caching
├── types/         # Type definitions and schemas
├── config/        # Configuration processing
├── cli/           # Command-line interface
├── logging/       # Logging infrastructure
├── utils/         # Cross-cutting utilities
└── public/        # External API surface
```

**Benefits:**
- **Cognitive Load Reduction**: Related functionality is co-located
- **Team Scalability**: Different teams can own different domains
- **Change Isolation**: Changes in one domain rarely affect others
- **Mental Model Alignment**: Structure matches the actual workflow

### 2. Pipeline-Driven Processing

The core processing follows a **linear pipeline pattern**:

```
HTML Discovery → Content Processing → Tree Building → Output Generation
```

Each stage has:
- **Clear Input/Output Contracts**: Well-defined interfaces between stages
- **Single Responsibility**: Each stage handles one aspect of processing
- **Composability**: Stages can be recombined for different use cases
- **Testability**: Each stage can be tested in isolation

### 3. Streaming Architecture

Memory-efficient processing using **async generators**:

```typescript
async function* walkHtmlFiles(dir: string): AsyncGenerator<HtmlFileEntry> {
  // Yields files one by one instead of loading all into memory
}
```

**Benefits:**
- **Memory Efficiency**: Constant memory usage regardless of site size
- **Responsiveness**: Processing starts immediately
- **Scalability**: Handles sites with thousands of pages
- **Progress Reporting**: Real-time feedback to users

## Design Patterns

### 1. Factory Pattern

Used extensively for dependency injection and configuration:

```typescript
// Logger factory
export function createLogger(name: string, logLevel: LogLevel): Logger {
  return new PluginLogger(name, logLevel);
}

// Configuration factory
export function getConfig(options: Partial<PluginOptions>): RuntimeConfig {
  return pluginOptionsSchema.validate(options).value;
}
```

**Benefits:**
- **No Singletons**: Avoids global state and testing issues
- **Dependency Injection**: Easy to mock and test
- **Configuration**: Centralized creation logic
- **Type Safety**: Factory functions ensure correct initialization

### 2. Strategy Pattern

Multiple strategies for content extraction and processing:

```typescript
// Title extraction strategies
export const defaultTitleExtractors: readonly TitleExtractor[] = [
  extractHeaderH1,
  extractMainContentH1,
  extractPageH1,
  extractDocumentTitle
];

export function extractTitle(tree: HostHast.Root, extractors = defaultTitleExtractors): string {
  for (const extractor of extractors) {
    const title = extractor(tree);
    if (title) return title;
  }
  return 'Untitled Document';
}
```

**Benefits:**
- **Flexibility**: Easy to add new extraction strategies
- **Fallback Logic**: Graceful degradation when strategies fail
- **Customization**: Users can provide custom strategies
- **Testing**: Each strategy can be tested independently

### 3. Registry Pattern

Type-safe plugin management:

```typescript
interface BuiltInPluginEntry<TOptions> {
  readonly key: keyof MarkdownConversionOptions;
  readonly plugin: UnifiedPlugin<TOptions>;
  readonly stage: 'rehype' | 'remark';
  readonly optionsHandler?: (options: unknown) => TOptions | false;
}

export const allBuiltInPlugins: readonly BuiltInPluginEntry<unknown>[] = [
  // Plugin definitions
];
```

**Benefits:**
- **Type Safety**: Compile-time validation of plugin configurations
- **Centralized Management**: All plugins defined in one place
- **Stage Awareness**: Automatic application in correct order
- **Extensibility**: Easy to add new plugins

### 4. Builder Pattern

Complex object construction with fluent interfaces:

```typescript
export function buildMarkdownProcessor(opts: MarkdownConversionOptions): Processor {
  const proc = unified();
  proc.use(rehypeParse, { fragment: false });

  // Apply plugins in stages
  const rehypePlugins = getPluginsByStage('rehype');
  applyPluginsToProcessor(proc, rehypePlugins, opts);

  proc.use(rehypeRemark, { /* bridge config */ });

  const remarkPlugins = getPluginsByStage('remark');
  applyPluginsToProcessor(proc, remarkPlugins, opts);

  return proc;
}
```

**Benefits:**
- **Complex Configuration**: Handles intricate processor setup
- **Stage Management**: Ensures correct plugin application order
- **Reusability**: Same builder for different configurations
- **Validation**: Ensures all required components are present

### 5. Command Pattern

CLI operations encapsulated as commands:

```typescript
export function registerLlmsTxt(cli: CommanderStatic, pluginName: string, baseOptions: Partial<PluginOptions>, context: LoadContext): void {
  cli
    .command('llms-txt [siteDir]')
    .description('Generate llms.txt and/or Markdown files')
    .action(async (siteDirArg: string | undefined) => {
      await runConversion(siteDir, baseOptions, title, siteUrl);
    });
}
```

**Benefits:**
- **Encapsulation**: Each command is self-contained
- **Reusability**: Commands can be used programmatically
- **Testing**: Easy to test command logic
- **Consistency**: Uniform interface for all operations

## Error Handling Strategy

### 1. Typed Error System

Centralized error types with context:

```typescript
export type ErrorType = 'config' | 'file' | 'document' | 'conversion';

export class PluginError extends Error {
  constructor(
    public readonly type: ErrorType, 
    message: string, 
    public readonly filePath?: string, 
    public readonly cause?: Error
  ) {
    super(message);
  }
}
```

**Benefits:**
- **Error Classification**: Different handling for different error types
- **Context Preservation**: File paths and original errors maintained
- **Debugging**: Rich error information for troubleshooting
- **Recovery**: Enables appropriate recovery strategies

### 2. Graceful Degradation

Non-critical operations continue on failure:

```typescript
export function logAndContinue(
  logger: { warn: (msg: string) => void },
  message: string,
  error: unknown,
  filePath?: string
): void {
  const errorMsg = getErrorMessage(error);
  const context = filePath ? ` (${filePath})` : '';
  logger.warn(`${message}${context}: ${errorMsg}`);
}
```

**Benefits:**
- **Resilience**: Plugin continues working despite individual failures
- **User Experience**: Partial results better than complete failure
- **Debugging**: Errors are logged but don't stop processing
- **Production Stability**: Reduces impact of edge cases

### 3. Fail-Fast for Critical Errors

Critical operations throw immediately:

```typescript
export function throwTypedError(
  type: ErrorType,
  message: string,
  filePath?: string,
  cause?: unknown
): never {
  throw createError(type, message, filePath, cause);
}
```

**Benefits:**
- **Early Detection**: Problems caught as soon as possible
- **Clear Failures**: No ambiguous partial states
- **Debugging**: Stack traces point to actual problem
- **Reliability**: Prevents corrupted output

## Performance Architecture

### 1. Caching Strategy

Multi-level caching for optimal performance:

```typescript
interface CacheSchema {
  pluginVersion: string;    // Global invalidation
  configHash: string;       // Configuration changes
  files: Record<string, FileFingerprint>; // File-level caching
}
```

**Cache Levels:**
- **File Content**: MD5 hash of HTML content
- **Configuration**: Serialized plugin options
- **Plugin Version**: Automatic invalidation on updates
- **Generated Files**: Existence checking for incremental builds

### 2. Streaming Processing

Constant memory usage regardless of site size:

```typescript
async function* processHtmlFilesStream(
  htmlFiles: AsyncIterable<HtmlFileEntry>,
  // ... other params
): AsyncGenerator<DocInfo> {
  for await (const file of htmlFiles) {
    yield await processHtmlFile(file);
  }
}
```

**Benefits:**
- **Memory Efficiency**: O(1) memory usage
- **Responsiveness**: Immediate processing start
- **Scalability**: Handles unlimited file counts
- **Interruptibility**: Can be cancelled mid-stream

### 3. Lazy Evaluation

Processing only when needed:

```typescript
// Only process files when markdown generation is enabled
if (config.enableMarkdownFiles) {
  const result = await processHtmlToMarkdown(html, options, selectors);
} else {
  const result = await extractHtmlMetadata(html, selectors);
}
```

**Benefits:**
- **Performance**: Skips unnecessary work
- **Resource Usage**: Reduces CPU and memory consumption
- **Flexibility**: Different processing modes for different needs

## Type System Architecture

### 1. Interface Segregation

Small, focused interfaces:

```typescript
interface Logger {
  error: (msg: string) => void;
  warn: (msg: string) => void;
  info: (msg: string) => void;
  debug: (msg: string) => void;
}

interface HtmlFileEntry {
  readonly relPath: string;
}

interface DocInfo {
  readonly routePath: string;
  readonly htmlPath: string;
  readonly title: string;
  readonly description: string;
}
```

**Benefits:**
- **Focused Contracts**: Each interface has single responsibility
- **Easy Testing**: Simple to mock and implement
- **Composition**: Interfaces can be combined as needed
- **Evolution**: Easy to extend without breaking changes

### 2. Readonly by Default

Immutable data structures:

```typescript
interface PluginOptions {
  readonly enableMarkdownFiles?: boolean;  // Generate individual .md files
  readonly siteTitle?: string;             // Custom title for llms.txt
  readonly enableCache?: boolean;          // Enable caching for performance
  // ... other options (llms.txt always generated)
}
```

**Benefits:**
- **Immutability**: Prevents accidental mutations
- **Thread Safety**: Safe for concurrent access
- **Debugging**: Easier to reason about data flow
- **Performance**: Enables optimization opportunities

### 3. Branded Types

Type safety for similar primitives:

```typescript
type ErrorType = 'config' | 'file' | 'document' | 'conversion';
type LogLevel = 0 | 1 | 2 | 3;
type Depth = 1 | 2 | 3 | 4 | 5;
```

**Benefits:**
- **Type Safety**: Prevents mixing up similar values
- **Documentation**: Types serve as documentation
- **Validation**: Compile-time checking of valid values
- **Refactoring**: Easy to find all usages

## Extensibility Architecture

### 1. Plugin System

Unified plugins for content transformation:

```typescript
export default function customPlugin(options: CustomOptions = {}) {
  return function transformer(tree: Root): Root {
    // Custom transformation logic
    return tree;
  };
}
```

**Extension Points:**
- **Rehype Plugins**: HTML AST transformation
- **Remark Plugins**: Markdown AST transformation
- **Title Extractors**: Custom title extraction strategies
- **Content Selectors**: Custom content area identification

### 2. Configuration Schema

Joi-based validation with extensibility:

```typescript
export const pluginOptionsSchema = Joi.object({
  // Core options
  enableMarkdownFiles: Joi.boolean().default(true),
  // ... other options (llms.txt always generated)
}).unknown(false); // Strict validation
```

**Benefits:**
- **Validation**: Runtime validation of configuration
- **Documentation**: Schema serves as documentation
- **Defaults**: Automatic default value application
- **Evolution**: Easy to add new options

### 3. Hook System

Lifecycle hooks for customization:

```typescript
// Future extension point
interface PluginHooks {
  beforeProcessing?: (files: HtmlFileEntry[]) => Promise<void>;
  afterProcessing?: (docs: DocInfo[]) => Promise<void>;
  beforeTreeBuilding?: (docs: DocInfo[]) => Promise<DocInfo[]>;
  afterTreeBuilding?: (tree: TreeNode) => Promise<TreeNode>;
}
```

## Testing Architecture

### 1. Dependency Injection

All dependencies injected for easy testing:

```typescript
export async function processHtmlFile(
  relHtmlPath: string,
  docsDir: string,
  mdOutDir: string,
  config: PluginOptions,
  logger: Logger = noopLogger,  // Injectable dependency
  baseUrl: string = '',
): Promise<DocInfo>
```

### 2. Factory Functions

No singletons, everything created via factories:

```typescript
// Easy to mock in tests
const mockLogger = createLogger('test', LogLevel.DEBUG);
const mockConfig = getConfig({ enableMarkdownFiles: false });
```

### 3. Pure Functions

Most functions are pure for easy testing:

```typescript
// Pure function - easy to test
export function generateRoutePath(
  relHtmlPath: string, 
  enableMarkdownFiles: boolean, 
  logger?: Logger
): string
```

## Security Considerations

### 1. Path Traversal Prevention

Safe path handling throughout:

```typescript
// Uses path.join and validation
const absHtmlPath = path.join(docsDir, relHtmlPath);

// Validates generated paths
if (!isValidPathname(pathToValidate)) {
  log.warn(`Generated invalid pathname: ${pathToValidate}`);
  return '/';
}
```

### 2. Input Validation

All inputs validated at boundaries:

```typescript
// Joi schema validation
const validated = pluginOptionsSchema.validate(options).value;

// Runtime type checking
if (typeof options === 'object' && options !== null) {
  return options as RehypeLinksOptions;
}
```

### 3. Safe File Operations

Atomic operations prevent corruption:

```typescript
export async function writeJsonAtomic(filePath: string, data: unknown): Promise<void> {
  const tmp = path.join(dir, `.${path.basename(filePath)}.tmp-${Date.now()}`);
  await fs.writeFile(tmp, JSON.stringify(data, null, 2), 'utf8');
  await fs.rename(tmp, filePath);
}
```

## Future Architecture Considerations

### 1. Microservice Decomposition

Potential service boundaries:
- **Content Extraction Service**: HTML parsing and content extraction
- **Link Processing Service**: URL transformation and validation
- **Tree Building Service**: Document hierarchy construction
- **Cache Service**: Distributed caching for large sites

### 2. Event-Driven Architecture

Potential event system:
- **File Discovered**: New HTML file found
- **File Processed**: HTML file converted to DocInfo
- **Tree Built**: Document hierarchy constructed
- **Output Generated**: Final files written

### 3. Plugin Marketplace

Extensibility improvements:
- **Plugin Registry**: Central registry of community plugins
- **Plugin API**: Standardized plugin development API
- **Plugin Validation**: Automated testing and validation
- **Plugin Documentation**: Automated documentation generation

## Related Documentation

- **[Processing Pipeline](./processing-pipeline.md)**: Detailed pipeline flow
- **[Caching Strategy](./caching-strategy.md)**: Cache implementation details
- **[Error Handling Strategy](./error-handling.md)**: Error management approach
- **[Plugin Registry](../pipeline/plugin-registry.md)**: Plugin system implementation 