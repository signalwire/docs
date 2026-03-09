#!/usr/bin/env node

/**
 * fix-internal-links.mjs
 *
 * AST-based URL replacement for Docusaurus→Fern migration.
 * Parses MDX files, finds internal links matching old URLs from CSV mappings,
 * and replaces them with new Fern URLs — preserving file formatting and anchors.
 *
 * Usage:
 *   node scripts/fix-internal-links.mjs [--dry-run] [--verbose]
 */

import { readFileSync, writeFileSync, globSync } from "node:fs";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { unified } from "unified";
import remarkParse from "remark-parse";
import remarkMdx from "remark-mdx";
import { visit } from "unist-util-visit";
import { parse as csvParseSync } from "csv-parse/sync";

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, "..");

// ---------------------------------------------------------------------------
// CLI args
// ---------------------------------------------------------------------------
const args = process.argv.slice(2);
const DRY_RUN = args.includes("--dry-run");
const VERBOSE = args.includes("--verbose");
if (args.includes("--help")) {
  console.log(`Usage: node scripts/fix-internal-links.mjs [options]

Options:
  --dry-run     Report what would change, don't modify files
  --verbose     Show per-replacement detail
  --help        Show this help

CSV paths (hardcoded, both always loaded):
  slugs/slug-final-report-1.2.csv
  slugs/REST-UPDATED.csv`);
  process.exit(0);
}

// ---------------------------------------------------------------------------
// Phase 1: Load CSVs → Build Combined URL Map
// ---------------------------------------------------------------------------

function normalizePath(p) {
  if (!p) return "";
  // Extract pathname from full URLs
  try {
    if (p.startsWith("http://") || p.startsWith("https://")) {
      p = new URL(p).pathname;
    }
  } catch {
    // not a URL, use as-is
  }
  // Strip trailing slash (but keep "/" as "/")
  if (p.length > 1 && p.endsWith("/")) {
    p = p.slice(0, -1);
  }
  // Ensure leading slash
  if (p && !p.startsWith("/")) {
    p = "/" + p;
  }
  return p;
}

function loadSlugReport(filePath) {
  const raw = readFileSync(filePath, "utf8");
  const records = csvParseSync(raw, {
    columns: false,
    relax_column_count: true,
    skip_empty_lines: true,
  });

  // First row is the (multiline) header — skip it
  const entries = [];
  for (let i = 1; i < records.length; i++) {
    const row = records[i];
    const oldUrl = normalizePath(row[1]);
    const newUrl = normalizePath(row[18]);
    if (!oldUrl || !newUrl) continue;
    if (oldUrl === newUrl) continue;
    entries.push([oldUrl, newUrl]);
  }
  return entries;
}

function loadRestCsv(filePath) {
  const raw = readFileSync(filePath, "utf8");
  const records = csvParseSync(raw, {
    columns: false,
    relax_column_count: true,
    skip_empty_lines: true,
  });

  const entries = [];
  for (let i = 1; i < records.length; i++) {
    const row = records[i];
    const oldUrl = normalizePath(row[0]);
    const newUrl = normalizePath(row[1]);
    if (!oldUrl || !newUrl) continue;
    if (oldUrl === newUrl) continue;
    entries.push([oldUrl, newUrl]);
  }
  return entries;
}

function buildUrlMap() {
  const map = new Map();
  const conflicts = [];

  // File 1 first (takes precedence for conflicts)
  const file1 = resolve(ROOT, "slugs/slug-final-report-1.2.csv");
  const entries1 = loadSlugReport(file1);
  for (const [oldUrl, newUrl] of entries1) {
    if (!map.has(oldUrl)) {
      map.set(oldUrl, newUrl);
    }
  }

  // File 2
  const file2 = resolve(ROOT, "slugs/REST-UPDATED.csv");
  const entries2 = loadRestCsv(file2);
  for (const [oldUrl, newUrl] of entries2) {
    if (map.has(oldUrl)) {
      const existing = map.get(oldUrl);
      if (existing !== newUrl) {
        conflicts.push({ oldUrl, file1Target: existing, file2Target: newUrl });
      }
      // File 1 takes precedence, skip
    } else {
      map.set(oldUrl, newUrl);
    }
  }

  if (conflicts.length > 0) {
    console.warn(`\n⚠ ${conflicts.length} conflict(s) between CSV files (File 1 wins):`);
    for (const c of conflicts) {
      console.warn(`  ${c.oldUrl}: File1→${c.file1Target} vs File2→${c.file2Target}`);
    }
  }

  return map;
}

// ---------------------------------------------------------------------------
// Phase 2: Walk MDX Files → Parse AST → Find Matching Links
// ---------------------------------------------------------------------------

function lookupUrl(rawUrl, urlMap) {
  // Only handle internal links (starting with /)
  if (!rawUrl || !rawUrl.startsWith("/")) return null;

  // Split off fragment
  const hashIdx = rawUrl.indexOf("#");
  let pathPart, fragment;
  if (hashIdx >= 0) {
    pathPart = rawUrl.slice(0, hashIdx);
    fragment = rawUrl.slice(hashIdx);
  } else {
    pathPart = rawUrl;
    fragment = "";
  }

  // Normalize
  const normalized = normalizePath(pathPart);
  const newPath = urlMap.get(normalized);
  if (newPath) {
    return newPath + fragment;
  }
  return null;
}

function findReplacements(source, urlMap) {
  let tree;
  try {
    tree = unified().use(remarkParse).use(remarkMdx).parse(source);
  } catch (err) {
    return { error: err.message, replacements: [] };
  }

  const replacements = [];

  visit(tree, (node) => {
    // Markdown links: [text](/url)
    if (node.type === "link" && node.url && node.position) {
      const newUrl = lookupUrl(node.url, urlMap);
      if (newUrl) {
        const replacement = findMarkdownLinkReplacement(
          source,
          node,
          node.url,
          newUrl
        );
        if (replacement) replacements.push(replacement);
      }
    }

    // Reference-style definitions: [label]: /url
    if (node.type === "definition" && node.url && node.position) {
      const newUrl = lookupUrl(node.url, urlMap);
      if (newUrl) {
        const replacement = findDefinitionReplacement(
          source,
          node,
          node.url,
          newUrl
        );
        if (replacement) replacements.push(replacement);
      }
    }

    // JSX elements: <Card href="/url">, <a href="/url">, etc.
    if (
      (node.type === "mdxJsxFlowElement" ||
        node.type === "mdxJsxTextElement") &&
      node.attributes &&
      node.position
    ) {
      for (const attr of node.attributes) {
        if (
          attr.type === "mdxJsxAttribute" &&
          attr.name === "href" &&
          typeof attr.value === "string"
        ) {
          const newUrl = lookupUrl(attr.value, urlMap);
          if (newUrl) {
            const replacement = findJsxHrefReplacement(
              source,
              node,
              attr.value,
              newUrl
            );
            if (replacement) replacements.push(replacement);
          }
        }
        // Handle expression syntax: href={"/url"}
        if (
          attr.type === "mdxJsxAttribute" &&
          attr.name === "href" &&
          attr.value &&
          typeof attr.value === "object" &&
          attr.value.type === "mdxJsxAttributeValueExpression"
        ) {
          const exprValue = attr.value.value;
          // Extract string from expression like '"/url"' or '"/url"'
          const match = exprValue.match(/^["'](.+?)["']$/);
          if (match) {
            const innerUrl = match[1];
            const newUrl = lookupUrl(innerUrl, urlMap);
            if (newUrl) {
              const replacement = findJsxHrefExprReplacement(
                source,
                node,
                innerUrl,
                newUrl
              );
              if (replacement) replacements.push(replacement);
            }
          }
        }
      }
    }
  });

  return { error: null, replacements };
}

/**
 * Find the exact position of the URL in a markdown link [text](url)
 */
function findMarkdownLinkReplacement(source, node, oldUrl, newUrl) {
  const start = node.position.start.offset;
  const end = node.position.end.offset;
  const slice = source.slice(start, end);

  // Find the last "](" in the slice to locate the URL
  const parenIdx = slice.lastIndexOf("](");
  if (parenIdx < 0) return null;

  const urlStart = start + parenIdx + 2;
  // Find closing ")" — but account for the URL possibly having a title
  const closeParen = source.indexOf(")", urlStart);
  if (closeParen < 0) return null;

  // The URL is between urlStart and the first space or closeParen
  const urlSlice = source.slice(urlStart, closeParen);
  // URL might have a title like: /path "title" — just find our URL
  const urlEndInSlice = urlSlice.indexOf(oldUrl);
  if (urlEndInSlice < 0) return null;

  const replaceStart = urlStart + urlEndInSlice;
  const replaceEnd = replaceStart + oldUrl.length;

  return {
    startOffset: replaceStart,
    endOffset: replaceEnd,
    oldUrl,
    newUrl,
    context: slice.slice(0, 60),
  };
}

/**
 * Find the exact position of the URL in a definition [label]: /url
 */
function findDefinitionReplacement(source, node, oldUrl, newUrl) {
  const start = node.position.start.offset;
  const end = node.position.end.offset;
  const slice = source.slice(start, end);

  // Find "]: " pattern
  const colonIdx = slice.indexOf("]: ");
  if (colonIdx < 0) return null;

  const urlStart = start + colonIdx + 3;
  // Find the old URL in the remainder
  const remainder = source.slice(urlStart, end);
  const urlIdx = remainder.indexOf(oldUrl);
  if (urlIdx < 0) return null;

  const replaceStart = urlStart + urlIdx;
  const replaceEnd = replaceStart + oldUrl.length;

  return {
    startOffset: replaceStart,
    endOffset: replaceEnd,
    oldUrl,
    newUrl,
    context: slice.slice(0, 60),
  };
}

/**
 * Find the exact position of href="url" in a JSX element
 */
function findJsxHrefReplacement(source, node, oldUrl, newUrl) {
  const start = node.position.start.offset;
  const end = node.position.end.offset;
  const slice = source.slice(start, end);

  // Find href="oldUrl" or href='oldUrl'
  // Try double quotes first
  let hrefPattern = `href="${oldUrl}"`;
  let hrefIdx = slice.indexOf(hrefPattern);
  if (hrefIdx < 0) {
    // Try single quotes
    hrefPattern = `href='${oldUrl}'`;
    hrefIdx = slice.indexOf(hrefPattern);
  }
  if (hrefIdx < 0) return null;

  // We want to replace just the URL inside the quotes
  const quoteChar = slice[hrefIdx + 5]; // char after href=
  const urlStartInSlice = hrefIdx + 6; // after href="
  const replaceStart = start + urlStartInSlice;
  const replaceEnd = replaceStart + oldUrl.length;

  return {
    startOffset: replaceStart,
    endOffset: replaceEnd,
    oldUrl,
    newUrl,
    context: slice.slice(Math.max(0, hrefIdx - 10), hrefIdx + hrefPattern.length + 10),
  };
}

/**
 * Find the exact position of href={"/url"} in a JSX element
 */
function findJsxHrefExprReplacement(source, node, oldUrl, newUrl) {
  const start = node.position.start.offset;
  const end = node.position.end.offset;
  const slice = source.slice(start, end);

  // Find href={"oldUrl"} or href={'oldUrl'}
  let patterns = [`href={"${oldUrl}"}`, `href={'${oldUrl}'}`];
  for (const pattern of patterns) {
    const idx = slice.indexOf(pattern);
    if (idx >= 0) {
      // Replace just the URL inside the quotes inside braces
      const urlStartInSlice = idx + 7; // after href={"
      const replaceStart = start + urlStartInSlice;
      const replaceEnd = replaceStart + oldUrl.length;

      return {
        startOffset: replaceStart,
        endOffset: replaceEnd,
        oldUrl,
        newUrl,
        context: slice.slice(Math.max(0, idx - 10), idx + pattern.length + 10),
      };
    }
  }
  return null;
}

// ---------------------------------------------------------------------------
// Phase 3: Apply Replacements
// ---------------------------------------------------------------------------

function applyReplacements(source, replacements) {
  // Sort by startOffset descending so we can splice end-to-start
  const sorted = [...replacements].sort(
    (a, b) => b.startOffset - a.startOffset
  );

  let result = source;
  for (const r of sorted) {
    result =
      result.slice(0, r.startOffset) + r.newUrl + result.slice(r.endOffset);
  }
  return result;
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

function main() {
  console.log("Loading URL mappings from CSV files...");
  const urlMap = buildUrlMap();
  console.log(`  Combined URL map: ${urlMap.size} active mappings\n`);

  // Gather MDX files
  const productFiles = globSync("fern/products/**/*.mdx", { cwd: ROOT });
  const snippetFiles = globSync("fern/snippets/**/*.mdx", { cwd: ROOT });
  const allFiles = [...productFiles, ...snippetFiles].sort();
  console.log(
    `Scanning ${allFiles.length} MDX files (${productFiles.length} product + ${snippetFiles.length} snippet)...\n`
  );

  let totalFilesModified = 0;
  let totalReplacements = 0;
  let totalErrors = 0;
  const matchedOldUrls = new Set();
  const modifiedFilesList = [];

  for (const relPath of allFiles) {
    const absPath = resolve(ROOT, relPath);
    let source = readFileSync(absPath, "utf8");

    // Strip BOM
    if (source.charCodeAt(0) === 0xfeff) {
      source = source.slice(1);
    }

    const { error, replacements } = findReplacements(source, urlMap);

    if (error) {
      totalErrors++;
      if (VERBOSE) {
        console.warn(`  ⚠ Parse error in ${relPath}: ${error}`);
      }
      continue;
    }

    if (replacements.length === 0) continue;

    totalFilesModified++;
    totalReplacements += replacements.length;
    modifiedFilesList.push({ file: relPath, count: replacements.length });

    for (const r of replacements) {
      matchedOldUrls.add(r.oldUrl);
    }

    if (VERBOSE) {
      console.log(`  ${relPath} (${replacements.length} replacement(s)):`);
      for (const r of replacements) {
        console.log(`    ${r.oldUrl} → ${r.newUrl}`);
      }
    }

    if (!DRY_RUN) {
      const modified = applyReplacements(source, replacements);
      writeFileSync(absPath, modified, "utf8");
    }
  }

  // Summary
  console.log("\n" + "=".repeat(60));
  console.log(DRY_RUN ? "DRY RUN SUMMARY" : "SUMMARY");
  console.log("=".repeat(60));
  console.log(`Files scanned:    ${allFiles.length}`);
  console.log(`Files modified:   ${totalFilesModified}`);
  console.log(`Total replacements: ${totalReplacements}`);
  console.log(`Parse errors:     ${totalErrors}`);
  console.log(
    `Unique old URLs matched: ${matchedOldUrls.size} / ${urlMap.size} in map`
  );

  if (modifiedFilesList.length > 0 && !VERBOSE) {
    console.log("\nModified files:");
    for (const { file, count } of modifiedFilesList) {
      console.log(`  ${file} (${count})`);
    }
  }

  // Unmatched URLs report
  const unmatchedCount = urlMap.size - matchedOldUrls.size;
  if (unmatchedCount > 0 && VERBOSE) {
    console.log(`\nUnmatched old URLs in map (${unmatchedCount}):`);
    for (const [oldUrl] of urlMap) {
      if (!matchedOldUrls.has(oldUrl)) {
        console.log(`  ${oldUrl} → ${urlMap.get(oldUrl)}`);
      }
    }
  } else if (unmatchedCount > 0) {
    console.log(
      `\n${unmatchedCount} old URLs in map were not found in any file (use --verbose to list)`
    );
  }

  console.log("");
}

main();
