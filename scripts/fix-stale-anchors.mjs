#!/usr/bin/env node

/**
 * Fix stale local anchor references in SDK method subpages.
 *
 * When class pages were split into method subpages, ref definitions like
 * `[connectphone]: #connectphone` became stale — the anchor moved to a
 * sibling subpage. This script rewrites those definitions to point to the
 * correct sibling page slug.
 *
 * Usage:
 *   node scripts/fix-stale-anchors.mjs --dry-run   # Preview changes
 *   node scripts/fix-stale-anchors.mjs              # Execute
 */

import { readFileSync, writeFileSync, readdirSync } from "fs";
import { join, relative, dirname } from "path";
import { unified } from "unified";
import remarkParse from "remark-parse";
import remarkMdx from "remark-mdx";
import { visit } from "unist-util-visit";

const ROOT = join(import.meta.dirname, "..");
const FERN_DIR = join(ROOT, "fern");

const args = process.argv.slice(2);
const dryRun = args.includes("--dry-run");

// ---------------------------------------------------------------------------
// Build slug index: for every .mdx file, map its slug to itself,
// and for every heading, map parent_slug#anchor → slug
// ---------------------------------------------------------------------------

const parser = unified().use(remarkParse).use(remarkMdx);
const fallbackParser = unified().use(remarkParse);

function parseFile(content) {
  try {
    return parser.parse(content);
  } catch {
    try {
      return fallbackParser.parse(content);
    } catch {
      return null;
    }
  }
}

function slugify(text) {
  return text
    .toLowerCase()
    .replace(/[^\w\s-]/g, "")
    .replace(/\s+/g, "-")
    .replace(/-+/g, "-")
    .replace(/^-|-$/g, "");
}

function extractSlug(content) {
  const match = content.match(/^slug:\s*(.+)$/m);
  return match ? match[1].trim() : null;
}

/**
 * Derive the URL prefix from a list of definition objects.
 * E.g., if a def has url `/docs/server-sdk/v3/node/reference/voice/call`
 * and slugRoot is `/node/`, the prefix is `/docs/server-sdk/v3`.
 */
function prefixFromDefs(defs, slugRoot) {
  for (const def of defs) {
    const url = typeof def === "string" ? def : def.url;
    if (!url || url.startsWith("#") || !url.startsWith("/docs/")) continue;
    const idx = url.indexOf(slugRoot);
    if (idx > 0) return url.slice(0, idx);
  }
  return null;
}

/**
 * Derive URL prefix for a file. Checks the file's own refs first,
 * then falls back to sibling and parent directory files.
 */
function deriveUrlPrefix(definitions, fileSlug, filePath) {
  const slugRoot = "/" + fileSlug.split("/").filter(Boolean)[0] + "/";

  // 1. Check this file's own definitions
  const own = prefixFromDefs(definitions, slugRoot);
  if (own) return own;

  // 2. Check sibling files in same directory
  const dir = dirname(filePath);
  for (const [path, info] of fileInfo) {
    if (dirname(path) === dir && path !== filePath) {
      const content = readFileSync(path, "utf-8");
      const refLines = content.match(/^\[.+\]:\s+\/.+$/gm) || [];
      const found = prefixFromDefs(refLines.map(l => ({ url: l.replace(/^\[.+\]:\s+/, "") })), slugRoot);
      if (found) return found;
    }
  }

  // 3. Check parent directory files
  const parentDir = dirname(dir);
  for (const [path, info] of fileInfo) {
    if (dirname(path) === parentDir) {
      const content = readFileSync(path, "utf-8");
      const refLines = content.match(/^\[.+\]:\s+\/.+$/gm) || [];
      const found = prefixFromDefs(refLines.map(l => ({ url: l.replace(/^\[.+\]:\s+/, "") })), slugRoot);
      if (found) return found;
    }
  }

  return "";
}

function extractHeadingAnchors(tree) {
  const anchors = new Set();
  visit(tree, "heading", (node) => {
    // Check for explicit Fern anchor syntax [#anchor-id]
    let text = "";
    visit(node, "text", (t) => { text += t.value; });
    visit(node, "inlineCode", (t) => { text += t.value; });
    const explicitMatch = text.match(/\[#([^\]]+)\]/);
    if (explicitMatch) {
      anchors.add(explicitMatch[1]);
    } else if (text.trim()) {
      anchors.add(slugify(text.trim()));
    }
  });
  return anchors;
}

// Walk all MDX files and build a map: directory → { slug, headingAnchors, methods: Map<anchorName, slug> }
function walkMdx(dir) {
  const results = [];
  for (const entry of readdirSync(dir, { withFileTypes: true })) {
    const full = join(dir, entry.name);
    if (entry.isDirectory()) {
      results.push(...walkMdx(full));
    } else if (entry.name.endsWith(".mdx")) {
      results.push(full);
    }
  }
  return results;
}

// Build sibling method index per directory group
// For a file at .../call/methods/connect.mdx with slug /node/reference/voice/call/connect,
// we want to know that from any sibling in that methods/ dir,
// the anchor #connect maps to slug /node/reference/voice/call/connect

const allFiles = walkMdx(FERN_DIR);

// Map: filePath → { slug, headingAnchors }
const fileInfo = new Map();
// Map: dirPath → Map<anchor, slug> (sibling methods + parent index + events)
const dirSiblings = new Map();

for (const filePath of allFiles) {
  const content = readFileSync(filePath, "utf-8");
  const slug = extractSlug(content);
  if (!slug) continue;

  const tree = parseFile(content);
  const headingAnchors = tree ? extractHeadingAnchors(tree) : new Set();

  fileInfo.set(filePath, { slug, headingAnchors, content });
}

// Build sibling maps for method directories
// Pattern: methods/ dir siblings, plus parent-level index.mdx and events.mdx
for (const [filePath, info] of fileInfo) {
  const dir = dirname(filePath);
  const parentDir = dirname(dir);
  const dirName = dir.split(/[\\/]/).pop();

  // For files in a methods/ directory, register their slug under multiple anchor forms
  if (dirName === "methods") {
    if (!dirSiblings.has(dir)) dirSiblings.set(dir, new Map());
    const siblings = dirSiblings.get(dir);

    // The method name from the slug (last segment)
    const slugParts = info.slug.split("/");
    const methodSlugName = slugParts[slugParts.length - 1];

    // Register under the slug-form anchor (e.g., "connect-phone")
    // Method pages are self-contained — no need to append heading anchors
    siblings.set(methodSlugName, info.slug);

    // Also register heading anchors from this file (pointing to page, not page#anchor)
    for (const anchor of info.headingAnchors) {
      siblings.set(anchor, info.slug);
    }

    // Also add parent-level pages (index, events) as reachable
    const parentIndex = join(parentDir, "index.mdx");
    const parentEvents = join(parentDir, "events.mdx");

    if (fileInfo.has(parentIndex)) {
      const parentInfo = fileInfo.get(parentIndex);
      siblings.set("", parentInfo.slug); // #  → parent index
      // Also register parent heading anchors
      for (const anchor of parentInfo.headingAnchors) {
        if (!siblings.has(anchor)) {
          siblings.set(anchor, parentInfo.slug + "#" + anchor);
        }
      }
    }
    if (fileInfo.has(parentEvents)) {
      const eventsInfo = fileInfo.get(parentEvents);
      siblings.set("events", eventsInfo.slug);
      for (const anchor of eventsInfo.headingAnchors) {
        if (!siblings.has(anchor)) {
          siblings.set(anchor, eventsInfo.slug + "#" + anchor);
        }
      }
    }
  }

  // For files in a class directory (not methods/), also register siblings
  // E.g., call/index.mdx should know about call/events.mdx
  if (dirName !== "methods") {
    const methodsDir = join(dir, "methods");
    // Check if this dir has a methods/ subdirectory by looking for known files
    if (!dirSiblings.has(dir)) dirSiblings.set(dir, new Map());
    const siblings = dirSiblings.get(dir);

    const slugParts = info.slug.split("/");
    const name = slugParts[slugParts.length - 1];
    siblings.set(name, info.slug);
  }
}

// Also register method slugs accessible from parent-level files (index.mdx, events.mdx)
// E.g., from call/events.mdx, #connectphone should resolve to call/connect-phone
for (const [filePath, info] of fileInfo) {
  const dir = dirname(filePath);
  const methodsDir = join(dir, "methods");

  if (dirSiblings.has(methodsDir)) {
    if (!dirSiblings.has(dir)) dirSiblings.set(dir, new Map());
    const parentSiblings = dirSiblings.get(dir);
    const methodSiblings = dirSiblings.get(methodsDir);

    for (const [anchor, slug] of methodSiblings) {
      if (!parentSiblings.has(anchor)) {
        parentSiblings.set(anchor, slug);
      }
    }
  }
}

// ---------------------------------------------------------------------------
// Process stale anchors: for each file, find definitions pointing to local
// anchors that don't exist on this page, and try to resolve them
// ---------------------------------------------------------------------------

let totalFixed = 0;
let totalUnresolved = 0;
const unresolved = [];

for (const [filePath, info] of fileInfo) {
  const { content, headingAnchors } = info;
  const rawContent = readFileSync(filePath, "utf-8");
  const hasCRLF = rawContent.includes("\r\n");
  const normalizedContent = hasCRLF ? rawContent.replace(/\r\n/g, "\n") : rawContent;

  const tree = parseFile(normalizedContent);
  if (!tree) continue;

  // Find definitions and usages
  const definitions = [];
  const usages = new Set();

  visit(tree, (node) => {
    if (node.type === "definition" && node.position) {
      definitions.push({
        label: node.label?.toLowerCase(),
        url: node.url,
        line: node.position.start.line - 1,
      });
    } else if (node.type === "linkReference" || node.type === "imageReference") {
      const label = node.label?.toLowerCase() || node.identifier?.toLowerCase();
      if (label) usages.add(label);
    }
  });

  // Find stale local anchor definitions (used but anchor doesn't exist on page)
  const dir = dirname(filePath);
  const siblings = dirSiblings.get(dir) || new Map();
  const replacements = new Map(); // line → new URL

  // Derive URL prefix from existing /docs/ refs in this file (or siblings/parent)
  const urlPrefix = deriveUrlPrefix(definitions, info.slug, filePath);

  for (const def of definitions) {
    if (!def.url.startsWith("#")) continue;
    if (!usages.has(def.label)) continue;

    const anchor = def.url.slice(1); // remove #

    // Check if anchor exists on this page
    if (headingAnchors.has(anchor)) continue;
    // # self-references are valid on class-level pages, but stale on method subpages
    const dirName = dir.split(/[\\/]/).pop();
    if (anchor === "" && dirName !== "methods") continue;

    // Try to resolve via siblings
    let resolved = siblings.get(anchor);
    if (!resolved) {
      // Try camelCase → kebab-case conversion
      const kebab = anchor.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase();
      resolved = siblings.get(kebab);
    }
    if (!resolved && anchor === "") {
      resolved = siblings.get("");
    }

    if (resolved) {
      replacements.set(def.line, { oldUrl: def.url, newUrl: urlPrefix + resolved, label: def.label });
    } else {
      unresolved.push({ file: relative(ROOT, filePath), label: def.label, anchor: def.url });
      totalUnresolved++;
    }
  }

  if (replacements.size === 0) continue;

  const lines = normalizedContent.split("\n");
  let fileFixCount = 0;

  for (const [lineIdx, { oldUrl, newUrl, label }] of replacements) {
    const line = lines[lineIdx];
    // Replace the URL in the definition line: [label]: oldUrl → [label]: newUrl
    const defPattern = new RegExp(
      `^(\\[${escapeRegex(label)}\\]:\\s*)${escapeRegex(oldUrl)}(\\s*)$`,
      "i"
    );
    // Also try without trailing space
    const defPattern2 = new RegExp(
      `^(\\[${escapeRegex(label)}\\]:\\s*)${escapeRegex(oldUrl)}(.*)$`,
      "i"
    );
    const match = line.match(defPattern) || line.match(defPattern2);
    if (match) {
      lines[lineIdx] = `${match[1]}${newUrl}${match[2]}`;
      fileFixCount++;
    }
  }

  if (fileFixCount === 0) continue;

  const relPath = relative(ROOT, filePath);
  if (dryRun) {
    for (const [, { oldUrl, newUrl, label }] of replacements) {
      console.log(`[DRY RUN] ${relPath}: [${label}]: ${oldUrl} → ${newUrl}`);
    }
  } else {
    const eol = hasCRLF ? "\r\n" : "\n";
    writeFileSync(filePath, lines.join(eol), "utf-8");
    console.log(`${relPath}: fixed ${fileFixCount} stale anchor(s)`);
  }

  totalFixed += fileFixCount;
}

console.log("");
console.log(`${dryRun ? "[DRY RUN] " : ""}Total: ${totalFixed} stale anchors fixed.`);

if (unresolved.length > 0) {
  console.log(`\n${totalUnresolved} unresolved (need manual review):`);
  for (const { file, label, anchor } of unresolved) {
    console.log(`  ${file}: [${label}]: ${anchor}`);
  }
}

function escapeRegex(str) {
  return str.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}
