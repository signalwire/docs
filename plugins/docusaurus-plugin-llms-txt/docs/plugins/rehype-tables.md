# Rehype Tables Plugin

## Overview

The Rehype Tables Plugin (`src/pipeline/plugins/rehype-tables.ts`) is a custom unified plugin that processes HTML tables to ensure Markdown compatibility. It specifically handles the problem of lists inside table cells, which can break Markdown table formatting by flattening nested lists into inline content with proper line breaks.

## Problem Statement

### The Challenge

Standard Markdown tables cannot contain block-level elements like lists. When HTML tables contain `<ul>` or `<ol>` elements, direct conversion to Markdown results in invalid table syntax:

**Problematic HTML:**
```html
<table>
  <tr>
    <td>
      Features:
      <ul>
        <li>Fast processing</li>
        <li>Easy configuration</li>
        <li>Great documentation</li>
      </ul>
    </td>
  </tr>
</table>
```

**Invalid Markdown Result:**
```markdown
| Features:
- Fast processing
- Easy configuration  
- Great documentation |
```

### The Solution

The plugin flattens lists inside table cells into inline content with `<br />` separators:

**Valid Markdown Result:**
```markdown
| Features:<br />- Fast processing<br />- Easy configuration<br />- Great documentation |
```

## Core Functionality

### Main Plugin Function

```typescript
export default function rehypeTables() {
  return function transformer(tree: Root): Root {
    visit(tree, 'element', (node: Element) => {
      if (node.tagName !== 'td' && node.tagName !== 'th') return;

      visit(node, 'element', (listNode: Element, listIndex, listParent) => {
        if (
          !(listNode.tagName === 'ul' || listNode.tagName === 'ol') ||
          !listParent ||
          typeof listIndex !== 'number'
        ) {
          return undefined;
        }

        const listType = listNode.tagName;
        const listItems = (listNode.children || []).filter(
          (c) => (c as Element).type === 'element' && (c as Element).tagName === 'li'
        ) as Element[];
        if (listItems.length === 0) return undefined;

        const replacement: ElementContent[] = [];
        listItems.forEach((li, idx) => {
          const prefix = listType === 'ol' ? `${idx + 1}. ` : '- ';
          replacement.push({ type: 'text', value: prefix } as Text);
          if (li.children && li.children.length) {
            replacement.push(...(li.children as ElementContent[]));
          }
          if (idx < listItems.length - 1) {
            replacement.push({ type: 'element', tagName: 'br', properties: {}, children: [] });
          }
        });

        listParent.children.splice(listIndex, 1, ...replacement);
        return false;
      });
    });

    return tree;
  };
}
```

## Processing Algorithm

### Step 1: Table Cell Detection

```typescript
visit(tree, 'element', (node: Element) => {
  if (node.tagName !== 'td' && node.tagName !== 'th') return;
  // Process only table cells
});
```

**Target Elements:**
- `<td>` - Table data cells
- `<th>` - Table header cells

### Step 2: List Detection

```typescript
visit(node, 'element', (listNode: Element, listIndex, listParent) => {
  if (
    !(listNode.tagName === 'ul' || listNode.tagName === 'ol') ||
    !listParent ||
    typeof listIndex !== 'number'
  ) {
    return undefined;
  }
  // Process lists inside table cells
});
```

**Target Lists:**
- `<ul>` - Unordered lists
- `<ol>` - Ordered lists

**Validation:**
- Ensures parent element exists
- Validates list index for replacement
- Skips non-list elements

### Step 3: List Item Processing

```typescript
const listItems = (listNode.children || []).filter(
  (c) => (c as Element).type === 'element' && (c as Element).tagName === 'li'
) as Element[];
```

**Features:**
- Filters only `<li>` elements
- Handles missing children arrays
- Type-safe element processing

### Step 4: Content Flattening

```typescript
const replacement: ElementContent[] = [];
listItems.forEach((li, idx) => {
  const prefix = listType === 'ol' ? `${idx + 1}. ` : '- ';
  replacement.push({ type: 'text', value: prefix } as Text);
  if (li.children && li.children.length) {
    replacement.push(...(li.children as ElementContent[]));
  }
  if (idx < listItems.length - 1) {
    replacement.push({ type: 'element', tagName: 'br', properties: {}, children: [] });
  }
});
```

**Transformation Process:**
1. **Prefix Generation**: `- ` for unordered, `1. `, `2. `, etc. for ordered
2. **Content Preservation**: Maintains all child content from list items
3. **Line Break Insertion**: Adds `<br />` between items (except after last)
4. **Inline Conversion**: Converts block-level list to inline content

### Step 5: AST Replacement

```typescript
listParent.children.splice(listIndex, 1, ...replacement);
return false; // Stop traversing this branch
```

**Features:**
- **In-Place Replacement**: Replaces list with flattened content
- **Atomic Operation**: Single splice operation for consistency
- **Traversal Control**: Returns `false` to prevent re-processing

## Transformation Examples

### Unordered List Example

**Input HTML:**
```html
<table>
  <tr>
    <td>
      Benefits:
      <ul>
        <li>Easy to use</li>
        <li>Well documented</li>
        <li>Fast performance</li>
      </ul>
    </td>
  </tr>
</table>
```

**After Plugin Processing:**
```html
<table>
  <tr>
    <td>
      Benefits:
      - Easy to use<br />- Well documented<br />- Fast performance
    </td>
  </tr>
</table>
```

**Final Markdown:**
```markdown
| Benefits:<br />- Easy to use<br />- Well documented<br />- Fast performance |
```

### Ordered List Example

**Input HTML:**
```html
<table>
  <tr>
    <td>
      Steps:
      <ol>
        <li>Install the plugin</li>
        <li>Configure options</li>
        <li>Run the build</li>
      </ol>
    </td>
  </tr>
</table>
```

**After Plugin Processing:**
```html
<table>
  <tr>
    <td>
      Steps:
      1. Install the plugin<br />2. Configure options<br />3. Run the build
    </td>
  </tr>
</table>
```

**Final Markdown:**
```markdown
| Steps:<br />1. Install the plugin<br />2. Configure options<br />3. Run the build |
```

### Complex Content Example

**Input HTML:**
```html
<table>
  <tr>
    <td>
      Features:
      <ul>
        <li><strong>Fast</strong> processing</li>
        <li>Easy <em>configuration</em></li>
        <li>Great <a href="/docs">documentation</a></li>
      </ul>
    </td>
  </tr>
</table>
```

**After Plugin Processing:**
```html
<table>
  <tr>
    <td>
      Features:
      - <strong>Fast</strong> processing<br />- Easy <em>configuration</em><br />- Great <a href="/docs">documentation</a>
    </td>
  </tr>
</table>
```

**Final Markdown:**
```markdown
| Features:<br />- **Fast** processing<br />- Easy *configuration*<br />- Great [documentation](/docs) |
```

## Integration with Plugin Registry

### Registration

```typescript
// In plugin-registry.ts
const builtInRehypePlugins = [
  {
    key: 'rehypeProcessTables',
    plugin: rehypeTables,
    stage: 'rehype',
  },
  // ... other plugins
];
```

**Configuration:**
- **Key**: Maps to `rehypeProcessTables` option in plugin configuration
- **Stage**: Runs during `rehype` stage (HTML processing)
- **No Options**: Plugin requires no configuration options

### Usage in Pipeline

```typescript
// In pipeline-builder.ts
export function buildMarkdownProcessor(opts: MarkdownConversionOptions): Processor {
  const proc = unified();
  proc.use(rehypeParse, { fragment: false });

  // Apply rehype plugins (including rehype-tables)
  const rehypePlugins = getPluginsByStage('rehype');
  applyPluginsToProcessor(proc, rehypePlugins, opts);

  // Continue with remark processing...
}
```

### Configuration Control

```typescript
// User can disable table processing
const options: MarkdownConversionOptions = {
  rehypeProcessTables: false, // Disable table list flattening
  // ... other options
};
```

## Edge Cases and Limitations

### Nested Lists

**Current Behavior:**
```html
<ul>
  <li>Item 1
    <ul>
      <li>Nested item</li>
    </ul>
  </li>
</ul>
```

**Result:**
```
- Item 1 - Nested item
```

**Limitation:** Nested lists are flattened to single level

### Empty Lists

**Input:**
```html
<ul></ul>
```

**Behavior:** Plugin skips empty lists (no list items to process)

### Mixed Content

**Input:**
```html
<td>
  Text before
  <ul>
    <li>Item 1</li>
    <li>Item 2</li>
  </ul>
  Text after
</td>
```

**Result:**
```html
<td>
  Text before
  - Item 1<br />- Item 2
  Text after
</td>
```

**Feature:** Preserves surrounding content correctly

## Performance Considerations

### AST Traversal Efficiency

```typescript
visit(tree, 'element', (node: Element) => {
  if (node.tagName !== 'td' && node.tagName !== 'th') return;
  // Only process table cells - early return for efficiency
});
```

**Optimizations:**
- **Early Returns**: Skip non-table-cell elements immediately
- **Targeted Processing**: Only processes relevant elements
- **Single Pass**: Processes all lists in one traversal

### Memory Usage

```typescript
const replacement: ElementContent[] = [];
// Build replacement array incrementally
listParent.children.splice(listIndex, 1, ...replacement);
```

**Features:**
- **Incremental Building**: Builds replacement content piece by piece
- **In-Place Replacement**: Modifies existing AST rather than creating new tree
- **Minimal Allocations**: Reuses existing content elements where possible

## Testing Scenarios

### Basic Functionality

```typescript
// Test unordered list flattening
const input = `
<table>
  <tr>
    <td>
      <ul>
        <li>Item 1</li>
        <li>Item 2</li>
      </ul>
    </td>
  </tr>
</table>
`;

// Expected: List flattened with br separators
```

### Ordered List Numbering

```typescript
// Test ordered list numbering
const input = `
<table>
  <tr>
    <td>
      <ol>
        <li>First</li>
        <li>Second</li>
        <li>Third</li>
      </ol>
    </td>
  </tr>
</table>
`;

// Expected: 1. First<br />2. Second<br />3. Third
```

### Complex Content Preservation

```typescript
// Test complex content preservation
const input = `
<table>
  <tr>
    <td>
      <ul>
        <li><strong>Bold</strong> text</li>
        <li>Link: <a href="/test">Test</a></li>
      </ul>
    </td>
  </tr>
</table>
`;

// Expected: Inline markup preserved in flattened list
```

## Best Practices

### Plugin Usage

1. **Enable by Default**: Table processing is generally beneficial for Markdown compatibility
2. **Disable When Needed**: Disable if you need to preserve original list structure
3. **Test Output**: Verify table rendering in your Markdown processor
4. **Consider Alternatives**: For complex tables, consider using HTML tables in Markdown

### Content Design

1. **Simple Lists**: Keep lists in tables simple for best results
2. **Avoid Deep Nesting**: Nested lists lose structure when flattened
3. **Alternative Formatting**: Consider using line breaks or other formatting for complex content
4. **Test Rendering**: Always test how flattened content renders in your target system

## Related Components

- **[Plugin Registry](../pipeline/plugin-registry.md)**: Manages plugin registration and application
- **[Pipeline Builder](../pipeline/pipeline-builder.md)**: Integrates plugin into processing pipeline
- **[HTML Converter](../pipeline/html-converter.md)**: Uses plugin during HTML-to-Markdown conversion
- **[Configuration](../config/plugin-options.md)**: Provides `rehypeProcessTables` option 