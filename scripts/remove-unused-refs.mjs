#!/usr/bin/env node

/**
 * Remove unused reference-style link definitions from MDX files.
 *
 * Uses remark AST for detection (handles code blocks, JSX, etc. automatically)
 * and line-based editing for removal (preserves original formatting).
 *
 * Usage:
 *   node scripts/remove-unused-refs.mjs --dry-run path/to/file.mdx   # Single file preview
 *   node scripts/remove-unused-refs.mjs --dry-run                     # Full preview
 *   node scripts/remove-unused-refs.mjs                                # Execute + report
 */

import { readFileSync, writeFileSync, mkdirSync, readdirSync } from "fs";
import { join, relative } from "path";
import { unified } from "unified";
import remarkParse from "remark-parse";
import remarkMdx from "remark-mdx";
import { visit } from "unist-util-visit";

const ROOT = join(import.meta.dirname, "..");
const FERN_DIR = join(ROOT, "fern");

// ---------------------------------------------------------------------------
// CLI
// ---------------------------------------------------------------------------

const args = process.argv.slice(2);
const dryRun = args.includes("--dry-run");
const fileArgs = args.filter((a) => !a.startsWith("--"));

// ---------------------------------------------------------------------------
// Collect MDX files
// ---------------------------------------------------------------------------

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

const files =
  fileArgs.length > 0
    ? fileArgs.map((f) => join(process.cwd(), f))
    : walkMdx(FERN_DIR);

// ---------------------------------------------------------------------------
// AST parser (lenient — ignores MDX parse errors)
// ---------------------------------------------------------------------------

const parser = unified().use(remarkParse).use(remarkMdx);

function parseFile(content) {
  try {
    return parser.parse(content);
  } catch {
    // MDX parse errors → fall back to markdown-only parse
    try {
      return unified().use(remarkParse).parse(content);
    } catch {
      return null;
    }
  }
}

// ---------------------------------------------------------------------------
// Analyse a single file
// ---------------------------------------------------------------------------

function analyseFile(filePath) {
  const rawContent = readFileSync(filePath, "utf-8");
  const hasCRLF = rawContent.includes("\r\n");
  // Normalize to LF for processing; restore original line endings on write
  const content = hasCRLF ? rawContent.replace(/\r\n/g, "\n") : rawContent;
  const tree = parseFile(content);
  if (!tree) return null;

  // Collect definitions: label → { url, line (0-based) }
  const definitions = new Map();
  // Collect usages: Set of lowercase labels
  const usages = new Set();
  // Collect heading anchors (auto-generated ids)
  const headingAnchors = new Set();

  visit(tree, (node) => {
    if (node.type === "definition") {
      // Reference definitions: [label]: url
      const label = node.label?.toLowerCase();
      if (label && node.position) {
        // May have duplicate labels — track all lines
        if (!definitions.has(label)) {
          definitions.set(label, []);
        }
        definitions.get(label).push({
          url: node.url,
          line: node.position.start.line - 1, // 0-based
        });
      }
    } else if (node.type === "linkReference" || node.type === "imageReference") {
      const label = node.label?.toLowerCase() || node.identifier?.toLowerCase();
      if (label) usages.add(label);
    } else if (node.type === "heading") {
      // Extract auto-generated anchor from heading text
      const text = headingText(node);
      if (text) {
        headingAnchors.add("#" + slugify(text));
      }
    }
  });

  return { content, definitions, usages, headingAnchors, hasCRLF };
}

// Extract plain text from a heading node
function headingText(node) {
  let text = "";
  visit(node, "text", (t) => {
    text += t.value;
  });
  visit(node, "inlineCode", (t) => {
    text += t.value;
  });
  return text.trim();
}

// Simple GitHub-style slug generation
function slugify(text) {
  return text
    .toLowerCase()
    .replace(/[^\w\s-]/g, "")
    .replace(/\s+/g, "-")
    .replace(/-+/g, "-")
    .replace(/^-|-$/g, "");
}

// ---------------------------------------------------------------------------
// Process files
// ---------------------------------------------------------------------------

let totalRemoved = 0;
let totalFilesModified = 0;
const staleAnchors = []; // { file, label, anchor }

for (const filePath of files) {
  const result = analyseFile(filePath);
  if (!result) continue;

  const { content, definitions, usages, headingAnchors, hasCRLF } = result;

  // Lines to remove (0-based indices)
  const linesToRemove = new Set();
  let fileRemovedCount = 0;

  for (const [label, entries] of definitions) {
    const isUsed = usages.has(label);

    if (!isUsed) {
      // Unused — mark all definition lines for removal
      for (const entry of entries) {
        linesToRemove.add(entry.line);
        fileRemovedCount++;
      }
    } else {
      // Used — check for stale local anchors
      for (const entry of entries) {
        if (entry.url.startsWith("#")) {
          if (!headingAnchors.has(entry.url)) {
            staleAnchors.push({
              file: relative(ROOT, filePath),
              label,
              anchor: entry.url,
            });
          }
        }
      }
    }
  }

  if (fileRemovedCount === 0) continue;

  const relPath = relative(ROOT, filePath);
  const lines = content.split("\n");

  // Remove definition lines
  const newLines = lines.filter((_, i) => !linesToRemove.has(i));

  // Collapse runs of 3+ consecutive blank lines into 2
  const collapsed = [];
  let blankRun = 0;
  for (const line of newLines) {
    if (line.trim() === "") {
      blankRun++;
      if (blankRun <= 2) collapsed.push(line);
    } else {
      blankRun = 0;
      collapsed.push(line);
    }
  }

  // Trim trailing blank lines (keep exactly one trailing newline)
  while (collapsed.length > 0 && collapsed[collapsed.length - 1].trim() === "") {
    collapsed.pop();
  }
  collapsed.push(""); // final newline

  if (dryRun) {
    console.log(`[DRY RUN] ${relPath}: would remove ${fileRemovedCount} unused ref(s)`);
  } else {
    const eol = hasCRLF ? "\r\n" : "\n";
    writeFileSync(filePath, collapsed.join(eol), "utf-8");
    console.log(`${relPath}: removed ${fileRemovedCount} unused ref(s)`);
  }

  totalRemoved += fileRemovedCount;
  totalFilesModified++;
}

// ---------------------------------------------------------------------------
// Summary
// ---------------------------------------------------------------------------

console.log("");
console.log(
  `${dryRun ? "[DRY RUN] " : ""}Total: ${totalRemoved} unused refs removed across ${totalFilesModified} files.`
);

// ---------------------------------------------------------------------------
// Stale anchor report
// ---------------------------------------------------------------------------

if (staleAnchors.length > 0 && !dryRun) {
  const reportDir = join(ROOT, "reports");
  mkdirSync(reportDir, { recursive: true });
  const reportPath = join(reportDir, "stale-anchors.md");

  const lines = [
    "# Stale Local Anchor References",
    "",
    "Ref definitions that ARE used in content but point to a local `#anchor`",
    "that doesn't exist as a heading on the page. These likely reference methods",
    "that moved to subpages during the SDK page split.",
    "",
    "**Action:** Review and update URLs in Stage 2.",
    "",
    "| File | Label | Anchor |",
    "|------|-------|--------|",
  ];

  for (const { file, label, anchor } of staleAnchors) {
    lines.push(`| ${file} | \`${label}\` | \`${anchor}\` |`);
  }

  lines.push("");
  writeFileSync(reportPath, lines.join("\n"), "utf-8");
  console.log(`\nStale anchor report: ${relative(ROOT, reportPath)} (${staleAnchors.length} entries)`);
} else if (staleAnchors.length > 0 && dryRun) {
  console.log(`\n[DRY RUN] Would report ${staleAnchors.length} stale local anchor refs.`);
}
