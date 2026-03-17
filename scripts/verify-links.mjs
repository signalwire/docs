#!/usr/bin/env node

/**
 * Link verification tool for Server SDK v2 documentation.
 *
 * Parses MDX files for each language variant, extracts all links,
 * and serves a browser UI to visually verify each one via iframe.
 *
 * Usage:
 *   node scripts/verify-links.mjs                    # Start server
 *   node scripts/verify-links.mjs --port 4000         # Custom port
 *   node scripts/verify-links.mjs --variant python     # Single variant
 *   node scripts/verify-links.mjs --reset              # Clear progress
 *   node scripts/verify-links.mjs --report             # Report only
 */

import { createServer } from "node:http";
import {
  readFileSync,
  writeFileSync,
  renameSync,
  unlinkSync,
  readdirSync,
  existsSync,
} from "node:fs";
import { join, dirname, resolve } from "node:path";
import { unified } from "unified";
import remarkParse from "remark-parse";
import remarkMdx from "remark-mdx";
import { visit } from "unist-util-visit";

const ROOT = join(import.meta.dirname, "..");
const YAML_PATH = join(
  ROOT,
  "fern/products/realtime-sdk/versions/v2.yml"
);
const YAML_DIR = dirname(YAML_PATH);
const PROGRESS_PATH = join(ROOT, "scripts/.link-verify-progress.json");
const REPORT_PATH = join(ROOT, "scripts/.link-verify-report.md");
const BASE_URL = "https://signalwire.com";

// ---------------------------------------------------------------------------
// CLI args
// ---------------------------------------------------------------------------

const args = process.argv.slice(2);
const portArg = args.indexOf("--port");
const PORT = portArg !== -1 ? parseInt(args[portArg + 1], 10) : 3456;
const variantFilter = (() => {
  const i = args.indexOf("--variant");
  return i !== -1 ? args[i + 1] : null;
})();
const resetMode = args.includes("--reset");
const reportMode = args.includes("--report");

// ---------------------------------------------------------------------------
// AST parser (reused from fix-stale-anchors.mjs)
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

function extractFrontmatter(content) {
  const match = content.match(/^---[\s\S]*?---/);
  if (!match) return { title: null, slug: null };
  const titleMatch = match[0].match(/^title:\s*(.+)$/m);
  const slugMatch = match[0].match(/^slug:\s*(.+)$/m);
  return {
    title: titleMatch ? titleMatch[1].trim().replace(/^["']|["']$/g, "") : null,
    slug: slugMatch ? slugMatch[1].trim() : null,
  };
}

// ---------------------------------------------------------------------------
// Navigation parser — reads v2.yml to get ordered file list per variant
// ---------------------------------------------------------------------------

function parseNavYaml() {
  const raw = readFileSync(YAML_PATH, "utf-8");
  const variants = [];
  const lines = raw.split("\n").map((l) => l.replace(/\r$/, ""));

  let currentVariant = null;
  let currentSection = null;

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];

    // Variant title (6 spaces indent)
    const variantMatch = line.match(/^\s{6}- title:\s*(.+)$/);
    if (variantMatch) {
      const title = variantMatch[1].trim().replace(/^["']|["']$/g, "");
      if (title === "Node.js") {
        currentVariant = null;
        continue;
      }
      currentVariant = { title, sections: [] };
      currentSection = null;
      variants.push(currentVariant);
      continue;
    }

    if (!currentVariant) continue;

    // Section (10 spaces indent)
    const sectionMatch = line.match(/^\s{10}- section:\s*(.+)$/);
    if (sectionMatch) {
      currentSection = sectionMatch[1].trim();
      continue;
    }

    // Explicit page entry (14 spaces indent)
    const pageMatch = line.match(/^\s{14}- page:\s*(.+)$/);
    if (pageMatch) {
      const pageTitle = pageMatch[1].trim();
      // Next line should have the path
      const pathLine = lines[i + 1] || "";
      const pathMatch = pathLine.match(/^\s+path:\s*(.+)$/);
      if (pathMatch) {
        const relPath = pathMatch[1].trim();
        const absPath = resolve(YAML_DIR, relPath);
        if (existsSync(absPath)) {
          currentVariant.sections.push({
            section: currentSection || "Core",
            title: pageTitle,
            filePath: absPath,
          });
        }
      }
      continue;
    }

    // Folder entry (10 spaces indent)
    const folderMatch = line.match(/^\s{10}- folder:\s*(.+)$/);
    if (folderMatch) {
      const folderRel = folderMatch[1].trim();
      const folderAbs = resolve(YAML_DIR, folderRel);
      // Next line might have title
      const titleLine = lines[i + 1] || "";
      const titleMatch = titleLine.match(/^\s+title:\s*(.+)$/);
      const folderSection = titleMatch
        ? titleMatch[1].trim()
        : currentSection || "Other";

      const files = walkFolderOrdered(folderAbs);
      for (const filePath of files) {
        const content = readFileSync(filePath, "utf-8");
        const fm = extractFrontmatter(content);
        const title = fm.title || fileToTitle(filePath);
        currentVariant.sections.push({
          section: folderSection,
          title,
          filePath,
        });
      }
      continue;
    }
  }

  return variants;
}

function walkFolderOrdered(dir) {
  if (!existsSync(dir)) return [];
  const results = [];
  const entries = readdirSync(dir, { withFileTypes: true });

  // index.mdx first
  const indexFile = entries.find(
    (e) => !e.isDirectory() && e.name === "index.mdx"
  );
  if (indexFile) results.push(join(dir, indexFile.name));

  // Other .mdx files alphabetically
  const mdxFiles = entries
    .filter(
      (e) => !e.isDirectory() && e.name.endsWith(".mdx") && e.name !== "index.mdx"
    )
    .sort((a, b) => a.name.localeCompare(b.name));
  for (const f of mdxFiles) results.push(join(dir, f.name));

  // Subdirectories alphabetically
  const dirs = entries
    .filter((e) => e.isDirectory())
    .sort((a, b) => a.name.localeCompare(b.name));
  for (const d of dirs) {
    results.push(...walkFolderOrdered(join(dir, d.name)));
  }

  return results;
}

function fileToTitle(filePath) {
  const name = filePath.split(/[\\/]/).pop().replace(/\.mdx$/, "");
  if (name === "index") return "Overview";
  return name
    .split("-")
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join(" ");
}

// ---------------------------------------------------------------------------
// Link extractor — extracts all links from an MDX file
// ---------------------------------------------------------------------------

function extractLinks(content) {
  const tree = parseFile(content);
  if (!tree) return [];
  const links = [];
  const contentLines = content.split("\n");

  function getSourceText(node) {
    if (!node.position) return null;
    const { start, end } = node.position;
    if (start.line === end.line) {
      return contentLines[start.line - 1]?.slice(start.column - 1, end.column - 1) || null;
    }
    // Multi-line: grab all lines
    const lines = [];
    for (let i = start.line - 1; i < end.line; i++) {
      if (i === start.line - 1) lines.push(contentLines[i]?.slice(start.column - 1));
      else if (i === end.line - 1) lines.push(contentLines[i]?.slice(0, end.column - 1));
      else lines.push(contentLines[i]);
    }
    return lines.join("\n") || null;
  }

  // Reference definitions: [label]: url
  visit(tree, "definition", (node) => {
    if (node.url) {
      links.push({
        url: node.url,
        label: node.label || node.identifier || "",
        rawMarkdown: getSourceText(node),
      });
    }
  });

  // Inline links: [text](url)
  visit(tree, "link", (node) => {
    if (node.url) {
      links.push({
        url: node.url,
        label: "",
        rawMarkdown: getSourceText(node),
      });
    }
  });

  // JSX elements with href attributes
  const jsxTypes = ["mdxJsxFlowElement", "mdxJsxTextElement"];
  for (const type of jsxTypes) {
    visit(tree, type, (node) => {
      if (!node.attributes) return;
      for (const attr of node.attributes) {
        if (
          attr.type === "mdxJsxAttribute" &&
          attr.name === "href" &&
          typeof attr.value === "string"
        ) {
          links.push({
            url: attr.value,
            label: "",
            rawMarkdown: getSourceText(node),
          });
        }
      }
    });
  }

  return links;
}

function normalizeUrl(url, pageSlug) {
  if (!url) return null;
  if (url.startsWith("mailto:") || url.startsWith("tel:")) return null;
  if (url.trim() === "") return null;

  // Anchor-only → resolve against the page's own slug
  if (url.startsWith("#")) {
    if (!pageSlug) return null;
    return BASE_URL + "/docs/server-sdk/v2" + pageSlug + url;
  }

  // /docs/... or other absolute paths → full URL
  if (url.startsWith("/")) {
    return BASE_URL + url;
  }

  // http/https pass through
  if (url.startsWith("http://") || url.startsWith("https://")) {
    return url;
  }

  return null;
}

// ---------------------------------------------------------------------------
// Build all link data
// ---------------------------------------------------------------------------

function buildLinkData() {
  const variants = parseNavYaml();
  const allData = [];

  const filtered = variantFilter
    ? variants.filter(
        (v) => v.title.toLowerCase() === variantFilter.toLowerCase()
      )
    : variants;

  for (const variant of filtered) {
    const seen = new Set();
    const variantLinks = [];
    let totalExtracted = 0;

    for (const entry of variant.sections) {
      const content = readFileSync(entry.filePath, "utf-8");
      const fm = extractFrontmatter(content);
      const rawLinks = extractLinks(content);

      for (const link of rawLinks) {
        const url = normalizeUrl(link.url, fm.slug);
        if (!url) continue;
        totalExtracted++;
        if (seen.has(url)) {
          // Track additional source but don't add duplicate link entry
          const existing = variantLinks.find((l) => l.url === url);
          if (existing) {
            existing.sources.push({
              file: entry.filePath,
              section: entry.section,
              pageTitle: entry.title,
              label: link.label,
              rawMarkdown: link.rawMarkdown || null,
            });
          }
          continue;
        }
        seen.add(url);
        variantLinks.push({
          url,
          variant: variant.title,
          sources: [
            {
              file: entry.filePath,
              section: entry.section,
              pageTitle: entry.title,
              label: link.label,
              rawMarkdown: link.rawMarkdown || null,
            },
          ],
        });
      }
    }

    allData.push({
      variant: variant.title,
      links: variantLinks,
      totalExtracted,
      deduped: totalExtracted - variantLinks.length,
    });
  }

  return allData;
}

// ---------------------------------------------------------------------------
// Progress persistence
// ---------------------------------------------------------------------------

function loadProgress() {
  if (resetMode || !existsSync(PROGRESS_PATH)) {
    return { version: 1, results: {} };
  }
  try {
    return JSON.parse(readFileSync(PROGRESS_PATH, "utf-8"));
  } catch {
    return { version: 1, results: {} };
  }
}

function saveProgress(progress) {
  const tmp = PROGRESS_PATH + ".tmp";
  writeFileSync(tmp, JSON.stringify(progress, null, 2), "utf-8");
  try {
    renameSync(tmp, PROGRESS_PATH);
  } catch {
    // On Windows, rename may fail if target exists; overwrite directly
    writeFileSync(PROGRESS_PATH, JSON.stringify(progress, null, 2), "utf-8");
    try { unlinkSync(tmp); } catch { /* ignore */ }
  }
}

// ---------------------------------------------------------------------------
// Report generation
// ---------------------------------------------------------------------------

function generateReport(progress, allData) {
  const lines = ["# Link Verification Report — Server SDK v2\n"];
  lines.push(`Generated: ${new Date().toISOString()}\n`);

  let totalVerified = 0;
  let totalInvalid = 0;
  let totalSkipped = 0;
  let totalRemaining = 0;

  for (const variantData of allData) {
    const vResults = progress.results[variantData.variant] || {};
    const invalidLinks = [];
    let verified = 0;
    let invalid = 0;
    let skipped = 0;
    let remaining = 0;

    for (const link of variantData.links) {
      const result = vResults[link.url];
      if (!result) {
        remaining++;
      } else if (result.status === "valid") {
        verified++;
      } else if (result.status === "invalid") {
        invalid++;
        invalidLinks.push({ url: link.url, note: result.note, sources: link.sources });
      } else if (result.status === "skipped") {
        skipped++;
      }
    }

    totalVerified += verified;
    totalInvalid += invalid;
    totalSkipped += skipped;
    totalRemaining += remaining;

    lines.push(`## ${variantData.variant}\n`);
    lines.push(
      `${verified} valid · ${invalid} invalid · ${skipped} skipped · ${remaining} remaining\n`
    );

    if (invalidLinks.length > 0) {
      lines.push("### Invalid links\n");
      for (const link of invalidLinks) {
        lines.push(`- **${link.url}**`);
        if (link.note) lines.push(`  - Note: ${link.note}`);
        for (const src of link.sources) {
          lines.push(`  - Source: ${src.pageTitle} (${src.section})`);
          if (src.label) lines.push(`    - Label: \`${src.label}\``);
        }
        lines.push("");
      }
    }
  }

  lines.push("---\n");
  lines.push("## Summary\n");
  lines.push(`- **Valid:** ${totalVerified}`);
  lines.push(`- **Invalid:** ${totalInvalid}`);
  lines.push(`- **Skipped:** ${totalSkipped}`);
  lines.push(`- **Remaining:** ${totalRemaining}`);
  lines.push(`- **Total links:** ${totalVerified + totalInvalid + totalSkipped + totalRemaining}`);

  const report = lines.join("\n");
  writeFileSync(REPORT_PATH, report, "utf-8");
  return { report, totalVerified, totalInvalid, totalSkipped, totalRemaining };
}

// ---------------------------------------------------------------------------
// HTML UI
// ---------------------------------------------------------------------------

function getHtmlPage() {
  return `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Link Verifier — Server SDK v2</title>
<style>
  * { box-sizing: border-box; margin: 0; padding: 0; }
  body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; background: #0f1117; color: #e1e4e8; }
  .header { display: flex; justify-content: space-between; align-items: center; padding: 12px 20px; background: #161b22; border-bottom: 1px solid #30363d; }
  .header h1 { font-size: 16px; font-weight: 600; }
  .header .counter { font-size: 14px; color: #8b949e; }
  .info-bar { padding: 10px 20px; background: #1c2129; border-bottom: 1px solid #30363d; font-size: 13px; }
  .info-bar .breadcrumb { color: #58a6ff; margin-bottom: 4px; }
  .info-bar .label { color: #8b949e; font-family: monospace; font-size: 12px; }
  .info-bar .raw-md { margin-top: 6px; padding: 6px 10px; background: #0d1117; border: 1px solid #30363d; border-radius: 4px; font-family: monospace; font-size: 12px; color: #c9d1d9; white-space: pre-wrap; word-break: break-all; max-height: 80px; overflow-y: auto; }
  .url-bar { display: flex; align-items: center; gap: 8px; padding: 8px 20px; background: #1c2129; border-bottom: 1px solid #30363d; }
  .url-bar .url { flex: 1; font-family: monospace; font-size: 13px; color: #c9d1d9; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
  .url-bar a { color: #58a6ff; font-size: 12px; text-decoration: none; white-space: nowrap; }
  .iframe-container { width: 100%; height: 65vh; background: #fff; }
  .iframe-container iframe { width: 100%; height: 100%; border: none; }
  .controls { padding: 12px 20px; background: #161b22; border-top: 1px solid #30363d; }
  .note-row { display: flex; align-items: center; gap: 8px; margin-bottom: 10px; }
  .note-row label { font-size: 13px; color: #8b949e; }
  .note-row input { flex: 1; padding: 6px 10px; background: #0d1117; border: 1px solid #30363d; border-radius: 4px; color: #c9d1d9; font-size: 13px; outline: none; }
  .note-row input:focus { border-color: #58a6ff; }
  .btn-row { display: flex; gap: 8px; align-items: center; }
  .btn { padding: 6px 16px; border: 1px solid #30363d; border-radius: 6px; cursor: pointer; font-size: 13px; font-weight: 500; background: #21262d; color: #c9d1d9; transition: 0.15s; }
  .btn:hover { background: #30363d; }
  .btn.valid { border-color: #238636; color: #3fb950; }
  .btn.valid:hover { background: #238636; color: #fff; }
  .btn.invalid { border-color: #da3633; color: #f85149; }
  .btn.invalid:hover { background: #da3633; color: #fff; }
  .btn.skip { border-color: #d29922; color: #d29922; }
  .btn.skip:hover { background: #d29922; color: #000; }
  .btn:disabled { opacity: 0.4; cursor: default; }
  .status-bar { padding: 8px 20px; background: #0d1117; border-top: 1px solid #30363d; font-size: 12px; color: #8b949e; display: flex; justify-content: space-between; }
  .variant-tabs { display: flex; gap: 2px; padding: 0 20px; background: #0d1117; border-bottom: 1px solid #30363d; }
  .variant-tab { padding: 8px 14px; font-size: 13px; color: #8b949e; cursor: pointer; border-bottom: 2px solid transparent; transition: 0.15s; }
  .variant-tab:hover { color: #c9d1d9; }
  .variant-tab.active { color: #58a6ff; border-bottom-color: #58a6ff; }
  .done-message { display: flex; flex-direction: column; align-items: center; justify-content: center; height: 65vh; color: #8b949e; }
  .done-message h2 { font-size: 24px; margin-bottom: 8px; color: #3fb950; }
  kbd { background: #21262d; border: 1px solid #30363d; border-radius: 3px; padding: 1px 5px; font-size: 11px; font-family: monospace; }
  .header .header-actions { display: flex; align-items: center; gap: 12px; }
  .header .dedup-stat { font-size: 12px; color: #8b949e; }
  .header .dedup-stat strong { color: #d2a8ff; }
  .btn-sm { padding: 4px 10px; border: 1px solid #30363d; border-radius: 4px; cursor: pointer; font-size: 12px; background: #21262d; color: #c9d1d9; transition: 0.15s; }
  .btn-sm:hover { background: #30363d; }
  .link-list-overlay { position: fixed; inset: 0; background: rgba(0,0,0,0.6); z-index: 100; display: none; }
  .link-list-overlay.open { display: flex; justify-content: center; align-items: start; padding-top: 40px; }
  .link-list-panel { background: #161b22; border: 1px solid #30363d; border-radius: 8px; width: 90%; max-width: 900px; max-height: 85vh; display: flex; flex-direction: column; }
  .link-list-header { padding: 12px 16px; border-bottom: 1px solid #30363d; display: flex; justify-content: space-between; align-items: center; }
  .link-list-header h2 { font-size: 15px; font-weight: 600; }
  .link-list-filters { display: flex; gap: 6px; align-items: center; }
  .filter-btn { padding: 3px 10px; border: 1px solid #30363d; border-radius: 4px; cursor: pointer; font-size: 12px; background: #21262d; color: #8b949e; transition: 0.15s; }
  .filter-btn:hover { color: #c9d1d9; background: #30363d; }
  .filter-btn.active { background: #388bfd26; color: #58a6ff; border-color: #388bfd; }
  .link-list-search { padding: 8px 16px; border-bottom: 1px solid #30363d; }
  .link-list-search input { width: 100%; padding: 6px 10px; background: #0d1117; border: 1px solid #30363d; border-radius: 4px; color: #c9d1d9; font-size: 13px; outline: none; }
  .link-list-search input:focus { border-color: #58a6ff; }
  .link-list-body { overflow-y: auto; flex: 1; }
  .link-list-body table { width: 100%; border-collapse: collapse; font-size: 12px; }
  .link-list-body th { position: sticky; top: 0; background: #1c2129; padding: 6px 12px; text-align: left; color: #8b949e; border-bottom: 1px solid #30363d; font-weight: 500; }
  .link-list-body td { padding: 5px 12px; border-bottom: 1px solid #21262d; color: #c9d1d9; vertical-align: top; }
  .link-list-body tr:hover td { background: #1c2129; }
  .link-list-body tr.clickable { cursor: pointer; }
  .link-list-body .url-cell { font-family: monospace; font-size: 11px; word-break: break-all; max-width: 450px; }
  .link-list-body .sources-cell { font-size: 11px; color: #8b949e; }
  .link-list-body .count-badge { display: inline-block; padding: 1px 6px; border-radius: 10px; font-size: 10px; font-weight: 600; }
  .link-list-body .count-badge.unique { background: #238636; color: #fff; }
  .link-list-body .count-badge.deduped { background: #d29922; color: #000; }
  .link-list-close { cursor: pointer; font-size: 18px; color: #8b949e; background: none; border: none; padding: 4px 8px; }
  .link-list-close:hover { color: #f0f0f0; }
  .link-list-summary { padding: 8px 16px; border-bottom: 1px solid #30363d; font-size: 12px; color: #8b949e; }
  .link-list-summary strong { color: #c9d1d9; }
</style>
</head>
<body>
<div class="header">
  <h1>Link Verifier — Server SDK v2</h1>
  <div class="header-actions">
    <span class="dedup-stat" id="dedup-stat"></span>
    <button class="btn-sm" id="btn-link-list" title="View all links (L)">All links</button>
    <div class="counter" id="counter">Loading...</div>
  </div>
</div>
<div class="variant-tabs" id="variant-tabs"></div>
<div id="main-content">
  <div class="info-bar" id="info-bar">
    <div class="breadcrumb" id="breadcrumb">Loading...</div>
    <div class="label" id="link-label"></div>
    <div class="raw-md" id="raw-markdown" style="display:none"></div>
  </div>
  <div class="url-bar" id="url-bar">
    <span class="url" id="current-url">—</span>
    <a id="open-tab" href="#" target="_blank">Open in new tab ↗</a>
  </div>
  <div class="iframe-container" id="iframe-container">
    <iframe id="viewer" sandbox="allow-same-origin allow-scripts allow-popups allow-forms"></iframe>
  </div>
  <div class="controls">
    <div class="note-row">
      <label>Note:</label>
      <input type="text" id="note-input" placeholder="Optional note...">
    </div>
    <div class="btn-row">
      <button class="btn" id="btn-prev" title="Previous (←)">← Prev</button>
      <button class="btn valid" id="btn-valid" title="Valid (Y/Enter)">Valid (Y)</button>
      <button class="btn invalid" id="btn-invalid" title="Invalid (N)">Invalid (N)</button>
      <button class="btn skip" id="btn-skip" title="Skip (S)">Skip (S)</button>
      <button class="btn" id="btn-next" title="Next (→)">Next →</button>
      <span style="margin-left: auto; font-size: 12px; color: #8b949e;">
        <kbd>Y</kbd>/<kbd>Enter</kbd> valid · <kbd>N</kbd> invalid · <kbd>S</kbd> skip · <kbd>←</kbd><kbd>→</kbd> navigate · <kbd>O</kbd> open tab
      </span>
    </div>
  </div>
  <div class="status-bar" id="status-bar">
    <span id="stats">—</span>
    <span id="variant-progress">—</span>
  </div>
</div>

<div class="link-list-overlay" id="link-list-overlay">
  <div class="link-list-panel">
    <div class="link-list-header">
      <h2 id="link-list-title">All links</h2>
      <div style="display:flex;align-items:center;gap:10px;">
        <div class="link-list-filters">
          <button class="filter-btn active" data-filter="all">All</button>
          <button class="filter-btn" data-filter="unique">Unique only</button>
          <button class="filter-btn" data-filter="deduped">Deduped only</button>
        </div>
        <button class="link-list-close" id="link-list-close">&times;</button>
      </div>
    </div>
    <div class="link-list-summary" id="link-list-summary"></div>
    <div class="link-list-search">
      <input type="text" id="link-list-search" placeholder="Search URLs...">
    </div>
    <div class="link-list-body">
      <table>
        <thead><tr><th>#</th><th>URL</th><th>Sources</th><th>Type</th></tr></thead>
        <tbody id="link-list-tbody"></tbody>
      </table>
    </div>
  </div>
</div>

<script>
let state = null;
let currentVariant = null;
let currentIndex = 0;

async function fetchState() {
  const res = await fetch("/api/state");
  state = await res.json();
  renderVariantTabs();
  if (!currentVariant && state.variants.length > 0) {
    // Find first variant with remaining links
    currentVariant = state.variants.find(v => {
      const results = state.progress[v.name] || {};
      return v.links.some(l => !results[l.url]);
    })?.name || state.variants[0].name;
  }
  navigateToNextUnverified();
  render();
}

function renderVariantTabs() {
  const tabs = document.getElementById("variant-tabs");
  tabs.innerHTML = "";
  for (const v of state.variants) {
    const results = state.progress[v.name] || {};
    const remaining = v.links.filter(l => !results[l.url]).length;
    const tab = document.createElement("div");
    tab.className = "variant-tab" + (v.name === currentVariant ? " active" : "");
    tab.textContent = v.name + (remaining > 0 ? " (" + remaining + ")" : " ✓");
    tab.onclick = () => { currentVariant = v.name; currentIndex = 0; navigateToNextUnverified(); render(); };
    tabs.appendChild(tab);
  }
}

function getVariantData() {
  return state?.variants.find(v => v.name === currentVariant);
}

function getResults() {
  return state?.progress[currentVariant] || {};
}

function navigateToNextUnverified() {
  const vd = getVariantData();
  if (!vd) return;
  const results = getResults();
  // Find next unverified from current position
  for (let i = currentIndex; i < vd.links.length; i++) {
    if (!results[vd.links[i].url]) { currentIndex = i; return; }
  }
  // Wrap around
  for (let i = 0; i < currentIndex; i++) {
    if (!results[vd.links[i].url]) { currentIndex = i; return; }
  }
  // All verified — stay at current
}

function render() {
  const vd = getVariantData();
  if (!vd || vd.links.length === 0) {
    document.getElementById("counter").textContent = "No links";
    return;
  }

  const results = getResults();
  const link = vd.links[currentIndex];
  const result = results[link?.url];

  // Counter + dedup stat
  const total = vd.links.length;
  const verified = Object.keys(results).length;
  document.getElementById("counter").textContent =
    (currentIndex + 1) + " / " + total;
  document.getElementById("dedup-stat").innerHTML =
    "<strong>" + (vd.totalExtracted || total) + "</strong> extracted · <strong>" + total + "</strong> unique · <strong>" + (vd.deduped || 0) + "</strong> deduped";

  // Breadcrumb
  const src = link.sources[0];
  document.getElementById("breadcrumb").textContent =
    currentVariant + " > " + src.section + " > " + src.pageTitle;
  const uniqueLabels = [...new Set(link.sources.map(s => s.label).filter(Boolean))];
  document.getElementById("link-label").textContent = uniqueLabels.join(", ");

  // Raw markdown source — show each unique definition with its source file
  const rawEl = document.getElementById("raw-markdown");
  const rawEntries = [];
  const seenRaw = new Set();
  for (const s of link.sources) {
    if (!s.rawMarkdown) continue;
    const key = s.rawMarkdown;
    if (seenRaw.has(key)) continue;
    seenRaw.add(key);
    // Extract short filename from path
    const parts = s.file.split("/");
    const shortFile = parts.slice(-2).join("/");
    rawEntries.push(shortFile + ":\\n  " + s.rawMarkdown);
  }
  if (rawEntries.length > 0) {
    rawEl.textContent = rawEntries.join("\\n");
    rawEl.style.display = "";
  } else {
    rawEl.style.display = "none";
  }

  // URL
  document.getElementById("current-url").textContent = link.url;
  document.getElementById("open-tab").href = link.url;

  // Iframe
  const iframe = document.getElementById("viewer");
  if (iframe.src !== link.url) {
    iframe.src = link.url;
  }

  // Note
  document.getElementById("note-input").value = result?.note || "";

  // Stats
  let valid = 0, invalid = 0, skipped = 0;
  for (const r of Object.values(results)) {
    if (r.status === "valid") valid++;
    else if (r.status === "invalid") invalid++;
    else if (r.status === "skipped") skipped++;
  }
  const remaining = total - Object.keys(results).length;
  document.getElementById("stats").textContent =
    valid + " valid · " + invalid + " invalid · " + remaining + " remaining · " + skipped + " skipped";
  document.getElementById("variant-progress").textContent =
    remaining === 0 ? "✓ Variant complete" : "";

  // Update tab styling
  renderVariantTabs();
}

let submitLock = false;
async function submitVerification(status) {
  if (submitLock) return;
  submitLock = true;
  try {
    const vd = getVariantData();
    if (!vd) return;
    // Snapshot variant and index at call time
    const submittedVariant = currentVariant;
    const submittedIndex = currentIndex;
    const link = vd.links[submittedIndex];
    const note = document.getElementById("note-input").value;

    const res = await fetch("/api/verify", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        url: link.url,
        variant: submittedVariant,
        status: status,
        note: note || "",
        sources: link.sources,
      }),
    });
    const updated = await res.json();
    if (!state.progress[submittedVariant]) state.progress[submittedVariant] = {};
    state.progress[submittedVariant][link.url] = updated.result;

    // Advance to next unverified — auto-switch variant if current is done
    currentIndex = submittedIndex + 1;
    if (currentIndex >= vd.links.length) currentIndex = 0;
    navigateToNextUnverified();

    // Check if submitted variant is fully done (use snapshot, not live currentVariant)
    const variantProgress = state.progress[submittedVariant] || {};
    const allDone = vd.links.every(l => variantProgress[l.url]);
    if (allDone) {
      // Try to advance to next variant with remaining links
      const nextVariant = state.variants.find(v => {
        if (v.name === submittedVariant) return false;
        const vr = state.progress[v.name] || {};
        return v.links.some(l => !vr[l.url]);
      });
      if (nextVariant) {
        currentVariant = nextVariant.name;
        currentIndex = 0;
        navigateToNextUnverified();
      }
    }
    render();
  } finally {
    submitLock = false;
  }
}

function navigate(delta) {
  const vd = getVariantData();
  if (!vd) return;

  // If current variant is complete, jump to next incomplete variant
  const results = getResults();
  const allDone = vd.links.every(l => results[l.url]);
  if (allDone) {
    const nextVariant = state.variants.find(v => {
      if (v.name === currentVariant) return false;
      const vr = state.progress[v.name] || {};
      return v.links.some(l => !vr[l.url]);
    });
    if (nextVariant) {
      currentVariant = nextVariant.name;
      currentIndex = 0;
      navigateToNextUnverified();
      render();
      return;
    }
  }

  currentIndex += delta;
  if (currentIndex < 0) currentIndex = vd.links.length - 1;
  if (currentIndex >= vd.links.length) currentIndex = 0;
  render();
}

// Button handlers
document.getElementById("btn-valid").onclick = () => submitVerification("valid");
document.getElementById("btn-invalid").onclick = () => submitVerification("invalid");
document.getElementById("btn-skip").onclick = () => submitVerification("skipped");
document.getElementById("btn-prev").onclick = () => navigate(-1);
document.getElementById("btn-next").onclick = () => navigate(1);

// Keyboard shortcuts
document.addEventListener("keydown", (e) => {
  // Don't trigger when typing in note field
  if (e.target.tagName === "INPUT") return;

  switch (e.key.toLowerCase()) {
    case "y":
    case "enter":
      e.preventDefault();
      submitVerification("valid");
      break;
    case "n":
      e.preventDefault();
      submitVerification("invalid");
      break;
    case "s":
      e.preventDefault();
      submitVerification("skipped");
      break;
    case "arrowleft":
      e.preventDefault();
      navigate(-1);
      break;
    case "arrowright":
      e.preventDefault();
      navigate(1);
      break;
    case "o":
      e.preventDefault();
      window.open(document.getElementById("open-tab").href, "_blank");
      break;
    case "l":
      e.preventDefault();
      if (document.getElementById("link-list-overlay").classList.contains("open")) closeLinkList();
      else openLinkList();
      break;
    case "escape":
      closeLinkList();
      break;
  }
});

// ---------------------------------------------------------------------------
// Link list panel
// ---------------------------------------------------------------------------
let linkListFilter = "all";
let linkListSearch = "";

function openLinkList() {
  document.getElementById("link-list-overlay").classList.add("open");
  renderLinkList();
}

function closeLinkList() {
  document.getElementById("link-list-overlay").classList.remove("open");
}

document.getElementById("btn-link-list").onclick = openLinkList;
document.getElementById("link-list-close").onclick = closeLinkList;
document.getElementById("link-list-overlay").onclick = (e) => {
  if (e.target === document.getElementById("link-list-overlay")) closeLinkList();
};

// Filter buttons
for (const btn of document.querySelectorAll(".filter-btn")) {
  btn.onclick = () => {
    linkListFilter = btn.dataset.filter;
    document.querySelectorAll(".filter-btn").forEach(b => b.classList.remove("active"));
    btn.classList.add("active");
    renderLinkList();
  };
}

// Search
document.getElementById("link-list-search").oninput = (e) => {
  linkListSearch = e.target.value.toLowerCase();
  renderLinkList();
};

function renderLinkList() {
  const vd = getVariantData();
  if (!vd) return;

  const tbody = document.getElementById("link-list-tbody");
  const summaryEl = document.getElementById("link-list-summary");
  const titleEl = document.getElementById("link-list-title");

  const uniqueCount = vd.links.length;
  const dedupedCount = vd.deduped || 0;
  const totalExtracted = vd.totalExtracted || uniqueCount;

  titleEl.textContent = currentVariant + " — All links";
  summaryEl.innerHTML = "<strong>" + totalExtracted + "</strong> total extracted · <strong>" + uniqueCount + "</strong> unique · <strong>" + dedupedCount + "</strong> deduped";

  // Build display list
  let rows = vd.links.map((link, idx) => ({
    idx: idx + 1,
    url: link.url,
    sourceCount: link.sources.length,
    isDeduped: link.sources.length > 1,
    sources: link.sources,
  }));

  // Apply filter
  if (linkListFilter === "unique") {
    rows = rows.filter(r => !r.isDeduped);
  } else if (linkListFilter === "deduped") {
    rows = rows.filter(r => r.isDeduped);
  }

  // Apply search
  if (linkListSearch) {
    rows = rows.filter(r => r.url.toLowerCase().includes(linkListSearch));
  }

  tbody.innerHTML = "";
  for (const row of rows) {
    const tr = document.createElement("tr");
    tr.className = "clickable";
    tr.onclick = () => { currentIndex = row.idx - 1; closeLinkList(); render(); };

    const sourceSummary = row.sources
      .map(s => s.pageTitle + (s.label ? " [" + s.label + "]" : ""))
      .join(", ");

    tr.innerHTML =
      "<td>" + row.idx + "</td>" +
      '<td class="url-cell">' + escapeHtml(row.url) + "</td>" +
      '<td class="sources-cell">' + escapeHtml(sourceSummary) + " (" + row.sourceCount + " ref" + (row.sourceCount > 1 ? "s" : "") + ")</td>" +
      "<td>" + (row.isDeduped
        ? '<span class="count-badge deduped">' + row.sourceCount + "x</span>"
        : '<span class="count-badge unique">1x</span>') + "</td>";

    tbody.appendChild(tr);
  }
}

function escapeHtml(str) {
  return str.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");
}

fetchState();
</script>
</body>
</html>`;
}

// ---------------------------------------------------------------------------
// HTTP server
// ---------------------------------------------------------------------------

async function main() {
  console.log("Building link data...");
  const allData = buildLinkData();

  let totalLinks = 0;
  let totalDeduped = 0;
  for (const v of allData) {
    console.log(`  ${v.variant}: ${v.totalExtracted} extracted, ${v.links.length} unique, ${v.deduped} deduped`);
    totalLinks += v.links.length;
    totalDeduped += v.deduped;
  }
  console.log(`  Total: ${totalLinks} unique links, ${totalDeduped} deduped across ${allData.length} variants`);

  const progress = loadProgress();

  // Report-only mode
  if (reportMode) {
    const { totalVerified, totalInvalid, totalSkipped, totalRemaining } =
      generateReport(progress, allData);
    console.log("\nReport generated:", REPORT_PATH);
    console.log(
      `  ${totalVerified} valid · ${totalInvalid} invalid · ${totalSkipped} skipped · ${totalRemaining} remaining`
    );
    process.exit(0);
  }

  // Prepare state for API
  const statePayload = {
    variants: allData.map((v) => ({
      name: v.variant,
      totalExtracted: v.totalExtracted,
      deduped: v.deduped,
      links: v.links.map((l) => ({
        url: l.url,
        sources: l.sources.map((s) => ({
          file: s.file.replace(/\\/g, "/"),
          section: s.section,
          pageTitle: s.pageTitle,
          label: s.label,
          rawMarkdown: s.rawMarkdown || null,
        })),
      })),
    })),
    progress: progress.results,
  };

  function doSaveProgress() {
    saveProgress(progress);
  }

  const server = createServer((req, res) => {
    const url = new URL(req.url, `http://localhost:${PORT}`);

    // CORS headers for local dev
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
    res.setHeader("Access-Control-Allow-Headers", "Content-Type");

    if (req.method === "OPTIONS") {
      res.writeHead(204);
      res.end();
      return;
    }

    // Serve HTML UI
    if (url.pathname === "/" && req.method === "GET") {
      res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
      res.end(getHtmlPage());
      return;
    }

    // API: full state
    if (url.pathname === "/api/state" && req.method === "GET") {
      res.writeHead(200, { "Content-Type": "application/json" });
      statePayload.progress = progress.results;
      res.end(JSON.stringify(statePayload));
      return;
    }

    // API: submit verification
    if (url.pathname === "/api/verify" && req.method === "POST") {
      let body = "";
      req.on("data", (chunk) => (body += chunk));
      req.on("end", () => {
        try {
          const data = JSON.parse(body);
          const { url: linkUrl, variant, status, note, sources } = data;

          if (!progress.results[variant]) progress.results[variant] = {};

          const result = {
            status,
            note: note || "",
            sources: sources || [],
            verifiedAt: new Date().toISOString(),
          };
          progress.results[variant][linkUrl] = result;

          doSaveProgress();

          res.writeHead(200, { "Content-Type": "application/json" });
          res.end(JSON.stringify({ ok: true, result }));
        } catch (err) {
          res.writeHead(400, { "Content-Type": "application/json" });
          res.end(JSON.stringify({ error: err.message }));
        }
      });
      return;
    }

    // API: generate report
    if (url.pathname === "/api/report" && req.method === "GET") {
      const result = generateReport(progress, allData);
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify(result));
      return;
    }

    // 404
    res.writeHead(404, { "Content-Type": "application/json" });
    res.end(JSON.stringify({ error: "Not found" }));
  });

  server.listen(PORT, () => {
    console.log(`\nServer running at http://localhost:${PORT}`);
    console.log("Open in your browser to start verifying links.\n");
  });
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
