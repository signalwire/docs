#!/usr/bin/env node
/**
 * MD Export Audit Script
 *
 * Audits the `.md` exports that Fern serves for AI consumption (append `.md` to any
 * page URL) plus the `llms.txt` indexes that advertise them. Fetches every page listed
 * in the llms.txt tree and checks each export for structural problems — the regression
 * class from issue #525, where `<ParamField>` terms were stripped from exports leaving
 * orphaned descriptions.
 *
 * Usage:
 *   node scripts/check-md-exports.js                        # Audit the full production corpus
 *   node scripts/check-md-exports.js --product swml,apis    # Audit specific products
 *   node scripts/check-md-exports.js --url <page.md>        # Audit a single page (testing aid)
 *   node scripts/check-md-exports.js --list                 # Print discovered URLs and exit
 *   node scripts/check-md-exports.js --cross-check          # Also verify ParamField path= values
 *                                                           # from MDX sources appear in exports
 *   node scripts/check-md-exports.js --source-ref origin/main  # Cross-check against the sources
 *                                                              # the deployed site was built from
 *   node scripts/check-md-exports.js --base-url <url>       # Audit a preview deployment
 *   node scripts/check-md-exports.js --output report.md     # Write markdown report
 *   node scripts/check-md-exports.js --json report.json     # Write JSON report
 *
 * The script:
 *   1. Crawls the llms.txt tree (root -> product indexes -> version indexes) to discover pages
 *   2. Fetches every discovered .md export (worker pool)
 *   3. Runs tiered checks per page:
 *        error: soft/hard 404, empty body, unrendered Fern components, orphaned descriptions
 *        warn:  empty term blocks, raw HTML with class attrs (#388), HTML entity residue
 *        info:  floating link-reference definitions
 *   4. Optionally cross-checks ParamField path= values from fern/ MDX sources (--cross-check)
 *   5. Optionally diffs llms.txt coverage against sitemap.xml (skipped when filtered)
 *
 * Source-vs-export cross-check is opt-in because the default run should stay fast and
 * source-independent; the structural checks already catch the #525 failure class.
 * By default --cross-check compares WORKING-TREE MDX sources against the DEPLOYED site,
 * so drift between your branch and the main the site was built from shows up as
 * missing-param-term findings. Pass --source-ref origin/main (or any commit-ish) to
 * read sources from the ref the deployment was actually built from instead.
 *
 * Companion test file: check-md-exports.test.js (run with `yarn test:scripts`).
 *
 * Exit codes: 0 = clean (or warn/info only), 1 = error-tier findings, 2 = runtime error.
 *
 * Environment Variables:
 *   LOGGER_LEVEL  Set log verbosity: error, warn, info, debug, trace (default: info)
 */

import { execFileSync } from 'node:child_process';
import { existsSync, readFileSync, readdirSync, writeFileSync } from 'node:fs';
import { join, dirname, relative } from 'node:path';
import { fileURLToPath } from 'node:url';
import { Logger } from './utils/logger.js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = dirname(__dirname);
const log = new Logger();

// ============================================
// Configuration
// ============================================

const DEFAULT_BASE_URL = 'https://signalwire.com/docs';
const DEFAULT_CONCURRENCY = 8;
const MAX_CONCURRENCY = 16;

const RETRY_CONFIG = {
  maxAttempts: 3,
  initialDelayMs: 2000,
  backoffMultiplier: 4, // 2s -> 8s
  timeoutMs: 30000,
};

const USER_AGENT = 'signalwire-docs-md-export-audit';

// Fern components we author with; any of these surviving in an export means the
// renderer failed to process them.
const KNOWN_COMPONENTS = [
  'ParamField', 'Indent',
  'Accordion', 'AccordionGroup',
  'Tabs', 'Tab',
  'Card', 'CardGroup', 'Cards',
  'Steps', 'Step',
  'Note', 'Warning', 'Tip', 'Info', 'Check',
  'CodeBlocks', 'CodeBlock', 'CodeGroup',
  'EndpointRequestSnippet', 'EndpointResponseSnippet',
  'Frame', 'Markdown', 'Icon', 'Button', 'Tooltip',
];

// ============================================
// Fetching
// ============================================

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

/**
 * Fetch a URL with retry on network errors, 429s, and 5xx.
 * Returns { status, body }; 4xx statuses are returned (not retried) so callers
 * can record hard 404s as findings.
 */
async function fetchWithRetry(url) {
  let delay = RETRY_CONFIG.initialDelayMs;
  let lastError = null;

  for (let attempt = 1; attempt <= RETRY_CONFIG.maxAttempts; attempt++) {
    try {
      const response = await fetch(url, {
        signal: AbortSignal.timeout(RETRY_CONFIG.timeoutMs),
        headers: { 'User-Agent': USER_AGENT },
      });

      if (response.status === 429 || response.status >= 500) {
        lastError = new Error(`HTTP ${response.status}`);
      } else {
        return { status: response.status, body: await response.text() };
      }
    } catch (err) {
      lastError = err;
    }

    if (attempt < RETRY_CONFIG.maxAttempts) {
      log.debug(`  [${attempt}/${RETRY_CONFIG.maxAttempts}] Retrying ${url} (${lastError.message})`);
      await sleep(delay);
      delay *= RETRY_CONFIG.backoffMultiplier;
    }
  }

  throw lastError;
}

/**
 * Run an async worker over items with bounded concurrency.
 */
async function runPool(items, worker, concurrency) {
  let index = 0;
  const runners = Array.from({ length: Math.min(concurrency, items.length) }, async () => {
    while (index < items.length) {
      const i = index++;
      await worker(items[i], i);
    }
  });
  await Promise.all(runners);
}

// ============================================
// Discovery (llms.txt tree)
// ============================================

const PAGE_LINK_RE = /\[([^\]]*)\]\((https?:\/\/[^)\s]+?\.md)\)/g;
const INDEX_LINK_RE = /\((https?:\/\/[^)\s]+?\/llms\.txt)\)/g;

/**
 * Derive { product, version } from a page URL. The first path segment after the
 * base path is the product slug ('home' for root-level pages); browser-sdk pages
 * carry a version segment (v2/v3/v4).
 */
function classifyUrl(url, baseUrl) {
  const path = url.slice(baseUrl.length).replace(/^\//, '').replace(/\.md$/, '');
  const segments = path.split('/');
  if (segments.length <= 1) return { product: 'home', version: null };
  const product = segments[0];
  const version = /^v\d+$/.test(segments[1]) ? segments[1] : null;
  return { product, version };
}

/**
 * BFS over the llms.txt tree. Returns { pages, indexFindings } where pages is a
 * Map<url, {title, product, version, indexUrl}>.
 */
async function discoverPages(baseUrl) {
  const pages = new Map();
  const indexFindings = [];
  const visited = new Set();
  const queue = [`${baseUrl}/llms.txt`];

  while (queue.length > 0) {
    const indexUrl = queue.shift();
    if (visited.has(indexUrl)) continue;
    visited.add(indexUrl);

    log.debug(`Fetching index: ${indexUrl}`);
    let body;
    try {
      const res = await fetchWithRetry(indexUrl);
      if (res.status !== 200) {
        indexFindings.push({ url: indexUrl, check: 'index-fetch-failed', message: `HTTP ${res.status}` });
        continue;
      }
      body = res.body;
    } catch (err) {
      indexFindings.push({ url: indexUrl, check: 'index-fetch-failed', message: err.message });
      continue;
    }

    let listedPages = 0;
    let listedIndexes = 0;

    for (const match of body.matchAll(INDEX_LINK_RE)) {
      const childUrl = match[1];
      if (!childUrl.startsWith(baseUrl)) continue;
      listedIndexes++;
      if (!visited.has(childUrl)) queue.push(childUrl);
    }

    for (const match of body.matchAll(PAGE_LINK_RE)) {
      const [, title, pageUrl] = match;
      if (!pageUrl.startsWith(baseUrl)) continue;
      listedPages++;
      if (!pages.has(pageUrl)) {
        pages.set(pageUrl, { title, ...classifyUrl(pageUrl, baseUrl), indexUrl });
      }
    }

    // An index that resolves but advertises nothing means a product dropped out of
    // the export pipeline. (Counts what the index lists, not what was new — several
    // indexes legitimately overlap.)
    if (listedPages === 0 && listedIndexes === 0) {
      indexFindings.push({ url: indexUrl, check: 'empty-index', message: 'index lists no pages and no child indexes' });
    }
  }

  return { pages, indexFindings };
}

// ============================================
// Checks
// ============================================

/**
 * Remove fenced code blocks and inline code spans so component/HTML checks don't
 * false-positive on code samples (which legitimately contain `<Card>`, JSX, etc.).
 */
function stripCode(markdown) {
  const lines = markdown.split('\n');
  const kept = [];
  let inFence = false;
  for (const line of lines) {
    if (/^\s*(```|~~~)/.test(line)) {
      inFence = !inFence;
      continue;
    }
    if (!inFence) kept.push(line);
  }
  return kept.join('\n').replace(/`[^`\n]*`/g, '');
}

const TERM_RE = /^\*\*`[^`\n]+`\*\*/m;
const PARAMS_HEADING_RE = /^#{2,4}\s+\**(Properties|Parameters|Attributes|Fields|Variables|Returns)\b/im;
const HR_RE = /^\s*---\s*$/m;

/**
 * Each check receives { body, stripped } and returns a message string (finding)
 * or null (clean). Severity tiers: error affects the exit code; warn is surfaced;
 * info is hidden unless --include-info.
 */
const CHECKS = [
  {
    id: 'soft-404',
    severity: 'error',
    test({ body }) {
      return body.trimStart().startsWith('# Page Not Found')
        ? 'listed in llms.txt but the .md export is a "Page Not Found" stub'
        : null;
    },
  },
  {
    id: 'empty-body',
    severity: 'error',
    test({ body }) {
      const content = body
        .split('\n')
        .filter((l) => !/^>\s*For a complete index/.test(l) && !/^#\s/.test(l) && l.trim() !== '')
        .join('\n');
      return content.length < 80 ? `body is nearly empty (${content.length} chars of content)` : null;
    },
  },
  {
    id: 'unrendered-component',
    severity: 'error',
    test({ stripped }) {
      const re = new RegExp(`</?(${KNOWN_COMPONENTS.join('|')})\\b[^>]*>`);
      const match = stripped.match(re);
      return match ? `Fern component leaked into export unrendered: ${match[0].slice(0, 60)}` : null;
    },
  },
  {
    id: 'orphaned-descriptions',
    severity: 'error',
    test({ body }) {
      // The #525 regression signature: a params-style section whose `---`-separated
      // blocks are bare floating paragraphs — no defined term, no heading, no table,
      // no list. (Pages that document params via `#### Parameters` + bullets/tables,
      // with `---` between methods, are a legitimate older style and must not fire.)
      if (!PARAMS_HEADING_RE.test(body)) return null;
      if (TERM_RE.test(body)) return null;
      const orphanBlocks = body
        .split(new RegExp(HR_RE, 'm'))
        .map((b) => b.trim())
        .filter((b) =>
          b.length > 0 &&
          !/^#{1,6}\s/m.test(b) &&    // headings structure the block
          !/^\s*\|/m.test(b) &&       // markdown table rows carry terms
          !/^\s*(?:[-*+]|\d+\.)\s/m.test(b) // list items carry terms
        );
      return orphanBlocks.length >= 2
        ? `params-style section has ${orphanBlocks.length} bare description blocks with zero defined terms (descriptions are orphaned)`
        : null;
    },
  },
  {
    id: 'unknown-jsx-tag',
    severity: 'warn',
    test({ stripped }) {
      const match = stripped.match(/<[A-Z][A-Za-z0-9.]*(\s[^>]*)?\/?>/);
      return match ? `possible unrendered JSX tag: ${match[0].slice(0, 60)}` : null;
    },
  },
  {
    id: 'empty-term-block',
    severity: 'warn',
    test({ body }) {
      const blocks = body.split(new RegExp(HR_RE, 'm'));
      const empty = blocks
        .map((b) => b.trim())
        .filter((b) => b.length > 0 && !b.includes('\n') && TERM_RE.test(b));
      return empty.length > 0
        ? `${empty.length} parameter term(s) rendered with no description (e.g. ${empty[0].slice(0, 60)})`
        : null;
    },
  },
  {
    id: 'raw-html-class',
    severity: 'warn',
    test({ stripped }) {
      const match = stripped.match(/<(?:h[1-6]|p|div|span|a|img|section|button|ul|li)\b[^>]*\bclass(?:Name)?=/i);
      return match
        ? `raw HTML with class attributes in export (visual component leak-through; tracked under #388): ${match[0].slice(0, 60)}`
        : null;
    },
  },
  {
    id: 'html-entity',
    severity: 'warn',
    test({ stripped }) {
      const match = stripped.match(/&#x[0-9A-Fa-f]{1,6};|&#\d{1,7};|&(?:nbsp|ensp|emsp|zwnj|zwsp);/);
      return match ? `HTML entity residue in prose: ${match[0]}` : null;
    },
  },
  {
    id: 'floating-link-defs',
    severity: 'info',
    test({ body }) {
      const head = body.split('\n').slice(0, 30);
      const defs = head.filter((l) => /^\[[^\]]+\]:\s+\S+/.test(l));
      return defs.length >= 2
        ? `${defs.length} link-reference definitions placed before body content`
        : null;
    },
  },
];

/**
 * Run every check against one fetched page. Returns finding objects.
 */
function checkPage(url, meta, status, body) {
  if (status === 404 || status === 410) {
    return [{ url, ...meta, severity: 'error', check: 'hard-404', message: `HTTP ${status}` }];
  }
  if (status !== 200) {
    return [{ url, ...meta, severity: 'error', check: 'fetch-failed', message: `HTTP ${status}` }];
  }

  const ctx = { body, stripped: stripCode(body) };
  const findings = [];
  for (const { id, severity, test } of CHECKS) {
    const message = test(ctx);
    if (message) findings.push({ url, ...meta, severity, check: id, message });
    // A soft-404 stub tells us everything; don't stack noise findings on it.
    if (id === 'soft-404' && message) break;
  }

  // A page that already tripped the known-component check will also trip the generic
  // JSX check on the same tag; drop the redundant warn.
  if (findings.some((f) => f.check === 'unrendered-component')) {
    return findings.filter((f) => f.check !== 'unknown-jsx-tag');
  }
  return findings;
}

// ============================================
// Cross-check (MDX sources -> exports)
// ============================================

const SOURCE_PATH_RE = /^fern\/products\/([^/]+)\/pages\/(?:(v\d+)\/)?/;

/**
 * Parse one MDX source page into { file, url, paths }. URL = baseUrl + product
 * slug (empty for home) + version segment (browser-sdk pages/vN/) + frontmatter
 * slug; null when no slug can be computed. `file` is repo-relative.
 */
function parseSourcePage(relPath, content, baseUrl) {
  const paths = [...content.matchAll(/<ParamField\b[^>]*?\bpath=(?:"([^"]*)"|'([^']*)')/g)]
    .map((m) => m[1] ?? m[2])
    .filter(Boolean);
  if (paths.length === 0) return null;

  const pathMatch = relPath.match(SOURCE_PATH_RE);
  const slugMatch = content.match(/^slug:\s*(\S+)/m);
  if (!pathMatch || !slugMatch) return { file: relPath, url: null, paths };

  const [, product, version] = pathMatch;
  const bareSlug = slugMatch[1].replace(/^\/|\/$/g, '');
  const slugSeg = bareSlug ? `/${bareSlug}` : ''; // slug "/" is the product landing page
  const productSeg = product === 'home' ? '' : `/${product}`;
  const versionSeg = version ? `/${version}` : '';
  return { file: relPath, url: `${baseUrl}${productSeg}${versionSeg}${slugSeg}.md`, paths };
}

function getMdxFilesRecursively(dir) {
  const files = [];
  try {
    for (const entry of readdirSync(dir, { withFileTypes: true })) {
      const fullPath = join(dir, entry.name);
      if (entry.isDirectory() && !entry.name.startsWith('.')) {
        files.push(...getMdxFilesRecursively(fullPath));
      } else if (entry.isFile() && entry.name.endsWith('.mdx')) {
        files.push(fullPath);
      }
    }
  } catch {
    // Skip unreadable directories
  }
  return files;
}

/**
 * List every ParamField-using MDX source page as { file (repo-relative), content }.
 * With sourceRef set, reads from that git ref (e.g. origin/main — useful because
 * the deployed site is built from main, so cross-checking a stale or ahead branch
 * against it reports drift, not bugs). Otherwise reads the working tree.
 */
function listParamFieldSources(sourceRef, productFilter) {
  const matchesFilter = (relPath) => {
    const m = relPath.match(SOURCE_PATH_RE);
    return m && (!productFilter || productFilter.includes(m[1]));
  };

  if (sourceRef) {
    let grepOut = '';
    try {
      grepOut = execFileSync(
        'git', ['grep', '-l', '<ParamField', sourceRef, '--', 'fern/products/'],
        { cwd: REPO_ROOT, encoding: 'utf8', maxBuffer: 64 * 1024 * 1024 }
      );
    } catch (err) {
      // git grep exits 1 on zero matches; anything else is a real failure
      if (err.status !== 1) throw new Error(`git grep failed for ref '${sourceRef}': ${err.message}`);
    }
    return grepOut
      .split('\n')
      .filter(Boolean)
      .map((line) => line.slice(line.indexOf(':') + 1)) // "<ref>:<path>" -> "<path>"
      .filter((relPath) => relPath.endsWith('.mdx') && matchesFilter(relPath))
      .map((relPath) => ({
        file: relPath,
        content: execFileSync('git', ['show', `${sourceRef}:${relPath}`], {
          cwd: REPO_ROOT, encoding: 'utf8', maxBuffer: 16 * 1024 * 1024,
        }),
      }));
  }

  const productsDir = join(REPO_ROOT, 'fern', 'products');
  if (!existsSync(productsDir)) return [];
  return getMdxFilesRecursively(productsDir)
    .map((file) => relative(REPO_ROOT, file))
    .filter(matchesFilter)
    .map((relPath) => ({ file: relPath, content: readFileSync(join(REPO_ROOT, relPath), 'utf8') }))
    .filter(({ content }) => content.includes('<ParamField'));
}

async function crossCheck(baseUrl, productFilter, bodyCache, concurrency, sourceRef) {
  const sources = listParamFieldSources(sourceRef, productFilter)
    .map(({ file, content }) => parseSourcePage(file, content, baseUrl))
    .filter(Boolean);
  const totalPaths = sources.reduce((n, s) => n + s.paths.length, 0);
  const sourceLabel = sourceRef ? `git ref '${sourceRef}'` : 'the working tree';
  log.step(`Cross-checking ${totalPaths} ParamField path= values from ${sources.length} MDX sources in ${sourceLabel}...`);

  const findings = [];

  await runPool(sources, async (source) => {
    const relFile = source.file;

    if (!source.url) {
      findings.push({
        url: relFile, product: 'source', version: null, severity: 'warn',
        check: 'cross-check-unmapped', message: 'MDX file has no frontmatter slug; cannot compute export URL',
      });
      return;
    }

    let body = bodyCache.get(source.url);
    if (body === undefined) {
      try {
        const res = await fetchWithRetry(source.url);
        body = res.status === 200 ? res.body : null;
      } catch {
        body = null;
      }
      bodyCache.set(source.url, body);
    }

    const meta = { ...classifyUrl(source.url, baseUrl) };

    if (body === null || body.trimStart().startsWith('# Page Not Found')) {
      findings.push({
        url: source.url, ...meta, severity: 'warn', check: 'cross-check-unmapped',
        message: `computed export URL not found (source: ${relFile}); slug mapping edge case or unpublished page`,
      });
      return;
    }

    const missing = source.paths.filter((p) => !body.includes(`**\`${p}\`**`));
    if (missing.length > 0) {
      findings.push({
        url: source.url, ...meta, severity: 'error', check: 'missing-param-term',
        message: `${missing.length}/${source.paths.length} ParamField term(s) missing from export (e.g. \`${missing[0]}\`; source: ${relFile})${sourceRef ? '' : ' — could be local-vs-deployed drift; rerun with --source-ref origin/main before treating as a render bug'}`,
      });
    }
  }, concurrency);

  return findings;
}

// ============================================
// Sitemap diff
// ============================================

async function sitemapDiff(baseUrl, pages) {
  log.step('Diffing llms.txt coverage against sitemap.xml...');
  let xml;
  try {
    const res = await fetchWithRetry(`${baseUrl}/sitemap.xml`);
    if (res.status !== 200) throw new Error(`HTTP ${res.status}`);
    xml = res.body;
  } catch (err) {
    log.warn(`Could not fetch sitemap: ${err.message}`);
    return [];
  }

  const sitemapUrls = new Set(
    [...xml.matchAll(/<loc>([^<]+)<\/loc>/g)].map((m) => `${m[1].replace(/\/$/, '')}.md`)
  );
  const llmsUrls = new Set(pages.keys());

  const notInLlms = [...sitemapUrls].filter((u) => !llmsUrls.has(u));
  const notInSitemap = [...llmsUrls].filter((u) => !sitemapUrls.has(u));

  const findings = [];
  if (notInLlms.length > 0) {
    findings.push({
      url: `${baseUrl}/sitemap.xml`, product: 'index', version: null, severity: 'info', check: 'sitemap-diff',
      message: `${notInLlms.length} sitemap pages not listed in any llms.txt (e.g. ${notInLlms.slice(0, 3).join(', ')})`,
    });
  }
  if (notInSitemap.length > 0) {
    findings.push({
      url: `${baseUrl}/llms.txt`, product: 'index', version: null, severity: 'info', check: 'sitemap-diff',
      message: `${notInSitemap.length} llms.txt pages not in the sitemap (expected for non-default browser-sdk versions)`,
    });
  }
  return findings;
}

// ============================================
// Results Summary & Reports
// ============================================

function summarize(findings, pageCount) {
  const bySeverity = { error: 0, warn: 0, info: 0 };
  const byProduct = new Map();

  for (const f of findings) {
    bySeverity[f.severity]++;
    const key = f.product + (f.version ? `/${f.version}` : '');
    if (!byProduct.has(key)) byProduct.set(key, { error: 0, warn: 0, info: 0 });
    byProduct.get(key)[f.severity]++;
  }

  return { pageCount, bySeverity, byProduct };
}

function printSummary(findings, summary, includeInfo) {
  const visible = includeInfo ? findings : findings.filter((f) => f.severity !== 'info');

  for (const severity of ['error', 'warn', 'info']) {
    const tier = visible.filter((f) => f.severity === severity);
    if (tier.length === 0) continue;
    const collector = log.collector(severity);
    for (const f of tier) {
      const label = `[${f.check}] ${f.url} — ${f.message}`;
      if (severity === 'error') collector.failure(label);
      else collector.warn(label);
    }
    log.newline();
    log.header(`${severity.toUpperCase()} findings (${tier.length})`);
    collector.flush({ indent: '  ', limit: severity === 'error' ? 0 : 30 });
  }

  log.newline();
  log.header('Summary');
  log.newline();
  log.info(`Pages audited: ${summary.pageCount}`);

  for (const [product, counts] of [...summary.byProduct.entries()].sort()) {
    log.info(`  ${product}: ${counts.error} errors, ${counts.warn} warns, ${counts.info} infos`);
  }

  log.newline();
  const { error, warn, info } = summary.bySeverity;
  if (error === 0) {
    log.success(`No structural errors found (${warn} warns, ${info} infos${includeInfo ? '' : '; rerun with --include-info to list infos'})`);
  } else {
    log.failure(`${error} structural error(s) found (${warn} warns, ${info} infos)`);
  }
}

function writeMarkdownReport(outputFile, findings, summary, baseUrl) {
  let report = '# MD Export Audit Report\n\n';
  report += `Generated: ${new Date().toISOString()}\n\n`;
  report += `Base URL: ${baseUrl}\n\n`;
  report += `Pages audited: ${summary.pageCount}\n\n`;

  for (const severity of ['error', 'warn', 'info']) {
    const tier = findings.filter((f) => f.severity === severity);
    if (tier.length === 0) continue;
    report += `## ${severity === 'error' ? '❌' : severity === 'warn' ? '⚠️' : 'ℹ️'} ${severity.toUpperCase()} (${tier.length})\n\n`;
    report += '| Check | Page | Detail |\n|-------|------|--------|\n';
    for (const f of tier) {
      report += `| ${f.check} | ${f.url} | ${f.message.replace(/\|/g, '\\|')} |\n`;
    }
    report += '\n';
  }

  if (findings.length === 0) {
    report += '## ✅ No findings\n\n';
  }

  writeFileSync(outputFile, report);
  log.info(`Report written to: ${outputFile}`);
}

function writeJsonReport(outputFile, findings, summary, baseUrl) {
  writeFileSync(outputFile, JSON.stringify({
    generated: new Date().toISOString(),
    baseUrl,
    pagesAudited: summary.pageCount,
    summary: summary.bySeverity,
    findings,
  }, null, 2));
  log.info(`JSON report written to: ${outputFile}`);
}

// ============================================
// Main
// ============================================

async function main() {
  const args = process.argv.slice(2);
  let baseUrl = DEFAULT_BASE_URL;
  let productFilter = null;
  let limit = null;
  let singleUrl = null;
  let concurrency = DEFAULT_CONCURRENCY;
  let doCrossCheck = false;
  let sourceRef = null;
  let skipSitemap = false;
  let listOnly = false;
  let includeInfo = false;
  let outputFile = null;
  let jsonFile = null;

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--base-url' && args[i + 1]) baseUrl = args[++i].replace(/\/$/, '');
    if (args[i] === '--product' && args[i + 1]) productFilter = args[++i].split(',').map((p) => p.trim());
    if (args[i] === '--limit' && args[i + 1]) limit = parseInt(args[++i], 10);
    if (args[i] === '--url' && args[i + 1]) singleUrl = args[++i];
    if (args[i] === '--concurrency' && args[i + 1]) concurrency = Math.min(parseInt(args[++i], 10) || DEFAULT_CONCURRENCY, MAX_CONCURRENCY);
    if (args[i] === '--cross-check') doCrossCheck = true;
    if (args[i] === '--source-ref' && args[i + 1]) { sourceRef = args[++i]; doCrossCheck = true; }
    if (args[i] === '--no-sitemap-check') skipSitemap = true;
    if (args[i] === '--list') listOnly = true;
    if (args[i] === '--include-info') includeInfo = true;
    if (args[i] === '--output' && args[i + 1]) outputFile = args[++i];
    if (args[i] === '--json' && args[i + 1]) jsonFile = args[++i];
    if (args[i] === '-h' || args[i] === '--help') {
      console.log(`
Usage: node scripts/check-md-exports.js [options]

Options:
  --base-url <url>     Docs base URL (default: ${DEFAULT_BASE_URL}) — use for previews
  --product <names>    Comma-separated product filter (swml,apis,server-sdks,browser-sdk,
                       compatibility-api,platform,call-flow-builder,home)
  --limit <n>          Audit only the first N discovered pages (after filtering)
  --url <page.md>      Audit a single explicit URL (skips discovery; testing aid)
  --concurrency <n>    Parallel fetches (default: ${DEFAULT_CONCURRENCY}, max: ${MAX_CONCURRENCY})
  --cross-check        Also verify ParamField path= values from fern/ MDX sources
  --source-ref <ref>   Read cross-check sources from a git ref (e.g. origin/main)
                       instead of the working tree; implies --cross-check. Use the
                       ref the deployed site was built from to avoid drift noise
  --no-sitemap-check   Skip the sitemap vs llms.txt coverage diff
  --list               Print discovered page URLs and exit
  --include-info       List info-tier findings in console output (always in reports)
  --output <file>      Write markdown report to file
  --json <file>        Write JSON report to file
  -h, --help           Show this help

Exit codes: 0 = clean or warn/info only, 1 = error-tier findings, 2 = runtime error

Environment Variables:
  LOGGER_LEVEL         Set log verbosity: error, warn, info, debug, trace (default: info)

Examples:
  # Full production audit
  node scripts/check-md-exports.js

  # Quick smoke test on SWML pages
  node scripts/check-md-exports.js --product swml --limit 10

  # Audit one page
  node scripts/check-md-exports.js --url https://signalwire.com/docs/swml/reference/calling/ai/languages.md

  # Deep audit with source cross-check and reports
  node scripts/check-md-exports.js --cross-check --json report.json

  # Cross-check the deployed site against the sources it was built from
  node scripts/check-md-exports.js --source-ref origin/main --product swml
`);
      process.exit(0);
    }
  }

  // Fail fast on a bad ref before spending minutes on discovery
  if (sourceRef) {
    try {
      execFileSync('git', ['rev-parse', '--verify', '--quiet', `${sourceRef}^{commit}`], {
        cwd: REPO_ROOT, stdio: 'ignore',
      });
    } catch {
      log.error(`--source-ref '${sourceRef}' is not a commit-ish known to this repo`);
      process.exit(2);
    }
  }

  log.header('MD Export Audit');
  log.newline();

  const findings = [];
  const bodyCache = new Map();
  let pages = new Map();

  if (singleUrl) {
    pages.set(singleUrl, { title: null, ...classifyUrl(singleUrl, baseUrl), indexUrl: null });
  } else {
    log.step(`Discovering pages from ${baseUrl}/llms.txt...`);
    const discovery = await discoverPages(baseUrl);
    pages = discovery.pages;

    for (const f of discovery.indexFindings) {
      findings.push({ ...f, product: 'index', version: null, severity: 'error' });
    }

    log.info(`Discovered ${pages.size} pages across ${new Set([...pages.values()].map((p) => p.product)).size} products`);

    if (productFilter) {
      pages = new Map([...pages].filter(([, meta]) => productFilter.includes(meta.product)));
      log.info(`Filtered to ${pages.size} pages (products: ${productFilter.join(', ')})`);
    }
    if (limit) {
      pages = new Map([...pages].slice(0, limit));
      log.info(`Limited to first ${pages.size} pages`);
    }
  }

  if (listOnly) {
    for (const url of pages.keys()) console.log(url);
    process.exit(0);
  }

  // Fetch and check every page
  log.step(`Auditing ${pages.size} .md exports (concurrency: ${concurrency})...`);
  let done = 0;

  await runPool([...pages.entries()], async ([url, meta]) => {
    try {
      const { status, body } = await fetchWithRetry(url);
      if (status === 200) bodyCache.set(url, body);
      findings.push(...checkPage(url, meta, status, body));
    } catch (err) {
      findings.push({ url, ...meta, severity: 'error', check: 'fetch-failed', message: err.message });
    }
    done++;
    if (done % 500 === 0) log.info(`  ${done}/${pages.size} pages audited...`);
  }, concurrency);

  // Optional source cross-check
  if (doCrossCheck) {
    findings.push(...await crossCheck(baseUrl, productFilter, bodyCache, concurrency, sourceRef));
  }

  // Sitemap coverage diff — only meaningful on a full, unfiltered discovery run
  if (!skipSitemap && !singleUrl && !productFilter && !limit) {
    findings.push(...await sitemapDiff(baseUrl, pages));
  }

  // Report
  const summary = summarize(findings, pages.size);
  printSummary(findings, summary, includeInfo);

  if (outputFile) writeMarkdownReport(outputFile, findings, summary, baseUrl);
  if (jsonFile) writeJsonReport(jsonFile, findings, summary, baseUrl);

  process.exit(summary.bySeverity.error > 0 ? 1 : 0);
}

// Exported for check-md-exports.test.js
export { CHECKS, stripCode, checkPage, classifyUrl, discoverPages, parseSourcePage, listParamFieldSources };

// Only run when invoked directly, not when imported
if (process.argv[1] === fileURLToPath(import.meta.url)) {
  main().catch((err) => {
    log.error(err.stack || err.message);
    process.exit(2);
  });
}
