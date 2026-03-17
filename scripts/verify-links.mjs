#!/usr/bin/env node

/**
 * Link verification tool for SignalWire documentation.
 *
 * Parses MDX files from any product/version, extracts all links,
 * and serves a browser UI to visually verify each one via iframe.
 *
 * Usage:
 *   node scripts/verify-links.mjs                        # Interactive menu
 *   node scripts/verify-links.mjs --all                   # All products
 *   node scripts/verify-links.mjs --product server-sdk    # One product (all versions)
 *   node scripts/verify-links.mjs --product server-sdk --version v2  # Specific version
 *   node scripts/verify-links.mjs --dedup                  # Deduplicate URLs within each variant
 *   node scripts/verify-links.mjs --port 4000             # Custom port
 *   node scripts/verify-links.mjs --reset                 # Clear progress
 *   node scripts/verify-links.mjs --report                # Report only
 */

import { createServer } from "node:http";
import { createInterface } from "node:readline";
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
const DOCS_YML = join(ROOT, "fern/docs.yml");
const PROGRESS_PATH = join(ROOT, "scripts/.link-verify-progress.json");
const REPORT_PATH = join(ROOT, "scripts/.link-verify-report.md");
const BASE_URL = "https://signalwire.com";

// ---------------------------------------------------------------------------
// CLI args
// ---------------------------------------------------------------------------

const args = process.argv.slice(2);
function getArg(name) {
  const i = args.indexOf(name);
  return i !== -1 ? args[i + 1] : null;
}
const PORT = parseInt(getArg("--port") || "3456", 10);
const productFilter = getArg("--product");
const versionFilter = getArg("--version");
const variantFilter = getArg("--variant");
const allMode = args.includes("--all");
const dedup = args.includes("--dedup");
const resetMode = args.includes("--reset");
const reportMode = args.includes("--report");

// ---------------------------------------------------------------------------
// AST parser
// ---------------------------------------------------------------------------

const mdxParser = unified().use(remarkParse).use(remarkMdx);
const mdParser = unified().use(remarkParse);

function parseFile(content) {
  try {
    return mdxParser.parse(content);
  } catch {
    try {
      return mdParser.parse(content);
    } catch {
      return null;
    }
  }
}

function extractFrontmatter(content) {
  const match = content.match(/^---[\s\S]*?---/);
  if (!match) return { title: null, slug: null };
  const fm = match[0];
  const titleMatch = fm.match(/^title:\s*(.+)$/m);
  const slugMatch = fm.match(/^slug:\s*(.+)$/m);
  return {
    title: titleMatch
      ? titleMatch[1].trim().replace(/^["']|["']$/g, "")
      : null,
    slug: slugMatch ? slugMatch[1].trim() : null,
  };
}

// ---------------------------------------------------------------------------
// Product/version discovery from docs.yml
// ---------------------------------------------------------------------------

function discoverProducts() {
  const raw = readFileSync(DOCS_YML, "utf-8").replace(/\r\n/g, "\n");
  const products = [];

  // Parse products section
  const productsMatch = raw.match(/^products:\n([\s\S]*?)(?=\n\S|\Z)/m);
  if (!productsMatch) return products;

  const block = productsMatch[1];
  const entries = block.split(/\n  - /).slice(1); // Split on top-level product entries

  for (const entry of entries) {
    const nameMatch = entry.match(/display-name:\s*(.+)/);
    const slugMatch = entry.match(/^\s*slug:\s*(.+)/m);
    const pathMatch = entry.match(/^\s*path:\s*(.+)/m);
    if (!nameMatch || !slugMatch || !pathMatch) continue;

    const name = nameMatch[1].trim();
    const slug = slugMatch[1].trim().replace(/^\//, "");
    const ymlPath = pathMatch[1].trim();

    // Check for versions
    const versionsBlock = entry.match(/versions:\n([\s\S]*?)(?=\n  \S|$)/);
    if (versionsBlock) {
      const vEntries = versionsBlock[1].split(/\n\s+- /).filter(Boolean);
      for (const ve of vEntries) {
        const vNameMatch = ve.match(/display-name:\s*(.+)/);
        const vPathMatch = ve.match(/path:\s*(.+)/);
        const vSlugMatch = ve.match(/slug:\s*(.+)/);
        if (!vNameMatch || !vPathMatch) continue;
        const vSlug = vSlugMatch ? vSlugMatch[1].trim() : "";
        products.push({
          name: `${name} ${vNameMatch[1].trim()}`,
          productSlug: slug,
          versionSlug: vSlug,
          urlPrefix: `/docs/${slug}${vSlug ? "/" + vSlug : ""}`,
          ymlPath: join(ROOT, "fern", vPathMatch[1].trim()),
          product: name,
          version: vNameMatch[1].trim(),
        });
      }
    } else {
      products.push({
        name,
        productSlug: slug,
        versionSlug: "",
        urlPrefix: slug ? `/docs/${slug}` : "/docs",
        ymlPath: join(ROOT, "fern", ymlPath),
        product: name,
        version: null,
      });
    }
  }

  return products;
}

// ---------------------------------------------------------------------------
// Generic YAML navigation parser
// ---------------------------------------------------------------------------

function parseNavYaml(ymlPath) {
  if (!existsSync(ymlPath)) return [];
  const raw = readFileSync(ymlPath, "utf-8");
  const lines = raw.split("\n").map((l) => l.replace(/\r$/, ""));
  const ymlDir = dirname(ymlPath);

  const groups = []; // Each group = { title, pages: [{section,title,filePath}] }

  // Detect if this YAML has variants (like v2.yml with language tabs)
  const hasVariants = lines.some((l) => /^\s+variants:/.test(l));

  if (hasVariants) {
    return parseVariantYaml(lines, ymlDir);
  }

  // Non-variant: collect all pages into a single group
  const pages = [];
  let currentSection = "General";

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];

    // Section
    const sectionMatch = line.match(/^\s+- section:\s*(.+)$/);
    if (sectionMatch) {
      currentSection = sectionMatch[1].trim();
      continue;
    }

    // Explicit page
    const pageMatch = line.match(/^\s+- page:\s*(.+)$/);
    if (pageMatch) {
      const pageTitle = pageMatch[1].trim();
      const pathLine = lines[i + 1] || "";
      const pathMatch = pathLine.match(/^\s+path:\s*(.+)$/);
      if (pathMatch) {
        const absPath = resolve(ymlDir, pathMatch[1].trim());
        if (existsSync(absPath)) {
          pages.push({
            section: currentSection,
            title: pageTitle,
            filePath: absPath,
          });
        }
      }
      continue;
    }

    // Folder
    const folderMatch = line.match(/^\s+- folder:\s*(.+)$/);
    if (folderMatch) {
      const folderAbs = resolve(ymlDir, folderMatch[1].trim());
      const titleLine = lines[i + 1] || "";
      const titleMatch = titleLine.match(/^\s+title:\s*(.+)$/);
      const folderSection = titleMatch
        ? titleMatch[1].trim()
        : currentSection;

      for (const filePath of walkFolderOrdered(folderAbs)) {
        const content = readFileSync(filePath, "utf-8");
        const fm = extractFrontmatter(content);
        pages.push({
          section: folderSection,
          title: fm.title || fileToTitle(filePath),
          filePath,
        });
      }
      continue;
    }
  }

  if (pages.length > 0) {
    groups.push({ title: "All", pages });
  }
  return groups;
}

function parseVariantYaml(lines, ymlDir) {
  const groups = [];
  let currentVariant = null;
  let currentSection = null;

  // Find the indent of `variants:` to know what level `- title:` is at
  let variantIndent = -1;
  for (const line of lines) {
    const m = line.match(/^(\s*)variants:\s*$/);
    if (m) {
      variantIndent = m[1].length + 2; // entries are 2 spaces deeper
      break;
    }
  }
  if (variantIndent < 0) return groups;

  // Build regex for variant-level `- title:` (exact indent)
  const variantRe = new RegExp(
    `^\\s{${variantIndent}}- title:\\s*(.+)$`
  );

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];

    const variantMatch = line.match(variantRe);
    if (variantMatch) {
      const title = variantMatch[1].trim().replace(/^["']|["']$/g, "");
      currentVariant = { title, pages: [] };
      currentSection = null;
      groups.push(currentVariant);
      continue;
    }

    if (!currentVariant) continue;

    // Section
    const sectionMatch = line.match(/^\s+- section:\s*(.+)$/);
    if (sectionMatch) {
      currentSection = sectionMatch[1].trim();
      continue;
    }

    // Explicit page
    const pageMatch = line.match(/^\s+- page:\s*(.+)$/);
    if (pageMatch) {
      const pageTitle = pageMatch[1].trim();
      const pathLine = lines[i + 1] || "";
      const pathMatch = pathLine.match(/^\s+path:\s*(.+)$/);
      if (pathMatch) {
        const absPath = resolve(ymlDir, pathMatch[1].trim());
        if (existsSync(absPath)) {
          currentVariant.pages.push({
            section: currentSection || "Core",
            title: pageTitle,
            filePath: absPath,
          });
        }
      }
      continue;
    }

    // Folder
    const folderMatch = line.match(/^\s+- folder:\s*(.+)$/);
    if (folderMatch) {
      const folderAbs = resolve(ymlDir, folderMatch[1].trim());
      const titleLine = lines[i + 1] || "";
      const titleMatch = titleLine.match(/^\s+title:\s*(.+)$/);
      const folderSection = titleMatch
        ? titleMatch[1].trim()
        : currentSection || "Other";

      for (const filePath of walkFolderOrdered(folderAbs)) {
        const content = readFileSync(filePath, "utf-8");
        const fm = extractFrontmatter(content);
        currentVariant.pages.push({
          section: folderSection,
          title: fm.title || fileToTitle(filePath),
          filePath,
        });
      }
      continue;
    }
  }

  return groups;
}

function walkFolderOrdered(dir) {
  if (!existsSync(dir)) return [];
  const results = [];
  const entries = readdirSync(dir, { withFileTypes: true });

  const indexFile = entries.find(
    (e) => !e.isDirectory() && e.name === "index.mdx"
  );
  if (indexFile) results.push(join(dir, indexFile.name));

  const mdxFiles = entries
    .filter(
      (e) =>
        !e.isDirectory() &&
        e.name.endsWith(".mdx") &&
        e.name !== "index.mdx"
    )
    .sort((a, b) => a.name.localeCompare(b.name));
  for (const f of mdxFiles) results.push(join(dir, f.name));

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
// Link extractor
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
      return (
        contentLines[start.line - 1]?.slice(
          start.column - 1,
          end.column - 1
        ) || null
      );
    }
    const out = [];
    for (let i = start.line - 1; i < end.line; i++) {
      if (i === start.line - 1)
        out.push(contentLines[i]?.slice(start.column - 1));
      else if (i === end.line - 1)
        out.push(contentLines[i]?.slice(0, end.column - 1));
      else out.push(contentLines[i]);
    }
    return out.join("\n") || null;
  }

  visit(tree, "definition", (node) => {
    if (node.url) {
      links.push({
        url: node.url,
        label: node.label || node.identifier || "",
        rawMarkdown: getSourceText(node),
      });
    }
  });

  visit(tree, "link", (node) => {
    if (node.url) {
      links.push({ url: node.url, label: "", rawMarkdown: getSourceText(node) });
    }
  });

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

function normalizeUrl(url, pageSlug, urlPrefix) {
  if (!url) return null;
  if (url.startsWith("mailto:") || url.startsWith("tel:")) return null;
  if (url.trim() === "") return null;

  // Anchor-only → resolve against the page's own slug
  if (url.startsWith("#")) {
    if (!pageSlug) return null;
    return BASE_URL + urlPrefix + pageSlug + url;
  }

  // Absolute paths → full URL
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
// Build link data for selected products
// ---------------------------------------------------------------------------

function buildLinkData(selectedProducts) {
  const allData = [];

  for (const product of selectedProducts) {
    const groups = parseNavYaml(product.ymlPath);

    for (const group of groups) {
      const variantName =
        groups.length === 1 && group.title === "All"
          ? product.name
          : `${product.name} — ${group.title}`;

      const seen = new Set();
      const variantLinks = [];
      let totalExtracted = 0;

      for (const entry of group.pages) {
        const content = readFileSync(entry.filePath, "utf-8");
        const fm = extractFrontmatter(content);
        const rawLinks = extractLinks(content);

        for (const link of rawLinks) {
          const url = normalizeUrl(
            link.url,
            fm.slug,
            product.urlPrefix
          );
          if (!url) continue;
          totalExtracted++;
          const source = {
            file: entry.filePath,
            section: entry.section,
            pageTitle: entry.title,
            label: link.label,
            rawMarkdown: link.rawMarkdown || null,
          };
          if (dedup && seen.has(url)) {
            const existing = variantLinks.find((l) => l.url === url);
            if (existing) existing.sources.push(source);
            continue;
          }
          seen.add(url);
          variantLinks.push({
            url,
            variant: variantName,
            sources: [source],
          });
        }
      }

      if (variantLinks.length > 0) {
        allData.push({
          variant: variantName,
          links: variantLinks,
          totalExtracted,
          deduped: totalExtracted - variantLinks.length,
        });
      }
    }
  }

  return allData;
}

// ---------------------------------------------------------------------------
// Interactive product selection menu
// ---------------------------------------------------------------------------

async function selectProducts(allProducts) {
  const rl = createInterface({
    input: process.stdin,
    output: process.stdout,
  });
  const ask = (q) => new Promise((res) => rl.question(q, res));

  console.log("\nAvailable products:\n");

  // Group by product name
  const grouped = new Map();
  for (const p of allProducts) {
    const key = p.product;
    if (!grouped.has(key)) grouped.set(key, []);
    grouped.get(key).push(p);
  }

  const menuItems = [];
  let idx = 1;
  for (const [product, versions] of grouped) {
    if (versions.length === 1 && !versions[0].version) {
      menuItems.push({ idx, products: versions, label: product });
      console.log(`  ${idx}. ${product}`);
      idx++;
    } else {
      // Show product header then versions
      const versionLabels = versions.map((v) => v.version).join(", ");
      menuItems.push({
        idx,
        products: versions,
        label: `${product} (all: ${versionLabels})`,
      });
      console.log(`  ${idx}. ${product} (all versions: ${versionLabels})`);
      idx++;
      for (const v of versions) {
        menuItems.push({ idx, products: [v], label: `${product} ${v.version}` });
        console.log(`     ${idx}. ${product} ${v.version}`);
        idx++;
      }
    }
  }

  console.log(`\n  0. All products\n`);

  const answer = await ask(
    "Select products (comma-separated numbers, or 0 for all): "
  );
  rl.close();

  const selections = answer
    .split(",")
    .map((s) => parseInt(s.trim(), 10))
    .filter((n) => !isNaN(n));

  if (selections.includes(0)) return allProducts;

  const selected = [];
  const seen = new Set();
  for (const n of selections) {
    const item = menuItems.find((m) => m.idx === n);
    if (item) {
      for (const p of item.products) {
        if (!seen.has(p.name)) {
          seen.add(p.name);
          selected.push(p);
        }
      }
    }
  }

  return selected.length > 0 ? selected : allProducts;
}

// ---------------------------------------------------------------------------
// Progress persistence
// ---------------------------------------------------------------------------

function loadProgress() {
  if (resetMode || !existsSync(PROGRESS_PATH)) {
    return { version: 2, results: {} };
  }
  try {
    return JSON.parse(readFileSync(PROGRESS_PATH, "utf-8"));
  } catch {
    return { version: 2, results: {} };
  }
}

function saveProgress(progress) {
  const tmp = PROGRESS_PATH + ".tmp";
  writeFileSync(tmp, JSON.stringify(progress, null, 2), "utf-8");
  try {
    renameSync(tmp, PROGRESS_PATH);
  } catch {
    writeFileSync(PROGRESS_PATH, JSON.stringify(progress, null, 2), "utf-8");
    try {
      unlinkSync(tmp);
    } catch {
      /* ignore */
    }
  }
}

// ---------------------------------------------------------------------------
// Report generation
// ---------------------------------------------------------------------------

function generateReport(progress, allData) {
  const lines = ["# Link Verification Report\n"];
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
        invalidLinks.push({
          url: link.url,
          note: result.note,
          sources: link.sources,
        });
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
  lines.push(
    `- **Total links:** ${totalVerified + totalInvalid + totalSkipped + totalRemaining}`
  );

  const report = lines.join("\n");
  writeFileSync(REPORT_PATH, report, "utf-8");
  return { report, totalVerified, totalInvalid, totalSkipped, totalRemaining };
}

// ---------------------------------------------------------------------------
// HTML UI
// ---------------------------------------------------------------------------

function getHtmlPage(title) {
  return `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Link Verifier — ${title}</title>
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
  .variant-tabs { display: flex; gap: 2px; padding: 0 20px; background: #0d1117; border-bottom: 1px solid #30363d; flex-wrap: wrap; }
  .variant-tab { padding: 8px 14px; font-size: 13px; color: #8b949e; cursor: pointer; border-bottom: 2px solid transparent; transition: 0.15s; }
  .variant-tab:hover { color: #c9d1d9; }
  .variant-tab.active { color: #58a6ff; border-bottom-color: #58a6ff; }
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
  <h1>Link Verifier — ${title}</h1>
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
    <span class="url" id="current-url">&mdash;</span>
    <a id="open-tab" href="#" target="_blank">Open in new tab &#8599;</a>
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
      <button class="btn" id="btn-prev" title="Previous">&#8592; Prev</button>
      <button class="btn valid" id="btn-valid" title="Valid (Y/Enter)">Valid (Y)</button>
      <button class="btn invalid" id="btn-invalid" title="Invalid (N)">Invalid (N)</button>
      <button class="btn skip" id="btn-skip" title="Skip (S)">Skip (S)</button>
      <button class="btn" id="btn-next" title="Next">Next &#8594;</button>
      <span style="margin-left: auto; font-size: 12px; color: #8b949e;">
        <kbd>Y</kbd>/<kbd>Enter</kbd> valid &middot; <kbd>N</kbd> invalid &middot; <kbd>S</kbd> skip &middot; <kbd>&#8592;</kbd><kbd>&#8594;</kbd> navigate &middot; <kbd>O</kbd> open tab
      </span>
    </div>
  </div>
  <div class="status-bar" id="status-bar">
    <span id="stats">&mdash;</span>
    <span id="variant-progress">&mdash;</span>
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
    tab.textContent = v.name + (remaining > 0 ? " (" + remaining + ")" : " \\u2713");
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
  for (let i = currentIndex; i < vd.links.length; i++) {
    if (!results[vd.links[i].url]) { currentIndex = i; return; }
  }
  for (let i = 0; i < currentIndex; i++) {
    if (!results[vd.links[i].url]) { currentIndex = i; return; }
  }
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

  const total = vd.links.length;
  document.getElementById("counter").textContent = (currentIndex + 1) + " / " + total;
  document.getElementById("dedup-stat").innerHTML =
    "<strong>" + (vd.totalExtracted || total) + "</strong> extracted \\u00b7 <strong>" + total + "</strong> unique \\u00b7 <strong>" + (vd.deduped || 0) + "</strong> deduped";

  const src = link.sources[0];
  document.getElementById("breadcrumb").textContent =
    currentVariant + " > " + src.section + " > " + src.pageTitle;
  const uniqueLabels = [...new Set(link.sources.map(s => s.label).filter(Boolean))];
  document.getElementById("link-label").textContent = uniqueLabels.join(", ");

  const rawEl = document.getElementById("raw-markdown");
  const rawEntries = [];
  const seenRaw = new Set();
  for (const s of link.sources) {
    if (!s.rawMarkdown) continue;
    if (seenRaw.has(s.rawMarkdown)) continue;
    seenRaw.add(s.rawMarkdown);
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

  document.getElementById("current-url").textContent = link.url;
  document.getElementById("open-tab").href = link.url;

  const iframe = document.getElementById("viewer");
  if (iframe.src !== link.url) iframe.src = link.url;

  document.getElementById("note-input").value = result?.note || "";

  let valid = 0, invalid = 0, skipped = 0, remaining = 0;
  for (const l of vd.links) {
    const r = results[l.url];
    if (!r) remaining++;
    else if (r.status === "valid") valid++;
    else if (r.status === "invalid") invalid++;
    else if (r.status === "skipped") skipped++;
  }
  document.getElementById("stats").textContent =
    valid + " valid \\u00b7 " + invalid + " invalid \\u00b7 " + remaining + " remaining \\u00b7 " + skipped + " skipped";
  document.getElementById("variant-progress").textContent =
    remaining === 0 ? "\\u2713 Variant complete" : "";

  renderVariantTabs();
}

let submitLock = false;
async function submitVerification(status) {
  if (submitLock) return;
  submitLock = true;
  try {
    const vd = getVariantData();
    if (!vd) return;
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

    currentIndex = submittedIndex + 1;
    if (currentIndex >= vd.links.length) currentIndex = 0;
    navigateToNextUnverified();

    const variantProgress = state.progress[submittedVariant] || {};
    const allDone = vd.links.every(l => variantProgress[l.url]);
    if (allDone) {
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

document.getElementById("btn-valid").onclick = () => submitVerification("valid");
document.getElementById("btn-invalid").onclick = () => submitVerification("invalid");
document.getElementById("btn-skip").onclick = () => submitVerification("skipped");
document.getElementById("btn-prev").onclick = () => navigate(-1);
document.getElementById("btn-next").onclick = () => navigate(1);

document.addEventListener("keydown", (e) => {
  if (e.target.tagName === "INPUT") return;
  switch (e.key.toLowerCase()) {
    case "y": case "enter": e.preventDefault(); submitVerification("valid"); break;
    case "n": e.preventDefault(); submitVerification("invalid"); break;
    case "s": e.preventDefault(); submitVerification("skipped"); break;
    case "arrowleft": e.preventDefault(); navigate(-1); break;
    case "arrowright": e.preventDefault(); navigate(1); break;
    case "o": e.preventDefault(); window.open(document.getElementById("open-tab").href, "_blank"); break;
    case "l": e.preventDefault();
      if (document.getElementById("link-list-overlay").classList.contains("open")) closeLinkList();
      else openLinkList();
      break;
    case "escape": closeLinkList(); break;
  }
});

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

for (const btn of document.querySelectorAll(".filter-btn")) {
  btn.onclick = () => {
    linkListFilter = btn.dataset.filter;
    document.querySelectorAll(".filter-btn").forEach(b => b.classList.remove("active"));
    btn.classList.add("active");
    renderLinkList();
  };
}

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

  titleEl.textContent = currentVariant + " \\u2014 All links";
  summaryEl.innerHTML = "<strong>" + totalExtracted + "</strong> total extracted \\u00b7 <strong>" + uniqueCount + "</strong> unique \\u00b7 <strong>" + dedupedCount + "</strong> deduped";

  let rows = vd.links.map((link, idx) => ({
    idx: idx + 1, url: link.url, sourceCount: link.sources.length,
    isDeduped: link.sources.length > 1, sources: link.sources,
  }));

  if (linkListFilter === "unique") rows = rows.filter(r => !r.isDeduped);
  else if (linkListFilter === "deduped") rows = rows.filter(r => r.isDeduped);
  if (linkListSearch) rows = rows.filter(r => r.url.toLowerCase().includes(linkListSearch));

  tbody.innerHTML = "";
  for (const row of rows) {
    const tr = document.createElement("tr");
    tr.className = "clickable";
    tr.onclick = () => { currentIndex = row.idx - 1; closeLinkList(); render(); };
    const sourceSummary = row.sources.map(s => s.pageTitle + (s.label ? " [" + s.label + "]" : "")).join(", ");
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
  const allProducts = discoverProducts();

  // Filter by CLI args
  let selected;
  if (allMode) {
    selected = allProducts;
  } else if (productFilter) {
    selected = allProducts.filter(
      (p) =>
        p.productSlug === productFilter ||
        p.product.toLowerCase() === productFilter.toLowerCase()
    );
    if (versionFilter) {
      selected = selected.filter(
        (p) =>
          p.versionSlug === versionFilter ||
          (p.version && p.version.toLowerCase() === versionFilter.toLowerCase())
      );
    }
    if (selected.length === 0) {
      console.error(`No products found matching --product ${productFilter}`);
      process.exit(1);
    }
  } else if (!reportMode) {
    // Interactive menu
    selected = await selectProducts(allProducts);
  } else {
    selected = allProducts;
  }

  console.log("\nBuilding link data...");
  const allData = buildLinkData(selected);

  // Apply variant filter if specified
  let filteredData = allData;
  if (variantFilter) {
    filteredData = allData.filter(
      (v) => v.variant.toLowerCase().includes(variantFilter.toLowerCase())
    );
  }

  let totalLinks = 0;
  let totalDeduped = 0;
  for (const v of filteredData) {
    console.log(
      `  ${v.variant}: ${v.totalExtracted} extracted, ${v.links.length} unique, ${v.deduped} deduped`
    );
    totalLinks += v.links.length;
    totalDeduped += v.deduped;
  }
  console.log(
    `  Total: ${totalLinks} unique links, ${totalDeduped} deduped across ${filteredData.length} groups`
  );

  const progress = loadProgress();

  if (reportMode) {
    const { totalVerified, totalInvalid, totalSkipped, totalRemaining } =
      generateReport(progress, filteredData);
    console.log("\nReport generated:", REPORT_PATH);
    console.log(
      `  ${totalVerified} valid · ${totalInvalid} invalid · ${totalSkipped} skipped · ${totalRemaining} remaining`
    );
    process.exit(0);
  }

  // Build title from selected products
  const productNames = [...new Set(selected.map((p) => p.name))];
  const uiTitle =
    productNames.length <= 3
      ? productNames.join(", ")
      : `${productNames.length} products`;

  const statePayload = {
    variants: filteredData.map((v) => ({
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

  const server = createServer((req, res) => {
    const url = new URL(req.url, `http://localhost:${PORT}`);

    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
    res.setHeader("Access-Control-Allow-Headers", "Content-Type");

    if (req.method === "OPTIONS") {
      res.writeHead(204);
      res.end();
      return;
    }

    if (url.pathname === "/" && req.method === "GET") {
      res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
      res.end(getHtmlPage(uiTitle));
      return;
    }

    if (url.pathname === "/api/state" && req.method === "GET") {
      res.writeHead(200, { "Content-Type": "application/json" });
      statePayload.progress = progress.results;
      res.end(JSON.stringify(statePayload));
      return;
    }

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
          saveProgress(progress);
          res.writeHead(200, { "Content-Type": "application/json" });
          res.end(JSON.stringify({ ok: true, result }));
        } catch (err) {
          res.writeHead(400, { "Content-Type": "application/json" });
          res.end(JSON.stringify({ error: err.message }));
        }
      });
      return;
    }

    if (url.pathname === "/api/report" && req.method === "GET") {
      const result = generateReport(progress, filteredData);
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify(result));
      return;
    }

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
