# docusaurus-plugin-llms-txt Documentation

## Overview

The `docusaurus-plugin-llms-txt` is a sophisticated Docusaurus plugin that converts HTML documentation into Markdown format and generates an `llms.txt` index file optimized for Large Language Model consumption. This documentation provides a comprehensive understanding of the plugin's architecture, core concepts, and implementation details.

## 🏗️ Architecture Overview

The plugin follows a **domain-focused pipeline architecture** that processes HTML files through several well-defined stages:

```
HTML Files → Discovery → Processing → Tree Building → Output Generation
     ↓             ↓           ↓            ↓              ↓
   Walk FS    →  Convert   →  Organize  →  Render    →  Write Files
```

### Core Pipeline Flow

1. **File Discovery** (`filesystem/io/read.ts`)
   - Recursively finds all HTML files in the build directory
   - Uses async generators for memory-efficient streaming
   - Applies initial path filtering

2. **HTML Processing** (`pipeline/html-processor.ts`)
   - Processes individual HTML files
   - Extracts metadata (title, description)
   - Converts HTML to Markdown using unified processors

3. **Content Conversion** (`pipeline/html-converter.ts`)
   - Transforms HTML AST to Markdown AST
   - Applies content extraction strategies
   - Handles link transformations and exclusions

4. **Tree Organization** (`pipeline/tree-builder.ts`)
   - Builds hierarchical document structure
   - Applies categorization rules based on URL paths
   - Handles index documents and subcategories

5. **Output Generation** (`pipeline/markdown-renderer.ts`)
   - Renders the document tree as structured Markdown
   - Generates the final `llms.txt` content
   - Applies formatting and styling rules

## 📁 Directory Structure

```
src/
├── pipeline/           # 🚀 Core Processing Pipeline
│   ├── core/           # Main pipeline coordination
│   │   ├── orchestrator.ts      # Main workflow coordination
│   │   ├── pipeline-builder.ts  # Unified processor setup
│   │   ├── tree-builder.ts      # Document tree building
│   │   └── markdown-renderer.ts # Tree to Markdown rendering
│   │
│   ├── html/           # HTML processing components
│   │   ├── html-processor.ts    # HTML file processing
│   │   ├── html-converter.ts    # HTML to Markdown conversion
│   │   └── title-extractors.ts  # Title extraction strategies
│   │
│   └── plugins/        # Unified processor plugins
│       ├── plugin-registry.ts   # Type-safe plugin registry
│       ├── rehype-links.ts      # Link transformation plugin
│       └── rehype-tables.ts     # Table processing plugin
│
├── filesystem/         # 📁 File System Operations  
├── types/             # 🏷️ TypeScript Definitions
├── config/            # ⚙️ Configuration Processing
├── cli/               # 🔧 Command Line Interface
├── logging/           # 📝 Logging System
├── utils/             # 🛠️ Utility Functions
└── public/            # 🌐 Public API
```

## 🔧 Core Concepts

### 1. Unified Processing Pipeline

The plugin leverages the [unified](https://unifiedjs.com/) ecosystem for robust HTML-to-Markdown conversion:

- **rehype** plugins process HTML AST (Abstract Syntax Tree)
- **remark** plugins process Markdown AST
- Custom plugins handle domain-specific transformations

### 2. Streaming Architecture

Memory-efficient processing using async generators:
- Files are processed one at a time
- Large document sets don't overwhelm memory
- Enables real-time progress reporting

### 3. Caching System

Intelligent caching prevents unnecessary reprocessing:
- File content hashing for change detection
- Configuration-aware cache invalidation
- Atomic cache operations for reliability

### 4. Type-Safe Plugin Registry

Centralized plugin management with full TypeScript support:
- Compile-time plugin configuration validation
- Stage-aware plugin application (rehype vs remark)
- Extensible plugin architecture

### 5. Hierarchical Document Organization

Smart document tree building:
- Configurable categorization depth
- Path-based rule application
- Index document handling

## 📚 Component Documentation

### Pipeline Components
- [**Core Pipeline**](./pipeline/core.md)
  - [**Orchestrator**](./pipeline/orchestrator.md) - Coordinates overall processing
  - [**Pipeline Builder**](./pipeline/pipeline-builder.md) - Unified processor configuration
  - [**Tree Builder**](./pipeline/tree-builder.md) - Document hierarchy construction
  - [**Markdown Renderer**](./pipeline/markdown-renderer.md) - Output generation

### HTML Processing
- [**HTML Processor**](./pipeline/html-processor.md) - HTML file processing
- [**HTML Converter**](./pipeline/html-converter.md) - HTML to Markdown conversion
- [**Title Extractors**](./pipeline/title-extractors.md) - Title extraction strategies

### Plugin System
- [**Plugin Registry**](./pipeline/plugin-registry.md) - Type-safe plugin management
- [**Rehype Links**](./plugins/rehype-links.md) - Link transformation
- [**Rehype Tables**](./plugins/rehype-tables.md) - Table processing

### File System Operations
- [**File I/O**](./filesystem/io.md) - Reading and writing operations
- [**Cache Management**](./filesystem/cache.md) - Caching system implementation
- [**Path Utilities**](./filesystem/path.md) - Path transformation and routing

### Configuration & Types
- [**Plugin Options**](./config/plugin-options.md) - Configuration schema and validation
- [**Type System**](./types/type-system.md) - TypeScript interfaces and types
- [**Error Handling**](./utils/error-handling.md) - Typed error system

### CLI & Utilities
- [**Command Line Interface**](./cli/commands.md) - CLI implementation
- [**Logging System**](./logging/logging.md) - Factory-based logging
- [**URL Utilities**](./utils/url-utilities.md) - URL formatting and validation

## 🎯 Key Features

### Content Processing
- **Smart Content Extraction**: Configurable CSS selectors for content areas
- **Title Extraction**: Multiple strategies for reliable title detection
- **Metadata Handling**: Description and meta tag processing
- **Link Transformation**: Intelligent internal link processing with exclusions

### Document Organization
- **Hierarchical Structure**: Automatic categorization based on URL paths
- **Path Rules**: Custom configuration for specific URL patterns
- **Index Documents**: Special handling for category index pages
- **Flexible Depth**: Configurable categorization depth (1-5 levels)

### Output Generation
- **Always Generates llms.txt**: Creates an optimized file for LLM consumption
- **Optional Markdown Files**: Can generate individual Markdown files
- **Link Consistency**: Maintains correct internal links
- **Document Descriptions**: Optionally includes descriptions for context

### Performance & Reliability
- **Caching System**: File-based caching with intelligent invalidation
- **Streaming Processing**: Memory-efficient handling of large document sets
- **Error Recovery**: Graceful degradation and detailed error reporting
- **Atomic Operations**: Safe file operations with rollback capability

### Developer Experience
- **TypeScript First**: Full type safety throughout the codebase
- **Extensible Architecture**: Plugin-based system for customization
- **Comprehensive Logging**: Detailed debugging and monitoring
- **CLI Support**: Command-line tools for manual execution

## 🚀 Getting Started

1. **[Installation & Setup](./getting-started/installation.md)**
2. **[Basic Configuration](./getting-started/configuration.md)**
3. **[Advanced Usage](./getting-started/advanced-usage.md)**
4. **[Troubleshooting](./getting-started/troubleshooting.md)**

## 🔍 Deep Dives

- **[Plugin Architecture](./architecture/plugin-architecture.md)** - Detailed architectural decisions
- **[Processing Pipeline](./architecture/processing-pipeline.md)** - Step-by-step pipeline explanation
- **[Caching Strategy](./architecture/caching-strategy.md)** - Cache implementation details
- **[Error Handling Strategy](./architecture/error-handling.md)** - Error management approach

## 🤝 Contributing

- **[Development Setup](./contributing/development-setup.md)**
- **[Code Style Guide](./contributing/code-style.md)**
- **[Adding New Features](./contributing/adding-features.md)**
- **[Testing Guidelines](./contributing/testing.md)**

---

This documentation is designed to provide both high-level understanding and deep technical insights into the plugin's implementation. Each component is documented with examples, use cases, and implementation details to facilitate understanding and contribution. 