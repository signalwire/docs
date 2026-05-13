#!/usr/bin/env node
/**
 * Postman Link Rewriter
 *
 * Rewrites relative markdown links in OpenAPI specs to absolute URLs before
 * the spec is converted to a Postman collection. The same OpenAPI file powers
 * the Fern docs site (where relative links resolve correctly) and Postman
 * (where they don't, because Postman has no docs-site host context). This
 * script runs at publish time only — committed YAML stays unchanged.
 *
 * Designed to work identically in local development and CI.
 *
 * Usage:
 *   node scripts/rewrite-postman-links.js <file>...           # rewrite in place
 *   node scripts/rewrite-postman-links.js --dry-run <file>... # report only
 *   node scripts/rewrite-postman-links.js --help              # show usage
 *
 * Environment Variables:
 *   POSTMAN_DOCS_BASE_URL   Absolute base URL to substitute for the leading
 *                           /docs prefix. Default: https://signalwire.com/docs
 *   LOGGER_LEVEL            error|warn|info|debug|trace (default info)
 *
 * Safety:
 *   Each rewrite rule is anchored on the markdown-link prefix `](` followed
 *   by a leading slash. By construction this cannot match absolute URLs
 *   (which start with `](https://`) or bare YAML field values like
 *   externalDocs.url. See plan for full proof.
 */

import { existsSync, readFileSync, writeFileSync } from 'node:fs';
import { dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { Logger } from '../utils/logger.js';

const log = new Logger();

const DEFAULT_BASE_URL = 'https://signalwire.com/docs';
const BASE_URL = (process.env.POSTMAN_DOCS_BASE_URL || DEFAULT_BASE_URL).replace(/\/+$/, '');

// Rewrite rules applied in order. Each entry's `from` must include the
// markdown-link prefix `](` so it cannot match absolute URLs or bare YAML
// scalars. Add more entries here as new relative-link prefixes appear.
const REWRITES = [
  { from: '](/docs/', to: `](${BASE_URL}/` },
];

// ============================================
// CLI parsing
// ============================================

function parseArgs(argv) {
  const opts = { dryRun: false, help: false, files: [] };
  for (const arg of argv.slice(2)) {
    if (arg === '--dry-run') opts.dryRun = true;
    else if (arg === '-h' || arg === '--help') opts.help = true;
    else if (arg.startsWith('-')) {
      log.error(`unknown option: ${arg}`);
      process.exit(1);
    } else {
      opts.files.push(arg);
    }
  }
  return opts;
}

function printUsage() {
  const usage = `
Postman Link Rewriter — replace relative /docs links with absolute URLs.

Usage:
  node scripts/rewrite-postman-links.js [options] <file>...

Options:
  --dry-run         Print match counts and sample diffs; do not modify files.
  -h, --help        Show this help.

Environment Variables:
  POSTMAN_DOCS_BASE_URL   Absolute base URL (default: ${DEFAULT_BASE_URL})
  LOGGER_LEVEL            error|warn|info|debug|trace (default info)

Examples:
  # Dry-run against the signalwire-rest spec
  node scripts/rewrite-postman-links.js --dry-run fern/apis/signalwire-rest/openapi.yaml

  # Rewrite in place
  node scripts/rewrite-postman-links.js fern/apis/signalwire-rest/openapi.yaml fern/apis/compatibility/openapi.yaml

  # Override the docs host (e.g. staging)
  POSTMAN_DOCS_BASE_URL=https://staging.signalwire.com/docs \\
    node scripts/rewrite-postman-links.js --dry-run fern/apis/signalwire-rest/openapi.yaml
`.trim();
  console.log(usage);
}

// ============================================
// Rewrite per file
// ============================================

function countOccurrences(haystack, needle) {
  if (!needle) return 0;
  let count = 0;
  let idx = 0;
  while ((idx = haystack.indexOf(needle, idx)) !== -1) {
    count += 1;
    idx += needle.length;
  }
  return count;
}

function findSampleLines(content, pattern, limit = 3) {
  const samples = [];
  const lines = content.split('\n');
  for (let i = 0; i < lines.length && samples.length < limit; i += 1) {
    if (lines[i].includes(pattern)) {
      samples.push({ lineNo: i + 1, line: lines[i] });
    }
  }
  return samples;
}

function applyRewrites(content) {
  let out = content;
  const perRule = [];
  for (const { from, to } of REWRITES) {
    const matches = countOccurrences(out, from);
    if (matches > 0) {
      // Use split/join to do a literal (non-regex) global replace.
      out = out.split(from).join(to);
    }
    perRule.push({ from, to, matches });
  }
  return { rewritten: out, perRule };
}

function rewriteFile(path, { dryRun }) {
  if (!existsSync(path)) {
    log.failure(`not found: ${path}`);
    return { path, total: 0, error: true };
  }

  const original = readFileSync(path, 'utf8');
  const { rewritten, perRule } = applyRewrites(original);
  const total = perRule.reduce((sum, r) => sum + r.matches, 0);

  log.step(path);
  for (const { from, to, matches } of perRule) {
    if (matches === 0) {
      log.info(`  ${from} → ${to}   0 matches`);
      continue;
    }
    log.info(`  ${from} → ${to}   ${matches} matches${dryRun ? ' (no write)' : ''}`);
    const samples = findSampleLines(original, from, 3);
    if (samples.length > 0) {
      log.info(`  sample diffs (first ${samples.length}):`);
      for (const { lineNo, line } of samples) {
        const trimmed = line.trim();
        const after = trimmed.split(from).join(to);
        log.info(`    line ${lineNo}: ${trimmed}`);
        log.info(`             →   ${after}`);
      }
    }
  }

  if (!dryRun && total > 0) {
    writeFileSync(path, rewritten);
    log.success(`  written.`);
  } else if (!dryRun) {
    log.warn(`  no matches — file not modified.`);
  }

  return { path, total, error: false };
}

// ============================================
// Main
// ============================================

function main() {
  const opts = parseArgs(process.argv);
  if (opts.help) {
    printUsage();
    process.exit(0);
  }
  if (opts.files.length === 0) {
    log.error('no input files given. Run with --help for usage.');
    process.exit(1);
  }

  log.header(`Postman link rewriter — base URL: ${BASE_URL}${opts.dryRun ? ' (dry run)' : ''}`);
  log.newline();

  const results = opts.files.map((p) => rewriteFile(p, { dryRun: opts.dryRun }));

  log.newline();
  const grandTotal = results.reduce((sum, r) => sum + r.total, 0);
  const errored = results.some((r) => r.error);

  if (errored) {
    log.failure(`one or more files could not be read.`);
    process.exit(1);
  }

  if (grandTotal === 0 && !opts.dryRun) {
    // Suspicious in non-dry-run: a regression in upstream specs would
    // otherwise silently publish a Postman collection with stale links.
    log.failure(`zero relative links found across ${results.length} file(s). Refusing to proceed.`);
    process.exit(1);
  }

  log.success(`${grandTotal} link(s) ${opts.dryRun ? 'would be rewritten' : 'rewritten'} across ${results.length} file(s).`);
}

main();
