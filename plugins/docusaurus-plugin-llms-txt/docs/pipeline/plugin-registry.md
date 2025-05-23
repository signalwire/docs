# Plugin Registry

## Overview

The Plugin Registry (`src/pipeline/plugins/plugin-registry.ts`) is a type-safe system for managing unified plugins used in the HTML-to-Markdown conversion pipeline. It provides centralized configuration, stage-aware application, and compile-time validation of plugin options.

## Architecture

The registry follows a **declarative configuration pattern** where plugins are defined with their metadata and then applied systematically to unified processors.

### Core Components

1. **Plugin Definitions**: Static declarations of available plugins
2. **Type-Safe Options Handling**: Compile-time validation of plugin configurations
3. **Stage Management**: Separation of rehype (HTML) and remark (Markdown) plugins
4. **Application Logic**: Systematic plugin application to processors

## Type System

### `BuiltInPluginEntry<TOptions>`

The foundation interface for plugin registry entries:

```typescript
interface BuiltInPluginEntry<TOptions> extends PluginEntry<TOptions> {
  readonly defaultOptions?: TOptions;
  readonly optionsHandler?: (options: unknown) => TOptions | false;
}

interface PluginEntry<TOptions = unknown> {
  readonly key: keyof MarkdownConversionOptions;
  readonly plugin: UnifiedPlugin<TOptions>;
  readonly stage: 'rehype' | 'remark';
  readonly always?: boolean;
}
```

**Properties:**
- `key`: Maps to configuration option in `MarkdownConversionOptions`
- `plugin`: The actual unified plugin function
- `stage`: Processing stage ('rehype' for HTML, 'remark' for Markdown)
- `always`: If true, plugin runs even when disabled in config
- `defaultOptions`: Default configuration for the plugin
- `optionsHandler`: Type-safe options transformation function

### `UnifiedPlugin<Options>`

Type-safe wrapper for unified plugins:

```typescript
type UnifiedPlugin<Options> = Plugin<[Options?] | [], Node>;
```

Ensures plugins accept optional configuration and operate on AST nodes.

## Plugin Definitions

### Rehype Plugins (HTML Processing)

```typescript
const builtInRehypePlugins = [
  {
    key: 'rehypeProcessTables',
    plugin: rehypeTables,
    stage: 'rehype',
  },
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
] as const satisfies readonly BuiltInPluginEntry<unknown>[];
```

**rehypeProcessTables:**
- Flattens lists inside table cells for Markdown compatibility
- No configuration options
- Optional (can be disabled)

**rehypeProcessLinks:**
- Transforms internal links based on configuration
- Always runs (critical for link functionality)
- Complex options handling with fallback defaults

### Remark Plugins (Markdown Processing)

```typescript
const builtInRemarkPlugins = [
  {
    key: 'remarkGfm',
    plugin: remarkGfm,
    stage: 'remark',
    defaultOptions: defaultGfm,
    optionsHandler: (options: unknown): RemarkGfmOptions | false => {
      if (options === false) return false;
      if (typeof options === 'object' && options !== null) {
        return { ...defaultGfm, ...options as Partial<RemarkGfmOptions> };
      }
      return defaultGfm;
    }
  },
  {
    key: 'remarkStringify',
    plugin: remarkStringify,
    stage: 'remark',
    always: true,
    optionsHandler: (options: unknown): RemarkStringifyOptions => {
      return typeof options === 'object' && options !== null 
        ? options as RemarkStringifyOptions 
        : {};
    }
  }
] as const satisfies readonly BuiltInPluginEntry<unknown>[];
```

**remarkGfm:**
- Enables GitHub Flavored Markdown features
- Supports boolean or object configuration
- Merges user options with defaults

**remarkStringify:**
- Converts Markdown AST to string
- Always runs (required for output)
- Accepts any stringify options

## Core Functions

### `applyBuiltInPlugin<T>()`

Type-safe plugin application with options handling:

```typescript
function applyBuiltInPlugin<T>(
  processor: Processor,
  entry: BuiltInPluginEntry<T>,
  options: unknown
): void {
  // Skip if explicitly disabled and not forced
  if (!entry.always && options === false) {
    return;
  }
  
  // Apply plugin with type-safe options handling
  if (entry.optionsHandler) {
    const processedOptions = entry.optionsHandler(options);
    if (processedOptions === false) return;
    processor.use(entry.plugin, processedOptions);
  } else {
    processor.use(entry.plugin);
  }
}
```

**Logic:**
1. **Disable Check**: Skip if plugin is disabled and not marked as `always`
2. **Options Processing**: Use `optionsHandler` if available for type-safe transformation
3. **Plugin Application**: Add plugin to processor with processed options

### `applyPluginsToProcessor()`

Main function that applies all plugins to a unified processor:

```typescript
export function applyPluginsToProcessor(
  processor: Processor,
  plugins: readonly BuiltInPluginEntry<unknown>[],
  options: MarkdownConversionOptions
): void {
  for (const entry of plugins) {
    // Special handling for rehype-links since it needs multiple config values
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
    
    const pluginOptions = options[entry.key];
    applyBuiltInPlugin(processor, entry, pluginOptions);
  }
}
```

**Special Cases:**
- **rehype-links**: Requires complex options construction from multiple config values
- **Conditional Application**: Some plugins only run in specific modes
- **Options Mapping**: Maps configuration keys to plugin options

### `getPluginsByStage()`

Filters plugins by processing stage:

```typescript
export function getPluginsByStage(stage: 'rehype' | 'remark'): readonly BuiltInPluginEntry<unknown>[] {
  return allBuiltInPlugins.filter(p => p.stage === stage);
}
```

Used by the pipeline builder to apply plugins in the correct order.

## Options Handling Patterns

### Boolean Toggle Pattern

```typescript
// remarkGfm example
optionsHandler: (options: unknown): RemarkGfmOptions | false => {
  if (options === false) return false;  // Disable plugin
  if (typeof options === 'object' && options !== null) {
    return { ...defaultGfm, ...options as Partial<RemarkGfmOptions> };
  }
  return defaultGfm;  // Use defaults
}
```

**Supports:**
- `false`: Disable plugin entirely
- `true`: Use default options
- `object`: Merge with defaults

### Always-On Pattern

```typescript
// remarkStringify example
optionsHandler: (options: unknown): RemarkStringifyOptions => {
  return typeof options === 'object' && options !== null 
    ? options as RemarkStringifyOptions 
    : {};
}
```

**Supports:**
- Any object: Use as options
- Other values: Use empty options

### Complex Construction Pattern

```typescript
// rehypeProcessLinks example - handled in applyPluginsToProcessor
const linkOptions: RehypeLinksOptions = {
  baseUrl: options.baseUrl || '',
  relativePaths: options.relativePaths !== false,
  enableMarkdownFiles: options.enableMarkdownFiles === true,
  excludePaths: options.excludePaths || [],
};
```

**Features:**
- Constructs options from multiple configuration values
- Applies defaults and type coercion
- Handles complex interdependencies

## Integration with Pipeline Builder

The registry integrates with the pipeline builder for systematic plugin application:

```typescript
// In pipeline-builder.ts
export function buildMarkdownProcessor(opts: MarkdownConversionOptions): Processor {
  const proc = unified();
  proc.use(rehypeParse, { fragment: false });

  // Stage 1: Apply rehype plugins (HTML processing)
  const rehypePlugins = getPluginsByStage('rehype');
  applyPluginsToProcessor(proc, rehypePlugins, opts);

  // Stage 2: Convert HTML to Markdown
  proc.use(rehypeRemark, {
    handlers: { br: () => ({ type: 'html', value: '<br />' }) },
  });

  // Stage 3: Apply remark plugins (Markdown processing)
  const remarkPlugins = getPluginsByStage('remark');
  applyPluginsToProcessor(proc, remarkPlugins, opts);

  return proc;
}
```

## Configuration Examples

### Basic Configuration

```typescript
const options: MarkdownConversionOptions = {
  remarkGfm: true,                    // Enable with defaults
  remarkStringify: { bullet: '*' },  // Custom stringify options
  rehypeProcessTables: true,          // Enable table processing
  rehypeProcessLinks: true,           // Enable link processing
};
```

### Advanced Configuration

```typescript
const options: MarkdownConversionOptions = {
  remarkGfm: {
    singleTilde: false,
    tableCellPadding: true,
  },
  remarkStringify: {
    bullet: '-',
    emphasis: '_',
    incrementListMarker: false,
  },
  rehypeProcessTables: false,         // Disable table processing
  excludePaths: ['/rest/**'],         // Exclude REST API links
  baseUrl: 'https://example.com',
  relativePaths: false,
  enableMarkdownFiles: true,
};
```

### Conditional Configuration

```typescript
// Different configs for different modes
const llmsOnlyConfig: MarkdownConversionOptions = {
  remarkGfm: false,                   // Disable GFM for simpler output
  rehypeProcessLinks: false,          // No link processing needed
  enableMarkdownFiles: false,
};

const fullConfig: MarkdownConversionOptions = {
  remarkGfm: true,
  rehypeProcessLinks: true,
  enableMarkdownFiles: true,
  excludePaths: ['/internal/**'],
};
```

## Adding New Plugins

### Step 1: Create Plugin

```typescript
// src/pipeline/my-plugin.ts
export default function myPlugin(options: MyPluginOptions = {}) {
  return function transformer(tree: Root): Root {
    // Plugin logic here
    return tree;
  };
}
```

### Step 2: Define Options Interface

```typescript
// src/types/unified.ts
export interface MyPluginOptions {
  enabled?: boolean;
  customOption?: string;
}
```

### Step 3: Add to Configuration

```typescript
// src/types/plugin.ts
export interface MarkdownConversionOptions {
  // ... existing options
  myPlugin?: boolean | MyPluginOptions;
}
```

### Step 4: Register Plugin

```typescript
// src/pipeline/plugin-registry.ts
const builtInRehypePlugins = [
  // ... existing plugins
  {
    key: 'myPlugin',
    plugin: myPlugin,
    stage: 'rehype',
    optionsHandler: (options: unknown): MyPluginOptions | false => {
      if (options === false) return false;
      if (typeof options === 'object' && options !== null) {
        return options as MyPluginOptions;
      }
      return { enabled: true };
    }
  }
];
```

## Best Practices

### Plugin Design
1. **Idempotent**: Plugins should be safe to run multiple times
2. **Defensive**: Handle malformed AST nodes gracefully
3. **Efficient**: Minimize AST traversals and memory allocations
4. **Focused**: Each plugin should have a single responsibility

### Options Handling
1. **Type Safety**: Always use type-safe options handlers
2. **Defaults**: Provide sensible defaults for all options
3. **Validation**: Validate options at runtime when possible
4. **Documentation**: Document all options and their effects

### Registry Management
1. **Ordering**: Consider plugin execution order carefully
2. **Dependencies**: Document plugin interdependencies
3. **Testing**: Test plugin combinations thoroughly
4. **Versioning**: Handle plugin API changes gracefully

## Performance Considerations

### Plugin Application
- Plugins are applied once per processor creation
- Options processing happens during application
- No runtime overhead for disabled plugins

### Memory Usage
- Plugin registry is static (no dynamic allocation)
- Options objects are created per processor
- AST modifications happen in-place

### Execution Order
- Rehype plugins run before remark plugins
- Within each stage, plugins run in registration order
- Some plugins may depend on others running first

## Related Components

- **[Pipeline Builder](./pipeline-builder.md)**: Uses registry to build processors
- **[Rehype Links](../plugins/rehype-links.md)**: Example of complex plugin integration
- **[Rehype Tables](../plugins/rehype-tables.md)**: Example of simple plugin registration
- **[Configuration](../config/plugin-options.md)**: Defines plugin configuration schema 