# Contributing to docusaurus-plugin-llms-txt

This document explains the internal architecture, development guidelines, and contribution process for the docusaurus-plugin-llms-txt plugin.

## Table of Contents

- [Architecture Overview](#architecture-overview)
- [Project Structure](#project-structure)
- [Core Concepts](#core-concepts)
- [Development Setup](#development-setup)
- [Code Style & Guidelines](#code-style--guidelines)
- [Testing](#testing)
- [Debugging](#debugging)
- [Common Development Tasks](#common-development-tasks)
- [Plugin Lifecycle](#plugin-lifecycle)
- [Performance Considerations](#performance-considerations)

## Architecture Overview

The plugin follows a **domain-focused pipeline architecture** that processes HTML files through several stages:

```
HTML Files → Discovery → Processing → Tree Building → Output Generation
     ↓             ↓           ↓            ↓              ↓
   Walk FS    →  Convert   →  Organize  →  Render    →  Write Files
```

### Core Pipeline Stages

1. **Discovery** (`fs/io/read.ts`): Find all HTML files using glob patterns
2. **Processing** (`pipeline/html-processor.ts`): Convert individual HTML files to metadata and/or Markdown
3. **Organization** (`pipeline/tree-builder.ts`): Build hierarchical document tree
4. **Rendering** (`pipeline/markdown-renderer.ts`): Generate final llms.txt content
5. **Output** (`fs/io/write.ts`): Write files to disk

## Project Structure

```
src/
├── index.ts                     # Main plugin entry point
├── constants.ts                 # Centralized constants
│
├── pipeline/                    # 🚀 Core Processing Pipeline
│   ├── orchestrator.ts          # Main workflow coordination
│   ├── html-processor.ts        # Single file processing
│   ├── html-converter.ts        # HTML to Markdown conversion
│   ├── pipeline-builder.ts      # Unified processor setup
│   ├── tree-builder.ts          # Document tree building
│   ├── markdown-renderer.ts     # Tree to Markdown rendering
│   ├── title-extractors.ts      # Title extraction strategies
│   ├── plugin-registry.ts       # Type-safe plugin registry
│   ├── plugins.ts               # Plugin configurations
│   ├── rehype-tables.ts         # Custom rehype plugin for tables
│   └── rehype-links.ts          # Link transformation plugin
│
├── filesystem/                  # 📁 File System Operations
│   ├── io/                      # Input/Output operations
│   │   ├── read.ts              # Directory traversal & reading
│   │   ├── write.ts             # File writing operations
│   │   └── atomic.ts            # Atomic JSON operations
│   ├── cache/                   # Cache management
│   │   ├── manager.ts           # Cache CRUD operations
│   │   └── cleaner.ts           # Cleanup operations
│   └── path.ts                  # Path utilities & transformations
│
├── cli/                         # 🔧 Command Line Interface
│   └── command.ts               # CLI commands (generate + cleanup)
│
├── config/                      # ⚙️ Configuration Processing
│   └── options.ts               # Plugin options validation & processing
│
├── logging/                     # 📝 Logging System
│   └── logger.ts                # Factory-based logger (no singletons)
│
├── types/                       # 🏷️ TypeScript Definitions
│   ├── index.ts                 # Central type exports
│   ├── fs.ts                    # File system types
│   ├── logging.ts               # Logging interfaces
│   ├── plugin.ts                # Core plugin types & schemas
│   └── unified.ts               # Unified processor types
│
├── utils/                       # 🛠️ Utility Functions
│   ├── errors.ts                # Typed error handling system
│   ├── url.ts                   # URL formatting utilities
│   └── conversion.ts            # Shared conversion logic
│
└── public/                      # 🌐 Public API
    └── index.ts                 # Exported types and functions
```

### Domain-Focused Design

The structure aligns with the actual workflow:
- **pipeline/**: The core HTML→Markdown→Tree→Output workflow
- **filesystem/**: All file operations (read, write, cache)
- **config/**: Configuration processing and validation
- **types/**: Comprehensive TypeScript definitions

## Core Concepts

### 1. Streaming Processing

The plugin uses async generators for memory-efficient processing:

```typescript
// Generator pattern for large file sets
async function* walkHtmlFiles(dir: string, baseDir: string): AsyncGenerator<HtmlFileEntry> {
  // Yields files one by one instead of loading all into memory
  for (const filePath of htmlFiles) {
    yield { relPath: posixRelPath };
  }
}
```

### 2. Caching System

Built-in caching prevents unnecessary reprocessing:

```typescript
interface CacheSchema {
  pluginVersion: string;    // Cache invalidation on version change
  configHash: string;       // Cache invalidation on config change
  files: Record<string, FileFingerprint>; // File hash + metadata
}
```

Cache keys:
- **File hash**: MD5 of file content
- **Config hash**: Serialized plugin options
- **Plugin version**: From package.json

### 3. Type-Safe Plugin Registry

Unified processors are managed through a type-safe registry:

```typescript
interface BuiltInPluginEntry<TOptions> {
  key: keyof MarkdownConversionOptions;
  plugin: UnifiedPlugin<TOptions>;
  stage: 'rehype' | 'remark';
  optionsHandler?: (options: unknown) => TOptions | false;
}
```

### 4. Error Handling Strategy

Centralized error types with graceful degradation:

```typescript
// Typed errors for different failure modes
type ErrorType = 'config' | 'file' | 'document' | 'conversion';

// Two strategies:
logAndContinue(logger, 'Non-critical error', error); // Continue processing
throwTypedError('file', 'Critical error', filePath);  // Stop processing
```

### 5. Factory Pattern for Dependencies

No singletons - everything uses factory functions:

```typescript
// Logger factory
export function createLogger(name: string, logLevel: LogLevel): Logger {
  return new PluginLogger(name, logLevel);
}

// Usage in modules
const log = logger || createLogger('plugin-name');
```

## Development Setup

### Prerequisites

- Node.js 18+
- npm or yarn
- TypeScript knowledge

### Setup

```bash
# Clone and navigate to plugin directory
cd plugins/docusaurus-plugin-llms-txt

# Install dependencies
npm install

# Build the plugin
npm run build

# Run linting
npm run lint

# Watch mode for development
npm run watch
```

### Testing in a Docusaurus Site

1. Build the plugin: `npm run build`
2. In your test Docusaurus site, add to `package.json`:
   ```json
   {
     "dependencies": {
       "docusaurus-plugin-llms-txt": "file:../path/to/plugin"
     }
   }
   ```
3. Install: `npm install`
4. Configure in `docusaurus.config.js`
5. Test: `npm run build`

## Code Style & Guidelines

### TypeScript Best Practices

- **Strict mode enabled**: All TypeScript strict checks are on
- **Explicit return types**: For public functions
- **Readonly interfaces**: Use `readonly` for configuration objects
- **Avoid `any`**: Use `unknown` and type guards instead

```typescript
// ✅ Good
interface PluginOptions {
  readonly enableCache?: boolean;
  readonly excludePaths?: readonly string[];
}

export function processFile(path: string): Promise<DocInfo> {
  // ...
}

// ❌ Avoid
interface PluginOptions {
  enableCache?: boolean;
  excludePaths?: string[];
}

export function processFile(path: string) { // Missing return type
  // ...
}
```

### Error Handling

Use the centralized error system:

```typescript
import { createFileError, logAndContinue } from '../utils/errors';

// For critical errors
if (!fs.existsSync(filePath)) {
  throw createFileError('File not found', filePath);
}

// For non-critical errors
try {
  await processOptionalFeature();
} catch (error) {
  logAndContinue(logger, 'Optional feature failed', error);
}
```

### Logging

Use the factory-based logger:

```typescript
import { createLogger } from '../logging/logger';

function myFunction(logger?: Logger): void {
  const log = logger || createLogger('my-module');
  
  log.debug('Detailed processing info');
  log.info('User-facing information');
  log.warn('Potential issues');
  log.error('Errors that occurred');
}
```

### File Organization

- **Single responsibility**: Each file has one clear purpose
- **Barrel exports**: Use `index.ts` files for clean imports
- **Domain grouping**: Related functionality in same directory
- **Interface segregation**: Small, focused interfaces

## Testing

### Manual Testing

Create test scenarios:

```javascript
// Test different configurations
const testConfigs = [
  { enableMarkdownFiles: true },  // llms.txt always generated
  { enableMarkdownFiles: false }, // llms.txt only
  { depth: 3, excludePaths: ['/blog/**'] },
  { pathRules: [{ path: '/api/**', depth: 2 }] }
];
```

### Test Cases to Cover

1. **Basic functionality**: Default configuration works
2. **Edge cases**: Empty sites, no HTML files, malformed HTML
3. **Performance**: Large sites (1000+ pages)
4. **Caching**: Cache invalidation and reuse
5. **Error handling**: Invalid configurations, missing files
6. **CLI commands**: Both generate and clean operations

## Debugging

### Debug Logging

Enable debug logging:

```javascript
{
  logLevel: 3, // LogLevel.DEBUG
}
```

### Common Debug Techniques

1. **Cache inspection**: Check `.docusaurus/.llms-txt/cache.json`
2. **Path tracing**: Log route generation in `generateRoutePath`
3. **Content extraction**: Verify CSS selectors match your HTML
4. **Plugin stages**: Add logging to each pipeline stage

### Debug CLI

Use CLI for isolated testing:

```bash
# Run with debug logging (modify config temporarily)
npx docusaurus llms-txt

# Clean cache and regenerate
npx docusaurus llms-txt-clean
npx docusaurus llms-txt
```

## Common Development Tasks

### Adding a New Configuration Option

1. **Update types** (`src/types/plugin.ts`):
   ```typescript
   export interface PluginOptions {
     readonly myNewOption?: boolean;
   }
   ```

2. **Update Joi schema** (`src/types/plugin.ts`):
   ```typescript
   export const pluginOptionsSchema = Joi.object({
     myNewOption: Joi.boolean().default(false),
     // ... other options
   });
   ```

3. **Use in processing** (`src/pipeline/html-processor.ts`):
   ```typescript
   if (config.myNewOption) {
     // New behavior
   }
   ```

4. **Update documentation** (README.md)

### Adding a New Unified Plugin

1. **Create plugin file** (`src/pipeline/my-plugin.ts`):
   ```typescript
   export default function myPlugin(options = {}) {
     return function transformer(tree) {
       // Transform the AST
       return tree;
     };
   }
   ```

2. **Register plugin** (`src/pipeline/plugin-registry.ts`):
   ```typescript
   const builtInPlugins = [
     {
       key: 'myPlugin',
       plugin: myPlugin,
       stage: 'rehype',
       optionsHandler: (options) => options as MyPluginOptions,
     }
   ];
   ```

3. **Add to configuration types** (`src/types/plugin.ts`)

### Modifying the Tree Structure

The document tree is built in `src/pipeline/tree-builder.ts`. Key concepts:

- **Depth**: Controls categorization level
- **Path rules**: Override behavior for specific paths
- **Index documents**: Special handling for index pages

### Adding a New Title Extraction Strategy

1. **Create extractor** (`src/pipeline/title-extractors.ts`):
   ```typescript
   export const extractMyCustomTitle: TitleExtractor = (tree: HostHast.Root): string | null => {
     const element = select('.my-title-selector', tree);
     return element ? toString(element).trim() : null;
   };
   ```

2. **Add to strategy chain**:
   ```typescript
   export const defaultTitleExtractors = [
     extractHeaderH1,
     extractMyCustomTitle, // Add here
     extractPageH1,
     extractDocumentTitle
   ];
   ```

## Plugin Lifecycle

### Docusaurus Integration

1. **Plugin Registration**: Docusaurus loads the plugin
2. **Option Validation**: `validateOptions()` validates configuration
3. **Build Process**: `postBuild()` runs after HTML generation
4. **CLI Extension**: `extendCli()` adds commands

### Processing Lifecycle

1. **Initialization**: Load cache, setup configuration
2. **Discovery**: Find HTML files using `walkHtmlFiles`
3. **Processing**: Stream through `processHtmlFilesStream`
4. **Tree Building**: Organize documents with `buildTree`
5. **Rendering**: Generate output with `renderTreeMarkdown`
6. **Cleanup**: Save cache, write files

### Cache Lifecycle

1. **Load**: Read existing cache or create empty
2. **Validate**: Check plugin version and config hash
3. **Update**: Process changed files only
4. **Save**: Write updated cache to disk

## Performance Considerations

### Memory Management

- **Streaming**: Process files one at a time
- **Async generators**: Don't load all files into memory
- **Cache cleanup**: Remove stale entries

### Build Performance

- **Caching**: Skip unchanged files
- **Exclusions**: Use `excludePaths` for unnecessary content
- **Selective processing**: Disable features you don't need

### Optimization Tips

1. **Profile first**: Use Node.js profiler to identify bottlenecks
2. **Cache effectively**: Ensure cache keys are stable
3. **Minimize work**: Skip processing when possible
4. **Parallel processing**: Use `Promise.all()` for independent operations

## Contributing Guidelines

### Pull Request Process

1. **Fork** the repository
2. **Create feature branch**: `git checkout -b feature/my-feature`
3. **Follow code style**: Use existing patterns
4. **Add tests**: Ensure your changes work
5. **Update docs**: Modify README.md if needed
6. **Submit PR**: With clear description

### Code Review Checklist

- [ ] Follows TypeScript best practices
- [ ] Uses centralized logging and error handling
- [ ] Maintains backward compatibility
- [ ] Includes appropriate documentation
- [ ] Handles edge cases gracefully
- [ ] No performance regressions

### Release Process

1. Update version in `package.json`
2. Update CHANGELOG.md
3. Build and test: `npm run build && npm run lint`
4. Tag release: `git tag v1.0.0`
5. Publish: `npm publish`

## Questions & Support

- **Architecture questions**: Open an issue for clarification
- **Bug reports**: Include reproduction steps and configuration
- **Feature requests**: Describe use case and proposed API
- **Performance issues**: Include profiling data if possible

Thank you for contributing to docusaurus-plugin-llms-txt! 