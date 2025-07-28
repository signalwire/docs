# Docusaurus OG Image Generator Plugin

A minimal TypeScript plugin for generating Open Graph images for Docusaurus sites with a clean, simplified interface.

## Design Philosophy

This plugin is designed to be **minimal and flexible**:

- **Plugin handles only orchestration** - image generation, file I/O, and meta tag injection
- **Canvas generators are self-contained** - they bring their own fonts, images, and styling
- **Metadata-driven** - generators receive rich Docusaurus metadata to make informed decisions

## Structure

```
docusaurus-plugin-og/
├── index.ts              # Main entry point and barrel exports
├── src/
│   ├── index.ts          # Minimal plugin implementation
│   ├── types.ts          # TypeScript interfaces
│   ├── defaultCanvasGenerator.ts  # Basic, dependency-free generator
│   └── utils.ts          # Utility functions
└── README.md            # This file
```

## Simplified Interface

### Plugin Options

```typescript
interface PluginOptions {
  canvasGenerator?: CanvasGenerator; // Custom image generator function
  assetsDir?: string; // Assets directory path
}
```

### Canvas Generator Interface

```typescript
interface CanvasGeneratorParams {
  metadata: DocusaurusMetadata; // All page metadata from Docusaurus
  assetsDir: string; // Path to assets directory
}

type CanvasGenerator = (params: CanvasGeneratorParams) => Promise<Buffer> | Buffer;
```

### Docusaurus Metadata

```typescript
interface DocusaurusMetadata {
  title?: string;
  description?: string;
  routePath: string;
  frontMatter?: Record<string, any>;
  contentTitle?: string;
  category?: string;
  permalink?: string;
  tags?: Array<{ label: string; permalink: string }>;
  // ... and more Docusaurus metadata
}
```

## Usage

### Basic Configuration

```typescript
import { ogImagesPlugin } from "../ogImages/index";

// In your docusaurus.config.js plugins array
plugins: [ogImagesPlugin];
```

### Custom Canvas Generator

```typescript
const customGenerator: CanvasGenerator = async ({ metadata, assetsDir }) => {
  // Access all Docusaurus metadata
  const title = metadata.title || "Default Title";
  const category = metadata.frontMatter?.category;
  const tags = metadata.tags || [];

  // Load your own assets
  const backgroundPath = path.join(process.cwd(), assetsDir, "background.png");

  // Generate image with complete control
  const canvas = createCanvas(1200, 630);
  // ... your custom rendering logic

  return canvas.toBuffer("image/png");
};

export const customOgPlugin: PluginConfig = [
  require.resolve("../path/to/plugin"),
  {
    assetsDir: "path/to/your/assets",
    canvasGenerator: customGenerator,
  },
];
```

## Canvas Generator Benefits

Since canvas generators are self-contained:

- **No plugin dependencies** - bring your own fonts, images, colors
- **Rich metadata access** - use frontmatter, categories, tags for smart image generation
- **Complete control** - implement any design system or branding
- **Testable** - pure functions that are easy to test and debug

## Default Generator

The included `defaultCanvasGenerator` is intentionally boring and dependency-free:

- Uses system fonts only
- Simple solid backgrounds
- Basic centered text layout
- No external assets required

Perfect for getting started or as a reference implementation.

## Examples

Check the `/config/ogImages/` folder for a complete SignalWire-specific implementation that demonstrates:

- Custom font loading
- Background image integration
- Brand-specific styling
- Test script for development

## Migration from Complex Interface

The old interface had many styling options in the plugin config. These are now handled by the canvas generator:

```typescript
// OLD: Complex plugin config
{
  width: 1200,
  height: 630,
  backgroundColor: "#fff",
  textColor: "#000",
  fontSize: 48,
  // ... many more options
}

// NEW: Simple plugin config
{
  assetsDir: "path/to/assets",
  canvasGenerator: myGenerator,
}
```

All styling decisions are now made by the canvas generator, making the plugin minimal and flexible.
