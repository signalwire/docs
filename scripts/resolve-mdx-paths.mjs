#!/usr/bin/env node

/**
 * Resolve .mdx file-path links to proper Fern slugs.
 *
 * Strategy:
 * 1. Resolve the relative .mdx path against the source file's directory in fern/
 * 2. If the resolved file exists in fern/, extract its frontmatter slug
 * 3. Combine with product base slug to get the full URL
 * 4. Output a CSV of: source_file, broken_link, resolved_file, new_slug
 */

import { readFileSync, existsSync } from "node:fs";
import { resolve, dirname, join, relative } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, "..");
const FERN = resolve(ROOT, "fern");

// Product base slugs from docs.yml
const PRODUCT_SLUGS = {
  "home": "",
  "apis": "apis",
  "swml": "swml",
  "agents-sdk": "agents-sdk",
  "realtime-sdk": "realtime-sdk",
  "browser-sdk": "browser-sdk",
  "platform": "platform",
  "compatibility-api": "compatibility-api",
  "call-flow-builder": "call-flow-builder",
};

function extractSlug(filePath) {
  if (!existsSync(filePath)) return null;
  const source = readFileSync(filePath, "utf8").replace(/^\uFEFF/, "");
  const fmMatch = source.match(/^---\r?\n([\s\S]*?)\r?\n---/);
  if (!fmMatch) return null;
  const slugMatch = fmMatch[1].match(/^slug:\s*(.+)$/m);
  if (slugMatch) return slugMatch[1].trim();
  return null;
}

function extractSidebarTitle(filePath) {
  if (!existsSync(filePath)) return null;
  const source = readFileSync(filePath, "utf8").replace(/^\uFEFF/, "");
  const fmMatch = source.match(/^---\r?\n([\s\S]*?)\r?\n---/);
  if (!fmMatch) return null;
  const m = fmMatch[1].match(/^sidebar-title:\s*(.+)$/m);
  if (m) return m[1].trim();
  return null;
}

// Read the broken links report
const csv = readFileSync(resolve(ROOT, "broken-links-report.csv"), "utf8");
const lines = csv.trim().split("\n").slice(1); // skip header

const results = [];

for (const line of lines) {
  // Parse CSV (simple — our values are quoted)
  const match = line.match(/"([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)"/);
  if (!match) continue;
  const [, sourceFile, product, sourceSlug, brokenLink, type] = match;
  if (type !== "mdx-path") continue;

  // Strip anchor from broken link
  const hashIdx = brokenLink.indexOf("#");
  const mdxPath = hashIdx >= 0 ? brokenLink.slice(0, hashIdx) : brokenLink;
  const anchor = hashIdx >= 0 ? brokenLink.slice(hashIdx) : "";

  // Resolve relative path against source file's directory in fern/
  const sourceDir = dirname(resolve(FERN, sourceFile));
  const resolvedAbs = resolve(sourceDir, mdxPath);
  const resolvedRel = relative(FERN, resolvedAbs);

  const fernFileExists = existsSync(resolvedAbs);
  const fernSlug = fernFileExists ? extractSlug(resolvedAbs) : null;

  // Build full URL
  let fullUrl = null;
  if (fernSlug !== null) {
    const productSlug = PRODUCT_SLUGS[product] || product;
    // Slug might already start with / or not
    const slugPart = fernSlug.startsWith("/") ? fernSlug : "/" + fernSlug;
    fullUrl = productSlug ? "/" + productSlug + slugPart + anchor : slugPart + anchor;
  }

  results.push({
    sourceFile,
    product,
    brokenLink,
    resolvedFile: resolvedRel,
    fileExists: fernFileExists,
    fernSlug,
    fullUrl,
  });
}

// Output
console.log("source_file,product,broken_link,resolved_file,file_exists,fern_slug,full_url");
for (const r of results) {
  const esc = (s) => `"${(s ?? "").toString().replace(/"/g, '""')}"`;
  console.log([
    esc(r.sourceFile),
    esc(r.product),
    esc(r.brokenLink),
    esc(r.resolvedFile),
    esc(r.fileExists),
    esc(r.fernSlug),
    esc(r.fullUrl),
  ].join(","));
}

// Summary
const found = results.filter(r => r.fullUrl);
const notFound = results.filter(r => !r.fullUrl);
console.error(`\nResolved: ${found.length} / ${results.length}`);
if (notFound.length > 0) {
  console.error(`Unresolved (${notFound.length}):`);
  for (const r of notFound) {
    console.error(`  ${r.sourceFile} → ${r.brokenLink} (resolved: ${r.resolvedFile}, exists: ${r.fileExists})`);
  }
}
