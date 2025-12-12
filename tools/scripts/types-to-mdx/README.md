# Types to MDX Generator

A professional TypeDoc JSON to MDX converter with perfect escaping, cross-linking, and modular architecture.

## Features

✨ **Perfect MDX Output**: Uses proper AST serialization with `mdast-util-to-markdown` and `mdast-util-gfm-table` for flawless escaping

🔗 **Smart Cross-Linking**: Automatically links type references to their definitions with `#anchor` syntax

📊 **Rich Tables**: Generates beautiful tables for interfaces, enums, and type aliases with proper GFM support

🏗️ **Modular Architecture**: Clean separation of concerns with dedicated modules for loading, processing, AST building, and serialization

🔍 **Comprehensive Type Support**: Handles complex TypeScript types including generics, unions, intersections, mapped types, and more

⚡ **Fast & Reliable**: Built with proper error handling, validation, and verbose logging

## Usage

```bash
# Basic usage
node index.js ./documentation.json

# With custom output
node index.js ./documentation.json -o my-types.mdx

# With verbose logging
node index.js ./documentation.json --verbose

# From URL
node index.js https://example.com/docs.json -o types.mdx
```

## Architecture

```
src/
├── core/
│   ├── loader.js          # TypeDoc JSON loading & deserialization
│   └── generator.js       # Main MDX generation orchestrator
├── processors/
│   ├── type-extractor.js  # Extract types from TypeDoc reflections
│   ├── type-formatter.js  # Format complex TypeScript types
│   └── comment-processor.js # Process TypeDoc comments
├── ast/
│   ├── builder.js         # Build MDX AST nodes
│   └── serializer.js      # Serialize AST to MDX with validation
└── utils/
    └── logger.js          # Clean logging utility
```

## Key Design Decisions

### 1. AST-First Approach

Instead of string concatenation, we build a proper MDX AST using `unist-builder` and serialize it with `mdast-util-to-markdown`. This ensures:

- Perfect escaping of special characters
- Proper table formatting
- Valid MDX structure
- No manual escaping needed

### 2. Proper Cross-Linking

All type references are automatically converted to links using Docusaurus anchor syntax:

```typescript
Record<SessionEvents, (params?: any) => void>
// Becomes:
Record<[SessionEvents](#sessionevents), (params?: any) => void>
```

### 3. Comprehensive Type Formatting

Handles all TypeScript constructs:

- Generics: `Array<T>`, `Record<K, V>`
- Unions: `string | number`
- Intersections: `A & B`
- Mapped types: `{ [K in keyof T]: V }`
- Template literals: `` `prefix-${T}` ``
- Conditional types: `T extends U ? X : Y`

### 4. Clean Validation

Trusts the serializer for escaping and only validates for obvious MDX syntax errors.

## Generated Output

The tool generates clean MDX with:

- **Table of Contents** with counts
- **Type Aliases** section with proper type formatting
- **Enums** section with member tables
- **Interfaces & Classes** section with property and method tables
- **Perfect escaping** of all special characters
- **Cross-links** between all type references

## Example Output

```mdx
# API Types Documentation

Generated from TypeDoc JSON for @signalwire/client

## Table of Contents

- [Type Aliases](#type-aliases) (50)
- [Enums](#enums) (1)
- [Interfaces & Classes](#interfaces--classes) (87)

## Type Aliases

### CallJoinedEventParams

**Type:** `{ capabilities: [CallCapabilitiesContract](#callcapabilitiescontract) } & Omit<InternalCallJoinedEventParams, "capabilities">`

## Interfaces & Classes

### CallSession

#### Properties

| Property | Type                      | Optional | Readonly | Description        |
| -------- | ------------------------- | -------- | -------- | ------------------ |
| `id`     | `string`                  |          |          | The call ID        |
| `state`  | `[CallState](#callstate)` |          |          | Current call state |
```

## Dependencies

- `typedoc` - TypeDoc library for deserialization
- `mdast-util-to-markdown` - AST to markdown serialization
- `mdast-util-gfm-table` - GFM table support
- `unist-builder` - AST node construction
- `commander` - CLI interface
- `axios` - HTTP requests for URL inputs

## Why This Approach?

Previous approaches using string concatenation and manual escaping were error-prone and produced broken MDX. This system:

1. **Trusts the serializer** - Let `mdast-util-to-markdown` handle all escaping
2. **Uses proper AST** - Build structured data, not strings
3. **Modular design** - Each component has a single responsibility
4. **Comprehensive** - Handles all TypeScript type constructs
5. **Validated** - Ensures output is valid MDX

The result is **perfect MDX** that works flawlessly with Docusaurus and other MDX processors.
