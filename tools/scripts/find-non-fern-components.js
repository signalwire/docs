#!/usr/bin/env node

/**
 * Script to scan MDX/MD files for React components that are NOT part of the Fern library.
 * This helps identify custom/Docusaurus components that need migration.
 *
 * Usage:
 *   node find-non-fern-components.js                    # Scan entire fern/ directory
 *   node find-non-fern-components.js path/to/file.mdx   # Scan a single file
 *   node find-non-fern-components.js path/to/folder     # Scan a folder recursively
 *   node find-non-fern-components.js --json             # Output as JSON
 *   node find-non-fern-components.js --summary          # Show only summary
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Known Fern built-in components (from official Fern docs)
// Source: https://buildwithfern.com/learn/docs/writing-content/components/overview
// Last verified: 2025-01-27
const FERN_COMPONENTS = new Set([
  // Layout & Structure (7 components)
  'Accordion',       // Expandable sections for FAQs
  'AccordionGroup',  // Groups multiple accordions
  'Card',            // Visually distinct box with optional icons/links
  'CardGroup',       // Responsive grid of cards
  'Steps',           // Sequential numbered instructions
  'Step',            // Individual step within Steps
  'Tabs',            // Tabbed interface
  'Tab',             // Individual tab within Tabs
  'Files',           // File tree container
  'Folder',          // Folder in file tree
  'File',            // File in file tree
  'Indent',          // Visual indentation with guide lines
  'Frame',           // Image container with captions
  'Aside',           // Sticky floating content
  'Anchor',          // Linkable anchors for non-heading content

  // Callouts (9 types)
  'Callout',         // Generic callout (with intent prop)
  'Info',            // Information callout
  'Warning',         // Warning callout
  'Success',         // Success callout
  'Error',           // Error callout
  'Note',            // Note callout
  'Launch',          // Launch/announcement callout
  'Tip',             // Tip callout
  'Check',           // Check/verified callout

  // Code (4 components)
  'Code',            // Embed code from files
  'CodeBlock',       // Code block with deep linking
  'CodeBlocks',      // Tabbed code blocks

  // Interactive (5 components)
  'Button',          // Interactive button
  'Copy',            // Click-to-copy text
  'Download',        // Download assets
  'Tooltip',         // Hover tooltips
  'Template',        // Code tooltips with variables

  // Data Display (4 components)
  'Badge',           // Small labels for status/versions
  'ParamField',      // API parameter documentation
  'StickyTable',     // Table with sticky headers
  'Icon',            // Font Awesome icons

  // API Reference (7 components)
  'EndpointRequestSnippet',   // Endpoint request from API Reference
  'EndpointResponseSnippet',  // Endpoint response from API Reference
  'EndpointSchemaSnippet',    // Endpoint schema from API Reference
  'RunnableEndpoint',         // Interactive API testing
  'WebhookPayloadSnippet',    // Webhook payload snippet
  'Schema',                   // Display any type definition
  'SchemaSnippet',            // Type definition as JSON code block

  // Content/Markdown (1 component)
  'Markdown',        // Reusable markdown snippets
]);

// Standard HTML elements to ignore (not React components)
const HTML_ELEMENTS = new Set([
  'a', 'abbr', 'address', 'area', 'article', 'aside', 'audio',
  'b', 'base', 'bdi', 'bdo', 'blockquote', 'body', 'br', 'button',
  'canvas', 'caption', 'cite', 'code', 'col', 'colgroup',
  'data', 'datalist', 'dd', 'del', 'details', 'dfn', 'dialog', 'div', 'dl', 'dt',
  'em', 'embed',
  'fieldset', 'figcaption', 'figure', 'footer', 'form',
  'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'head', 'header', 'hgroup', 'hr', 'html',
  'i', 'iframe', 'img', 'input', 'ins',
  'kbd',
  'label', 'legend', 'li', 'link',
  'main', 'map', 'mark', 'menu', 'meta', 'meter',
  'nav', 'noscript',
  'object', 'ol', 'optgroup', 'option', 'output',
  'p', 'param', 'picture', 'pre', 'progress',
  'q',
  'rp', 'rt', 'ruby',
  's', 'samp', 'script', 'section', 'select', 'slot', 'small', 'source', 'span', 'strong', 'style', 'sub', 'summary', 'sup', 'svg',
  'table', 'tbody', 'td', 'template', 'textarea', 'tfoot', 'th', 'thead', 'time', 'title', 'tr', 'track',
  'u', 'ul',
  'var', 'video',
  'wbr',
  // SVG elements
  'circle', 'clipPath', 'defs', 'ellipse', 'g', 'image', 'line', 'linearGradient', 'mask', 'path', 'pattern', 'polygon', 'polyline', 'radialGradient', 'rect', 'stop', 'text', 'tspan', 'use',
]);

// Regex to find JSX component tags
// Matches: <ComponentName or <ComponentName> or <ComponentName ... or </ComponentName>
const JSX_COMPONENT_REGEX = /<\/?([A-Z][A-Za-z0-9]*)\b/g;

// Regex to find import statements (to track what's being imported)
const IMPORT_REGEX = /import\s+(?:{([^}]+)}|(\w+))\s+from\s+['"]([^'"]+)['"]/g;

/**
 * Remove content that should not be scanned for components:
 * - Fenced code blocks (```...```)
 * - Inline code (`...`)
 * - HTML comments (<!-- ... -->)
 */
function stripCodeContent(content) {
  // Remove fenced code blocks (``` or ~~~)
  // This handles multi-line code blocks
  let stripped = content.replace(/^```[\s\S]*?^```/gm, '');
  stripped = stripped.replace(/^~~~[\s\S]*?^~~~/gm, '');

  // Also handle code blocks that might not start at line beginning
  stripped = stripped.replace(/```[^`]*```/g, '');

  // Remove inline code (single backticks)
  stripped = stripped.replace(/`[^`\n]+`/g, '');

  // Remove HTML comments
  stripped = stripped.replace(/<!--[\s\S]*?-->/g, '');

  return stripped;
}

/**
 * Check if a potential component tag is actually a JSX component
 * Returns false for things like:
 * - Type annotations: Promise<Foo>, Array<Bar>
 * - Generic types: Map<K, V>
 * - Comparisons: if (x < Foo)
 */
function isLikelyJSXComponent(line, match, componentName) {
  const matchIndex = match.index;

  // Check if preceded by common type annotation patterns
  // e.g., Promise<, Array<, Map<, Set<, etc.
  const beforeMatch = line.substring(0, matchIndex);
  if (/\b(Promise|Array|Map|Set|Record|Partial|Required|Pick|Omit|Exclude|Extract|ReturnType|Parameters|InstanceType|Awaited|ReadonlyArray|ReadonlyMap|ReadonlySet|WeakMap|WeakSet|Generator|AsyncGenerator|Iterable|AsyncIterable|Iterator|AsyncIterator)\s*$/.test(beforeMatch)) {
    return false;
  }

  // Check if it's inside a type annotation (has . before it like Relay.Calling.AnswerResult)
  // These are typically class/namespace paths, not JSX
  if (/\.\s*$/.test(beforeMatch)) {
    return false;
  }

  // Check if followed by a dot (like <Relay.Calling) - this is a namespace, not JSX
  const afterMatch = line.substring(matchIndex + match[0].length);
  if (/^\s*\./.test(afterMatch)) {
    return false;
  }

  // Check if it looks like a generic type: <Type> followed by common type patterns
  // e.g., <Foo>bar, <Foo>[], <Foo> | <Bar>
  if (/^>\s*[\w\[\]|&]/.test(afterMatch) && !/^>\s*</.test(afterMatch)) {
    // Could be generic, but let's be more careful
    // If it's <Component> at start of line or after whitespace/JSX chars, it's likely JSX
    if (!/^\s*$/.test(beforeMatch) && !/[{(\s]$/.test(beforeMatch)) {
      return false;
    }
  }

  // Skip if the component name contains dots (namespaced) - already handled above
  // but also skip if the full match shows it's a type like <Relay.Calling.Foo>

  return true;
}

function findComponentsInFile(filePath) {
  const content = fs.readFileSync(filePath, 'utf-8');
  const components = new Map(); // component name -> { count, lines }
  const imports = [];

  // Find all imports
  let importMatch;
  while ((importMatch = IMPORT_REGEX.exec(content)) !== null) {
    const namedImports = importMatch[1];
    const defaultImport = importMatch[2];
    const source = importMatch[3];

    if (namedImports) {
      namedImports.split(',').forEach(imp => {
        const name = imp.trim().split(/\s+as\s+/)[0].trim();
        if (name) {
          imports.push({ name, source, type: 'named' });
        }
      });
    }
    if (defaultImport) {
      imports.push({ name: defaultImport, source, type: 'default' });
    }
  }

  // Strip code blocks and inline code before scanning
  const strippedContent = stripCodeContent(content);

  // Find all JSX components
  const lines = strippedContent.split('\n');
  lines.forEach((line, lineIndex) => {
    let match;
    const lineRegex = new RegExp(JSX_COMPONENT_REGEX.source, 'g');
    while ((match = lineRegex.exec(line)) !== null) {
      const componentName = match[1];

      // Skip if it's a standard HTML element
      if (HTML_ELEMENTS.has(componentName.toLowerCase())) {
        continue;
      }

      // Skip if it doesn't look like actual JSX
      if (!isLikelyJSXComponent(line, match, componentName)) {
        continue;
      }

      if (!components.has(componentName)) {
        components.set(componentName, { count: 0, lines: [] });
      }
      const comp = components.get(componentName);
      comp.count++;
      if (!comp.lines.includes(lineIndex + 1)) {
        comp.lines.push(lineIndex + 1);
      }
    }
  });

  return { components, imports };
}

function categorizeComponents(components) {
  const fernComponents = new Map();
  const nonFernComponents = new Map();

  for (const [name, data] of components) {
    if (FERN_COMPONENTS.has(name)) {
      fernComponents.set(name, data);
    } else {
      nonFernComponents.set(name, data);
    }
  }

  return { fernComponents, nonFernComponents };
}

function scanDirectory(dirPath, extensions = ['.mdx', '.md']) {
  const results = [];

  function walkDir(currentPath) {
    const entries = fs.readdirSync(currentPath, { withFileTypes: true });

    for (const entry of entries) {
      const fullPath = path.join(currentPath, entry.name);

      if (entry.isDirectory()) {
        // Skip node_modules and hidden directories
        if (!entry.name.startsWith('.') && entry.name !== 'node_modules') {
          walkDir(fullPath);
        }
      } else if (entry.isFile()) {
        const ext = path.extname(entry.name).toLowerCase();
        if (extensions.includes(ext)) {
          results.push(fullPath);
        }
      }
    }
  }

  walkDir(dirPath);
  return results;
}

function main() {
  const args = process.argv.slice(2);
  let targetPath = null;
  let jsonOutput = false;
  let summaryOnly = false;

  // Parse arguments
  for (const arg of args) {
    if (arg === '--json') {
      jsonOutput = true;
    } else if (arg === '--summary') {
      summaryOnly = true;
    } else if (arg === '--help' || arg === '-h') {
      console.log(`
Usage: node find-non-fern-components.js [options] [path]

Options:
  --json      Output results as JSON
  --summary   Show only summary (no per-file details)
  --help, -h  Show this help message

Arguments:
  path        Path to a file or directory to scan (default: ./fern)

Examples:
  node find-non-fern-components.js
  node find-non-fern-components.js fern/products/realtime-sdk
  node find-non-fern-components.js fern/docs/page.mdx --json
`);
      process.exit(0);
    } else if (!arg.startsWith('-')) {
      targetPath = arg;
    }
  }

  // Default to fern directory
  if (!targetPath) {
    targetPath = path.join(process.cwd(), 'fern');
  }

  // Resolve path
  if (!path.isAbsolute(targetPath)) {
    targetPath = path.resolve(process.cwd(), targetPath);
  }

  // Check if path exists
  if (!fs.existsSync(targetPath)) {
    console.error(`Error: Path does not exist: ${targetPath}`);
    process.exit(1);
  }

  // Get files to scan
  let files = [];
  const stat = fs.statSync(targetPath);

  if (stat.isFile()) {
    files = [targetPath];
  } else if (stat.isDirectory()) {
    files = scanDirectory(targetPath);
  }

  if (files.length === 0) {
    console.log('No MDX/MD files found.');
    process.exit(0);
  }

  // Scan all files
  const allResults = [];
  const globalNonFernComponents = new Map();
  const globalFernComponents = new Map();
  let filesWithNonFern = 0;

  for (const file of files) {
    try {
      const { components, imports } = findComponentsInFile(file);
      const { fernComponents, nonFernComponents } = categorizeComponents(components);

      if (nonFernComponents.size > 0) {
        filesWithNonFern++;

        // Aggregate global counts
        for (const [name, data] of nonFernComponents) {
          if (!globalNonFernComponents.has(name)) {
            globalNonFernComponents.set(name, { count: 0, files: [] });
          }
          const global = globalNonFernComponents.get(name);
          global.count += data.count;
          global.files.push(file);
        }
      }

      for (const [name, data] of fernComponents) {
        if (!globalFernComponents.has(name)) {
          globalFernComponents.set(name, { count: 0, files: [] });
        }
        const global = globalFernComponents.get(name);
        global.count += data.count;
        global.files.push(file);
      }

      allResults.push({
        file: path.relative(process.cwd(), file),
        fernComponents: Object.fromEntries(fernComponents),
        nonFernComponents: Object.fromEntries(nonFernComponents),
        imports,
      });
    } catch (err) {
      console.error(`Error processing ${file}: ${err.message}`);
    }
  }

  // Output results
  if (jsonOutput) {
    const output = {
      summary: {
        totalFiles: files.length,
        filesWithNonFernComponents: filesWithNonFern,
        uniqueNonFernComponents: globalNonFernComponents.size,
        uniqueFernComponents: globalFernComponents.size,
      },
      nonFernComponents: Object.fromEntries(
        [...globalNonFernComponents.entries()].sort((a, b) => b[1].count - a[1].count)
      ),
      fernComponentsUsed: Object.fromEntries(
        [...globalFernComponents.entries()].sort((a, b) => b[1].count - a[1].count)
      ),
      files: summaryOnly ? undefined : allResults.filter(r => Object.keys(r.nonFernComponents).length > 0),
    };
    console.log(JSON.stringify(output, null, 2));
  } else {
    // Human-readable output
    console.log('\n========================================');
    console.log('  NON-FERN COMPONENT SCANNER');
    console.log('========================================\n');

    console.log(`Scanned: ${files.length} files`);
    console.log(`Files with non-Fern components: ${filesWithNonFern}`);
    console.log(`Unique non-Fern components found: ${globalNonFernComponents.size}`);
    console.log(`Unique Fern components used: ${globalFernComponents.size}`);

    if (globalNonFernComponents.size > 0) {
      console.log('\n----------------------------------------');
      console.log('  NON-FERN COMPONENTS (need migration)');
      console.log('----------------------------------------\n');

      const sorted = [...globalNonFernComponents.entries()].sort((a, b) => b[1].count - a[1].count);

      for (const [name, data] of sorted) {
        console.log(`  <${name}>`);
        console.log(`    Used ${data.count} time(s) in ${data.files.length} file(s)`);
      }

      if (!summaryOnly) {
        console.log('\n----------------------------------------');
        console.log('  FILES WITH NON-FERN COMPONENTS');
        console.log('----------------------------------------\n');

        for (const result of allResults) {
          if (Object.keys(result.nonFernComponents).length > 0) {
            console.log(`  ${result.file}`);
            for (const [name, data] of Object.entries(result.nonFernComponents)) {
              console.log(`    - <${name}> (lines: ${data.lines.join(', ')})`);
            }
            console.log('');
          }
        }
      }
    } else {
      console.log('\n✓ No non-Fern components found! All components are Fern-compatible.\n');
    }

    if (globalFernComponents.size > 0) {
      console.log('\n----------------------------------------');
      console.log('  FERN COMPONENTS IN USE');
      console.log('----------------------------------------\n');

      const sorted = [...globalFernComponents.entries()].sort((a, b) => b[1].count - a[1].count);
      for (const [name, data] of sorted) {
        console.log(`  <${name}> - ${data.count} uses`);
      }
    }

    console.log('\n');
  }
}

main();
