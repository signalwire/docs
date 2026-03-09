#!/usr/bin/env node

/**
 * Generate a CSV of broken links found in MDX files.
 * Two categories:
 *   1. Links pointing to URLs that 404 (from the replacement script)
 *   2. Links using .mdx file paths instead of slugs
 */

import { readFileSync, writeFileSync, globSync } from "node:fs";
import { resolve, dirname, relative } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, "..");
const FERN = resolve(ROOT, "fern");

// Load the list of 404 URLs
const notFoundUrls = new Set(
  readFileSync("/tmp/404-urls.txt", "utf8")
    .trim()
    .split("\n")
    .filter(Boolean)
);

// Gather all MDX files
const allFiles = [
  ...globSync("fern/products/**/*.mdx", { cwd: ROOT }),
  ...globSync("fern/snippets/**/*.mdx", { cwd: ROOT }),
].sort();

// Extract product from path like fern/products/swml/pages/...
function getProduct(relPath) {
  const m = relPath.match(/^fern\/products\/([^/]+)\//);
  if (m) return m[1];
  if (relPath.startsWith("fern/snippets/")) return "snippets";
  return "";
}

// Extract slug from frontmatter
function getSlug(source) {
  const fmMatch = source.match(/^---\r?\n([\s\S]*?)\r?\n---/);
  if (!fmMatch) return "";
  const slugMatch = fmMatch[1].match(/^slug:\s*(.+)$/m);
  if (slugMatch) return slugMatch[1].trim();
  return "";
}

const rows = [];

for (const relPath of allFiles) {
  const absPath = resolve(ROOT, relPath);
  let source = readFileSync(absPath, "utf8");
  if (source.charCodeAt(0) === 0xfeff) source = source.slice(1);

  const product = getProduct(relPath);
  const slug = getSlug(source);
  const fernPath = relative(FERN, absPath);

  // 1. Check for 404 URLs in markdown links and JSX hrefs
  // Markdown links: [text](/url)
  const mdLinkRe = /\]\(([^)\s]+)/g;
  let match;
  while ((match = mdLinkRe.exec(source)) !== null) {
    const url = match[1].replace(/#.*/, ""); // strip anchor
    if (notFoundUrls.has(url)) {
      rows.push({ file: fernPath, product, slug, brokenLink: match[1], type: "404" });
    }
  }

  // JSX href="..." or href='...'
  const jsxHrefRe = /href=["']([^"']+)["']/g;
  while ((match = jsxHrefRe.exec(source)) !== null) {
    const url = match[1].replace(/#.*/, "");
    if (notFoundUrls.has(url)) {
      rows.push({ file: fernPath, product, slug, brokenLink: match[1], type: "404" });
    }
  }

  // JSX href={"/url"}
  const jsxHrefExprRe = /href=\{["']([^"']+)["']\}/g;
  while ((match = jsxHrefExprRe.exec(source)) !== null) {
    const url = match[1].replace(/#.*/, "");
    if (notFoundUrls.has(url)) {
      rows.push({ file: fernPath, product, slug, brokenLink: match[1], type: "404" });
    }
  }

  // 2. Check for .mdx file-path links
  // Markdown links to .mdx files
  const mdxLinkRe = /\]\(([^)\s]*\.mdx[^)\s]*)\)/g;
  while ((match = mdxLinkRe.exec(source)) !== null) {
    rows.push({ file: fernPath, product, slug, brokenLink: match[1], type: "mdx-path" });
  }

  // JSX href to .mdx files
  const jsxMdxRe = /href=["']([^"']*\.mdx[^"']*)["']/g;
  while ((match = jsxMdxRe.exec(source)) !== null) {
    rows.push({ file: fernPath, product, slug, brokenLink: match[1], type: "mdx-path" });
  }
}

// Deduplicate by broken link — keep first occurrence only
const seen = new Set();
const deduped = rows.filter((r) => {
  if (seen.has(r.brokenLink)) return false;
  seen.add(r.brokenLink);
  return true;
});

// Write CSV
const csvLines = ["source_file,product,slug,broken_link,type"];
for (const r of deduped) {
  const escape = (s) => `"${s.replace(/"/g, '""')}"`;
  csvLines.push(
    [escape(r.file), escape(r.product), escape(r.slug), escape(r.brokenLink), escape(r.type)].join(",")
  );
}

const outPath = resolve(ROOT, "broken-links-report.csv");
writeFileSync(outPath, csvLines.join("\n") + "\n", "utf8");
console.log(`Written ${deduped.length} rows to ${outPath}`);
console.log(`  404 links: ${deduped.filter((r) => r.type === "404").length}`);
console.log(`  mdx-path links: ${deduped.filter((r) => r.type === "mdx-path").length}`);
