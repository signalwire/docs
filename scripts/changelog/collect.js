#!/usr/bin/env node
/**
 * Changelog collector — STAGE 1 of 3.
 *
 * Collects pull requests merged into `main` in a date window, keeps only the
 * docs-relevant file changes, resolves each changed page's real URL from its
 * `slug:` frontmatter, and writes a prompt bundle for classification.
 *
 * Usage:
 *   node scripts/changelog/collect.js                          # since last published entry
 *   node scripts/changelog/collect.js --since 2026-08-04 --until 2026-08-11
 *   node scripts/changelog/collect.js --date 2026-08-17         # override the output folder name
 *
 * Outputs, into .github/changelog-state/batches/<until-date>/:
 *   input.json   the collected PR data
 *   prompt.md    the complete prompt, ready to paste into Claude Code
 *
 * STAGE 2 is classification. In phase 1 that is a human: paste prompt.md into
 * Claude Code, save the JSON reply as classified.json beside prompt.md. Once
 * GEMINI_API_KEY exists, changelog-draft.yml does this step automatically using
 * the same prompt builder.
 *
 * STAGE 3 is `node scripts/changelog/render.js`.
 *
 * Requires: gh CLI, authenticated (or GITHUB_TOKEN in CI).
 *
 * Environment Variables:
 *   LOGGER_LEVEL  Set log verbosity: error, warn, info, debug, trace (default: info)
 */

import { execFileSync } from 'node:child_process';
import { appendFileSync, existsSync, mkdirSync, readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { createRequire } from 'node:module';
import yaml from 'js-yaml';
import { Logger } from '../utils/logger.js';
import {
  LEDGER_PATH,
  MAX_PATCH_CHARS,
  MAX_PATCH_CHARS_PER_PR,
  REPO_ROOT,
  batchDir,
  isDocsRelevant,
  isMechanicalPatch,
  resolveRepo,
} from './config.js';

// The prompt builder is CommonJS so that actions/github-script can require() it.
const require = createRequire(import.meta.url);
const buildPrompt = require('../../.github/scripts/changelog-prompt.cjs');

const log = new Logger();

/**
 * Report results to the GitHub Actions step, when running in one.
 *
 * The workflow must not infer the date by listing the work directory — a backfill
 * writes an older folder than ones already committed, and the newest-wins guess
 * would pick the wrong week.
 */
function setOutput(key, value) {
  if (process.env.GITHUB_OUTPUT) {
    appendFileSync(process.env.GITHUB_OUTPUT, `${key}=${value}\n`);
  }
}

// ============================================
// gh helpers
// ============================================

/**
 * Repo to query, as owner/name. `--repo` wins; otherwise config.js resolveRepo
 * decides (env, then origin). See resolveRepo for why gh must not infer it.
 */
let targetRepo = null;

function gh(args) {
  try {
    return execFileSync('gh', args, {
      cwd: REPO_ROOT,
      encoding: 'utf8',
      maxBuffer: 64 * 1024 * 1024,
      env: { ...process.env, ...(targetRepo ? { GH_REPO: targetRepo } : {}) },
    });
  } catch (err) {
    // gh writes the useful part to stderr.
    const detail = err.stderr?.toString().trim() || err.message;
    throw new Error(`gh ${args.slice(0, 2).join(' ')} failed: ${detail}`);
  }
}

function ghJson(args) {
  return JSON.parse(gh(args));
}

// ============================================
// Window resolution
// ============================================

function isoDate(d) {
  return d.toISOString().slice(0, 10);
}

/** The ledger of already-reported PRs. Missing file means nothing reported yet. */
function loadLedger() {
  if (!existsSync(LEDGER_PATH)) return { reported: {} };
  try {
    const parsed = JSON.parse(readFileSync(LEDGER_PATH, 'utf8'));
    return { reported: parsed.reported ?? {} };
  } catch (err) {
    throw new Error(`${LEDGER_PATH.replace(`${REPO_ROOT}/`, '')} is not valid JSON: ${err.message}`);
  }
}

/**
 * Resolve the collection window.
 *
 * The window is now only a coarse net — the ledger, not the window, guarantees a
 * PR is reported once. So overlapping windows are harmless, which is what makes
 * on-demand runs safe alongside the weekly one. A generous default overlap is
 * deliberate: it re-nets anything an abandoned draft left unreported.
 */
function resolveWindow(sinceArg, untilArg, ledger) {
  const until = untilArg ?? isoDate(new Date());

  if (sinceArg) return { since: sinceArg, until };

  const batches = Object.values(ledger.reported)
    .map((r) => r.window?.until)
    .filter(Boolean)
    .sort();
  const lastBatchEnd = batches.length ? batches[batches.length - 1] : null;

  if (lastBatchEnd) {
    // Start at the last batch's end rather than the day after. Re-netting that day
    // costs nothing (the ledger filters it) and catches a PR that merged later the
    // same day as the previous run.
    log.info(`Last batch covered through ${lastBatchEnd}`);
    return { since: lastBatchEnd, until };
  }

  const fallback = new Date(`${until}T00:00:00Z`);
  fallback.setUTCDate(fallback.getUTCDate() - 7);
  log.warn('No ledger yet; defaulting to a 7-day window.');
  return { since: isoDate(fallback), until };
}

// ============================================
// Product slug map (for resolving page URLs)
// ============================================

/**
 * Map product directory name → { slug, versioned }, read from fern/docs.yml.
 *
 * Versioned products are flagged because their URLs interpolate a version
 * segment that cannot be derived from a page's own frontmatter. We refuse to
 * guess those and emit a null URL instead.
 */
function readProductSlugs() {
  const docsPath = join(REPO_ROOT, 'fern', 'docs.yml');
  const doc = yaml.load(readFileSync(docsPath, 'utf8'));
  const map = new Map();

  for (const product of doc.products ?? []) {
    // path: products/<dir>/<file>.yml
    const dir = product.path?.split('/')[1];
    if (!dir) continue;
    map.set(dir, {
      slug: product.slug === '/' ? '' : product.slug,
      versioned: Array.isArray(product.versions) && product.versions.length > 0,
    });
  }

  return map;
}

// ============================================
// Page URL resolution
// ============================================

/** Read a file's contents at a given git ref, or null if it does not exist there. */
function fileAtRef(ref, path) {
  try {
    return execFileSync('git', ['show', `${ref}:${path}`], {
      cwd: REPO_ROOT,
      encoding: 'utf8',
      maxBuffer: 16 * 1024 * 1024,
      stdio: ['ignore', 'pipe', 'ignore'],
    });
  } catch {
    return null;
  }
}

function frontmatter(contents) {
  if (!contents?.startsWith('---')) return null;
  const end = contents.indexOf('\n---', 3);
  if (end === -1) return null;
  try {
    return yaml.load(contents.slice(4, end));
  } catch {
    return null;
  }
}

/**
 * Assemble a live docs URL from a product slug and a page's own slug.
 *
 * Pure, and split out from resolvePageMeta so it can be tested directly: a wrong
 * URL here lands a broken link on a customer-facing changelog entry. The home
 * product has an empty slug, so it must not contribute a path segment.
 */
function buildPageUrl(productSlug, pageSlug) {
  const normalized = pageSlug.startsWith('/') ? pageSlug : `/${pageSlug}`;
  const productSegment = productSlug ? `/${productSlug}` : '';
  return `/docs${productSegment}${normalized}`.replace(/\/+/g, '/');
}

/**
 * Resolve the live docs URL and page title for a changed file.
 *
 * Read at the tip of `main`, NOT at the PR's merge commit. The changelog sends
 * readers to the page as it exists now, so a title renamed by a later PR must show
 * its current text, and a page deleted by a later PR must not be linked at all —
 * reading at HEAD gives both for free, since a removed file simply has no
 * frontmatter to find.
 *
 * The classifier is never asked to construct a URL or invent link text; a wrong
 * link on a customer-facing page is worse than no link.
 *
 * Returns { url: null, title: null } for anything whose URL cannot be read
 * directly: reference pages generated from specs, versioned products (their URLs
 * interpolate a version segment that no page's frontmatter carries), pages with
 * no explicit slug, and pages that no longer exist.
 */
function resolvePageMeta(path, products) {
  const empty = { url: null, title: null };

  const match = path.match(/^fern\/products\/([^/]+)\/pages\/.+\.mdx$/);
  if (!match) return empty;

  const product = products.get(match[1]);
  if (!product || product.versioned) return empty;

  const fm = frontmatter(fileAtRef('HEAD', path));
  const slug = typeof fm?.slug === 'string' ? fm.slug : null;
  if (!slug) return empty;

  return {
    url: buildPageUrl(product.slug, slug),
    title: typeof fm?.title === 'string' ? fm.title : null,
  };
}

// ============================================
// Collection
// ============================================

function fetchMergedPrs({ since, until }) {
  const search = `merged:${since}..${until}`;
  log.step(`Searching merged PRs: ${search}`);

  return ghJson([
    'pr',
    'list',
    '--state',
    'merged',
    '--base',
    'main',
    '--search',
    search,
    '--limit',
    '200',
    '--json',
    'number,title,body,author,mergedAt,mergeCommit,url',
  ]);
}

function fetchPrFiles(number) {
  const files = ghJson([
    'api',
    '--paginate',
    `repos/{owner}/{repo}/pulls/${number}/files`,
  ]);
  return Array.isArray(files) ? files : [];
}

function collect(window, products, ledger) {
  const prs = fetchMergedPrs(window);
  log.info(`Found ${prs.length} merged PRs in window`);

  const collected = [];
  const skipped = log.collector('skipped');
  const alreadyReported = log.collector('already-reported');

  for (const pr of prs) {
    // The ledger is the idempotency guarantee: a PR reported in any earlier batch
    // is never reconsidered, whatever window it falls into.
    const prior = ledger.reported[String(pr.number)];
    if (prior) {
      alreadyReported.info(`#${pr.number} ${pr.title} — reported in batch ${prior.batch}`);
      continue;
    }

    const allFiles = fetchPrFiles(pr.number);

    const relevant = allFiles.filter((f) => isDocsRelevant(f.filename));

    // A changelog entry file is not doc content and is not under an INCLUDE path, so
    // a PR that only writes one — a hand-authored entry, or this pipeline's own
    // weekly PR — has nothing relevant and drops out here. Hand-authored entries are
    // deduplicated by the reviewer of the draft PR, not by this script.
    if (relevant.length === 0) {
      skipped.info(`#${pr.number} ${pr.title} — no docs-relevant files`);
      continue;
    }

    // Detect mechanical changes on the FULL patch, before any truncation —
    // slicing a diff breaks the +/- line pairing the comparison depends on.
    const mechanicalByFile = new Map(
      relevant.filter((f) => f.patch).map((f) => [f.filename, isMechanicalPatch(f.patch)]),
    );

    // Spend the PR's patch budget on the files most likely to carry meaning:
    // largest diffs first, since a sweep's per-file diffs are uniformly tiny.
    const byImpact = [...relevant].sort(
      (a, b) => b.additions + b.deletions - (a.additions + a.deletions),
    );
    const budgeted = new Map();
    let spent = 0;
    for (const f of byImpact) {
      if (spent >= MAX_PATCH_CHARS_PER_PR || !f.patch) continue;
      const slice = f.patch.slice(0, Math.min(MAX_PATCH_CHARS, MAX_PATCH_CHARS_PER_PR - spent));
      budgeted.set(f.filename, slice);
      spent += slice.length;
    }

    const files = relevant.map((f) => {
      const { url, title } = resolvePageMeta(f.filename, products);
      return {
        path: f.filename,
        status: f.status,
        additions: f.additions,
        deletions: f.deletions,
        url,
        title,
        patch: budgeted.get(f.filename) ?? null,
      };
    });

    // A sweep is mechanical across every file it touches, judged on full patches.
    const mechanical =
      mechanicalByFile.size > 0 && [...mechanicalByFile.values()].every(Boolean);

    collected.push({
      number: pr.number,
      title: pr.title,
      // GitHub returns PR bodies with CRLF line endings, which would otherwise
      // land verbatim in the committed prompt.md.
      body: pr.body ? pr.body.replace(/\r\n/g, '\n') : pr.body,
      author: pr.author?.login ?? 'unknown',
      mergedAt: pr.mergedAt,
      mergeCommit: pr.mergeCommit?.oid ?? null,
      url: pr.url,
      mechanical,
      fileCount: files.length,
      files,
    });
  }

  if (!alreadyReported.isEmpty()) {
    log.newline();
    alreadyReported.flush({
      header: `Skipped ${alreadyReported.count()} PRs already in the ledger:`,
      limit: 15,
    });
  }
  if (!skipped.isEmpty()) {
    log.newline();
    skipped.flush({ header: `Skipped ${skipped.count()} PRs with no docs changes:`, limit: 15 });
  }

  return collected;
}

// ============================================
// Main
// ============================================

async function main() {
  const args = process.argv.slice(2);
  let since = null;
  let until = null;
  let dateOverride = null;

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--since' && args[i + 1]) since = args[++i];
    if (args[i] === '--until' && args[i + 1]) until = args[++i];
    if (args[i] === '--date' && args[i + 1]) dateOverride = args[++i];
    if (args[i] === '--repo' && args[i + 1]) targetRepo = args[++i];
    if (args[i] === '-h' || args[i] === '--help') {
      console.log(`
Usage: node scripts/changelog/collect.js [options]

Options:
  --since <YYYY-MM-DD>  Window start (default: date of the newest published entry)
  --until <YYYY-MM-DD>  Window end (default: today)
  --date <YYYY-MM-DD>   Name the output folder and changelog entry (default: --until)
  --repo <owner/name>   Repo to collect from (default: GH_REPO, GITHUB_REPOSITORY, then origin)

Outputs .github/changelog-state/batches/<date>/{input.json,prompt.md}

Next steps after running this:
  1. Paste the contents of prompt.md into Claude Code.
  2. Save the JSON reply as classified.json in the same folder.
  3. Run: yarn changelog:render
`);
      process.exit(0);
    }
  }

  log.header('Changelog collector');
  log.newline();

  targetRepo = targetRepo ?? resolveRepo();
  if (!targetRepo) {
    throw new Error('Could not determine the repo. Pass --repo <owner/name>.');
  }
  log.info(`Repo: ${targetRepo}`);

  const ledger = loadLedger();
  const ledgerCount = Object.keys(ledger.reported).length;
  log.info(`Ledger: ${ledgerCount} ${ledgerCount === 1 ? 'PR' : 'PRs'} already reported`);

  const window = resolveWindow(since, until, ledger);
  const date = dateOverride ?? window.until;
  log.info(`Window: ${window.since} → ${window.until} (batch ${date})`);
  log.newline();

  const products = readProductSlugs();
  log.debug(`Loaded ${products.size} product slugs from fern/docs.yml`);

  const prs = collect(window, products, ledger);

  if (prs.length === 0) {
    log.newline();
    log.warn('No docs-relevant PRs in this window. Nothing to classify.');
    setOutput('empty', 'true');
    process.exit(0);
  }

  const outDir = batchDir(date);
  mkdirSync(outDir, { recursive: true });

  const inputPath = join(outDir, 'input.json');
  const promptPath = join(outDir, 'prompt.md');

  writeFileSync(inputPath, `${JSON.stringify({ window, date, prs }, null, 2)}\n`);
  writeFileSync(promptPath, `${buildPrompt(prs, window)}\n`);

  setOutput('empty', 'false');
  setOutput('date', date);
  // The resolved window, so the draft PR can print the exact command that
  // reproduces this batch. `since` is usually derived from the ledger, so it is
  // not recoverable from the workflow inputs alone.
  setOutput('since', window.since);
  setOutput('until', window.until);

  const fileCount = prs.reduce((n, p) => n + p.files.length, 0);
  const unresolved = prs.reduce(
    (n, p) => n + p.files.filter((f) => f.path.endsWith('.mdx') && !f.url).length,
    0,
  );

  log.newline();
  log.success(`${prs.length} PRs, ${fileCount} docs files`);
  if (unresolved > 0) {
    log.warn(`${unresolved} MDX files have no resolvable URL (versioned product or no slug frontmatter)`);
  }
  log.info(`Wrote ${inputPath.replace(`${REPO_ROOT}/`, '')}`);
  log.info(`Wrote ${promptPath.replace(`${REPO_ROOT}/`, '')}`);
  log.newline();
  log.header('Next: classify');
  log.info(`  1. Paste ${promptPath.replace(`${REPO_ROOT}/`, '')} into Claude Code`);
  log.info(`  2. Save the JSON reply as ${join(outDir, 'classified.json').replace(`${REPO_ROOT}/`, '')}`);
  log.info('  3. Run: yarn changelog:render');
}

// Exported for collect.test.js
export { frontmatter, resolveWindow, buildPageUrl };

// Only run when invoked directly, not when imported (matches check-md-exports.js)
if (process.argv[1] === fileURLToPath(import.meta.url)) {
  main().catch((err) => {
    log.failure(err.message);
    log.debug(err.stack);
    process.exit(1);
  });
}
