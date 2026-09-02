#!/usr/bin/env node
/**
 * Export Fern's published Markdown as a raw filesystem snapshot.
 *
 * The sitemap is the sole page inventory. For every <loc>, this script fetches
 * <loc>.md with Markdown content negotiation and writes the response bytes
 * unchanged. It does not parse, clean, filter, or chunk page content.
 */

import { createHash, randomUUID } from 'node:crypto';
import {
  existsSync,
  mkdirSync,
  mkdtempSync,
  readFileSync,
  readdirSync,
  renameSync,
  rmSync,
  statSync,
  writeFileSync,
} from 'node:fs';
import {
  basename,
  dirname,
  join,
  parse as parsePath,
  resolve,
  sep,
} from 'node:path';
import { fileURLToPath } from 'node:url';
import { Logger } from './utils/logger.js';
import { fetchWithRetry, runPool } from './utils/md-export.js';

const DEFAULT_BASE_URL = 'https://signalwire.com/docs';
const DEFAULT_OUT_DIR = 'dist/rag-corpus';
const DEFAULT_CONCURRENCY = 8;
const MAX_CONCURRENCY = 16;
const USER_AGENT = 'signalwire-docs-rag-corpus-export';
const MANIFEST_NAME = 'manifest.json';
const REPO_ROOT = dirname(dirname(fileURLToPath(import.meta.url)));
// Conventional shell exit codes for a process ended by these signals.
const SIGNAL_EXIT_CODES = { SIGINT: 130, SIGTERM: 143 };

const log = new Logger();

class UsageError extends Error {}
class CorpusExportError extends Error {}

class DocumentExportError extends CorpusExportError {
  constructor(failures) {
    super(`${failures.length} Markdown export(s) failed`);
    this.failures = failures;
  }
}

function normalizeBaseUrl(value) {
  let url;
  try {
    url = new URL(value);
  } catch {
    throw new UsageError(`Invalid --base-url: ${value}`);
  }

  if (!['http:', 'https:'].includes(url.protocol) || url.username || url.password) {
    throw new UsageError('--base-url must be an HTTP(S) URL without credentials');
  }
  if (url.search || url.hash) {
    throw new UsageError('--base-url cannot contain a query string or fragment');
  }

  const path = url.pathname === '/' ? '' : url.pathname.replace(/\/+$/, '');
  return `${url.origin}${path}`;
}

function parsePositiveInteger(value, flag) {
  if (!/^\d+$/.test(value)) throw new UsageError(`${flag} must be a positive integer`);
  const parsed = Number(value);
  if (!Number.isSafeInteger(parsed) || parsed < 1) {
    throw new UsageError(`${flag} must be a positive integer`);
  }
  return parsed;
}

function parseArgs(args) {
  const options = {
    baseUrl: DEFAULT_BASE_URL,
    outDir: DEFAULT_OUT_DIR,
    concurrency: DEFAULT_CONCURRENCY,
    listOnly: false,
    help: false,
  };

  // Returns the value following a flag, refusing to consume another flag.
  function takeValue(i, flag, what) {
    const value = args[i + 1];
    if (value === undefined || value === '' || value.startsWith('-')) {
      throw new UsageError(`${flag} requires ${what}`);
    }
    return value;
  }

  for (let i = 0; i < args.length; i++) {
    const arg = args[i];
    if (arg === '--out') {
      options.outDir = takeValue(i++, '--out', 'a directory');
    } else if (arg === '--base-url') {
      options.baseUrl = takeValue(i++, '--base-url', 'a URL');
    } else if (arg === '--concurrency') {
      options.concurrency = parsePositiveInteger(takeValue(i++, '--concurrency', 'a number'), '--concurrency');
      if (options.concurrency > MAX_CONCURRENCY) {
        throw new UsageError(`--concurrency cannot exceed ${MAX_CONCURRENCY}`);
      }
    } else if (arg === '--list') {
      options.listOnly = true;
    } else if (arg === '-h' || arg === '--help') {
      options.help = true;
    } else {
      throw new UsageError(`Unknown option: ${arg}`);
    }
  }

  options.baseUrl = normalizeBaseUrl(options.baseUrl);
  options.outDir = resolve(options.outDir);
  return options;
}

function printHelp() {
  console.log(`
Usage: node scripts/export-rag-corpus.js [options]

Fetch the raw Fern Markdown export for every page in sitemap.xml.

Options:
  --out <dir>          Output directory (default: ${DEFAULT_OUT_DIR})
  --base-url <url>     Docs base URL (default: ${DEFAULT_BASE_URL})
  --concurrency <n>    Parallel fetches (default: ${DEFAULT_CONCURRENCY}, max: ${MAX_CONCURRENCY})
  --list               Print sitemap page URLs without exporting
  -h, --help           Show this help

Exit codes: 0 = snapshot written · 1 = sitemap/page export failure · 2 = usage/runtime error
`);
}

function decodeXmlEntities(value) {
  return value.replace(/&(#x[0-9a-f]+|#\d+|amp|lt|gt|quot|apos);/gi, (match, entity) => {
    const lower = entity.toLowerCase();
    if (lower === 'amp') return '&';
    if (lower === 'lt') return '<';
    if (lower === 'gt') return '>';
    if (lower === 'quot') return '"';
    if (lower === 'apos') return "'";

    const codePoint = lower.startsWith('#x')
      ? Number.parseInt(lower.slice(2), 16)
      : Number.parseInt(lower.slice(1), 10);
    try {
      return String.fromCodePoint(codePoint);
    } catch {
      throw new CorpusExportError(`Invalid XML character reference: ${match}`);
    }
  });
}

function canonicalPageUrl(value, baseUrl) {
  let page;
  try {
    page = new URL(value);
  } catch {
    throw new CorpusExportError(`Invalid sitemap URL: ${value}`);
  }

  const base = new URL(baseUrl);
  const basePath = base.pathname === '/' ? '' : base.pathname.replace(/\/+$/, '');
  const pagePath = page.pathname === '/' ? '/' : page.pathname.replace(/\/+$/, '');
  const insideBasePath = basePath === '' || pagePath === basePath || pagePath.startsWith(`${basePath}/`);

  if (page.protocol !== base.protocol || page.host !== base.host || !insideBasePath) {
    throw new CorpusExportError(`Sitemap URL is outside --base-url: ${value}`);
  }
  if (page.search || page.hash) {
    throw new CorpusExportError(`Sitemap URL contains a query string or fragment: ${value}`);
  }

  page.pathname = pagePath;
  return page.toString().replace(/\/$/, '');
}

function parseSitemap(xml, baseUrl) {
  if (/<sitemapindex[\s>]/i.test(xml)) {
    throw new CorpusExportError(
      'sitemap.xml is a sitemap index; this exporter expects a flat <urlset> of page URLs'
    );
  }

  const matches = [...xml.matchAll(/<loc>\s*([^<]+?)\s*<\/loc>/gi)];
  if (matches.length === 0) {
    throw new CorpusExportError('sitemap.xml contains no <loc> page URLs');
  }

  const urls = new Set();
  for (const match of matches) {
    urls.add(canonicalPageUrl(decodeXmlEntities(match[1]), baseUrl));
  }
  return [...urls].sort();
}

async function fetchSitemapPages(baseUrl, fetchOptions = {}) {
  const sitemapUrl = `${baseUrl}/sitemap.xml`;
  let response;
  try {
    response = await fetchWithRetry(sitemapUrl, {
      ...fetchOptions,
      userAgent: USER_AGENT,
      headers: {
        ...fetchOptions.headers,
        Accept: 'application/xml, text/xml;q=0.9',
      },
      responseType: 'text',
      onRetry({ attempt, maxAttempts, error }) {
        log.debug(`  [${attempt}/${maxAttempts}] Retrying ${sitemapUrl} (${error.message})`);
      },
    });
  } catch (err) {
    throw new CorpusExportError(`Could not fetch ${sitemapUrl}: ${err.message}`);
  }

  if (response.status !== 200) {
    throw new CorpusExportError(`Could not fetch ${sitemapUrl}: HTTP ${response.status}`);
  }
  return parseSitemap(response.body, baseUrl);
}

function strictEncodeSegment(decoded) {
  let encoded = '';
  for (const byte of Buffer.from(decoded, 'utf8')) {
    const unreserved =
      (byte >= 0x41 && byte <= 0x5a) ||
      (byte >= 0x61 && byte <= 0x7a) ||
      (byte >= 0x30 && byte <= 0x39) ||
      byte === 0x2d || byte === 0x2e || byte === 0x5f || byte === 0x7e;
    encoded += unreserved ? String.fromCharCode(byte) : `%${byte.toString(16).toUpperCase().padStart(2, '0')}`;
  }
  return encoded;
}

function safeSegment(segment) {
  let decoded;
  try {
    decoded = decodeURIComponent(segment);
  } catch {
    throw new CorpusExportError(`URL path segment has invalid percent encoding: ${segment}`);
  }
  if (decoded === '.' || decoded === '..') {
    throw new CorpusExportError(`Unsafe URL path segment: ${segment}`);
  }

  let encoded = strictEncodeSegment(decoded);
  // Avoid Windows reserved filenames and trailing dots while retaining a
  // deterministic, reversible percent-encoded representation.
  if (/^(con|prn|aux|nul|com[1-9]|lpt[1-9])(?:\.|$)/i.test(decoded)) {
    const first = decoded.codePointAt(0).toString(16).toUpperCase().padStart(2, '0');
    encoded = `%${first}${encoded.slice(1)}`;
  }
  encoded = encoded.replace(/\.+$/, (dots) => '%2E'.repeat(dots.length));
  return encoded;
}

function relativeUrlPath(pageUrl, baseUrl) {
  const page = new URL(canonicalPageUrl(pageUrl, baseUrl));
  const base = new URL(baseUrl);
  const basePath = base.pathname === '/' ? '' : base.pathname.replace(/\/+$/, '');
  const relative = page.pathname.slice(basePath.length).replace(/^\//, '');
  if (relative.includes('//')) {
    throw new CorpusExportError(`URL path contains an empty segment: ${pageUrl}`);
  }
  return relative;
}

/**
 * Local path for a page: its URL path relative to --base-url plus `.md`, so it
 * matches the `.md` URL Fern serves. Only the site root needs a name (index.md).
 * A page and its child section land as a sibling file and directory
 * (`swml.md` beside `swml/`), which no filesystem treats as a collision.
 */
function pageUrlToRelPath(pageUrl, baseUrl) {
  const relative = relativeUrlPath(pageUrl, baseUrl);
  if (relative === '') return 'index.md';
  return `${relative.split('/').map(safeSegment).join('/')}.md`;
}

function markdownUrlForPage(pageUrl) {
  const url = new URL(pageUrl);
  url.pathname = `${url.pathname.replace(/\/+$/, '')}.md`;
  return url.toString();
}

function planDocuments(pageUrls, baseUrl) {
  const planned = pageUrls.map((url) => ({ url, path: pageUrlToRelPath(url, baseUrl) }));
  const seen = new Map();

  for (const document of planned) {
    const key = document.path.toLowerCase();
    const existing = seen.get(key);
    if (existing) {
      throw new CorpusExportError(
        `Sitemap URLs map to the same local path '${document.path}': ${existing} and ${document.url}`
      );
    }
    seen.set(key, document.url);
  }
  return planned;
}

function validateMarkdownResponse(response) {
  if (response.status !== 200) return `HTTP ${response.status}`;

  const mediaType = response.contentType?.split(';', 1)[0].trim().toLowerCase();
  if (mediaType !== 'text/markdown') {
    return `expected Content-Type text/markdown, received ${response.contentType || 'none'}`;
  }
  // trim() also strips a leading BOM (U+FEFF counts as whitespace).
  const text = response.body.toString('utf8').trim();
  if (text.length === 0) return 'empty Markdown response';
  if (text.startsWith('# Page Not Found')) {
    return 'Fern returned a Page Not Found Markdown stub';
  }
  return null;
}

function sha256(buffer) {
  return `sha256:${createHash('sha256').update(buffer).digest('hex')}`;
}

function destinationFor(stageDir, relPath) {
  const destination = resolve(stageDir, ...relPath.split('/'));
  const stageRoot = resolve(stageDir);
  if (destination !== stageRoot && !destination.startsWith(`${stageRoot}${sep}`)) {
    throw new CorpusExportError(`Output path escapes staging directory: ${relPath}`);
  }
  return destination;
}

function writeRawDocument(stageDir, relPath, body) {
  const destination = destinationFor(stageDir, relPath);
  mkdirSync(dirname(destination), { recursive: true });
  writeFileSync(destination, body);
}

function validateOutputPath(outDir) {
  const output = resolve(outDir);
  const root = parsePath(output).root;
  if (output === root || output === REPO_ROOT || REPO_ROOT.startsWith(`${output}${sep}`)) {
    throw new UsageError(`Refusing to use broad output directory: ${output}`);
  }

  const gitDir = join(REPO_ROOT, '.git');
  if (output === gitDir || output.startsWith(`${gitDir}${sep}`)) {
    throw new UsageError(`Refusing to write inside .git: ${output}`);
  }

  // Publishing deletes whatever is at the output path, so only replace
  // something this script produced: a missing or empty directory, or a
  // previous snapshot identified by its manifest.
  if (existsSync(output)) {
    if (!statSync(output).isDirectory()) {
      throw new UsageError(`Output path exists and is not a directory: ${output}`);
    }
    if (readdirSync(output).length > 0 && !isCorpusSnapshot(output)) {
      throw new UsageError(
        `Refusing to replace ${output}: it is not an empty directory or a previous ` +
        `corpus snapshot (no valid ${MANIFEST_NAME}). Delete it or choose another --out.`
      );
    }
  }
  return output;
}

function isCorpusSnapshot(directory) {
  try {
    const manifest = JSON.parse(readFileSync(join(directory, MANIFEST_NAME), 'utf8'));
    return Number.isInteger(manifest?.schema_version);
  } catch {
    return false;
  }
}

function publishStagedDirectory(stageDir, outDir) {
  const output = validateOutputPath(outDir);
  const backup = `${output}.backup-${randomUUID()}`;
  let movedExisting = false;

  if (existsSync(output)) {
    renameSync(output, backup);
    movedExisting = true;
  }

  try {
    renameSync(stageDir, output);
  } catch (err) {
    if (movedExisting && existsSync(backup) && !existsSync(output)) {
      renameSync(backup, output);
    }
    throw err;
  }

  if (movedExisting) rmSync(backup, { recursive: true, force: true });
}

async function withStagingDirectory(outDir, build) {
  const output = validateOutputPath(outDir);
  const parent = dirname(output);
  mkdirSync(parent, { recursive: true });
  const stageDir = mkdtempSync(join(parent, `.${basename(output)}.tmp-`));
  const removeStage = () => {
    if (existsSync(stageDir)) rmSync(stageDir, { recursive: true, force: true });
  };
  // `finally` does not run when a signal ends the process, so clean up the
  // staging directory on Ctrl-C / SIGTERM. Signals are only observed between
  // awaits, never inside the synchronous publish step.
  const onSignal = (signal) => {
    removeStage();
    process.exit(SIGNAL_EXIT_CODES[signal]);
  };
  for (const signal of Object.keys(SIGNAL_EXIT_CODES)) process.on(signal, onSignal);

  try {
    await build(stageDir);
    publishStagedDirectory(stageDir, output);
  } finally {
    for (const signal of Object.keys(SIGNAL_EXIT_CODES)) process.removeListener(signal, onSignal);
    removeStage();
  }
}

function buildManifest({ baseUrl, documents, generatedAt, sitemapCount }) {
  const sorted = [...documents].sort((a, b) => a.path.localeCompare(b.path));
  return {
    schema_version: 1,
    generated_at: generatedAt,
    base_url: baseUrl,
    counts: {
      sitemap: sitemapCount,
      written: sorted.length,
    },
    documents: sorted,
  };
}

async function fetchDocuments(planned, stageDir, concurrency, fetchOptions = {}) {
  const documents = [];
  const failures = [];
  let completed = 0;

  await runPool(planned, async (document) => {
    const markdownUrl = markdownUrlForPage(document.url);
    try {
      const response = await fetchWithRetry(markdownUrl, {
        ...fetchOptions,
        userAgent: USER_AGENT,
        headers: { ...fetchOptions.headers, Accept: 'text/markdown' },
        // Unlike the sitemap fetch, documents do not follow redirects: a
        // redirected page fails loudly instead of storing another page's
        // body under this path.
        redirect: 'manual',
        responseType: 'buffer',
        onRetry({ attempt, maxAttempts, error }) {
          log.debug(`  [${attempt}/${maxAttempts}] Retrying ${markdownUrl} (${error.message})`);
        },
      });
      const problem = validateMarkdownResponse(response);
      if (problem) throw new Error(problem);

      writeRawDocument(stageDir, document.path, response.body);
      documents.push({
        path: document.path,
        url: document.url,
        sha256: sha256(response.body),
        bytes: response.body.length,
      });
    } catch (err) {
      failures.push({ url: document.url, markdown_url: markdownUrl, message: err.message });
    }

    completed++;
    if (completed % 500 === 0) log.info(`  ${completed}/${planned.length} pages fetched...`);
  }, concurrency);

  if (failures.length > 0) {
    failures.sort((a, b) => a.url.localeCompare(b.url));
    throw new DocumentExportError(failures);
  }
  return documents;
}

async function exportCorpus(options, fetchOptions = {}) {
  log.step(`Fetching sitemap: ${options.baseUrl}/sitemap.xml`);
  const pageUrls = await fetchSitemapPages(options.baseUrl, fetchOptions);
  log.info(`Found ${pageUrls.length} unique sitemap pages`);

  if (options.listOnly) {
    for (const url of pageUrls) console.log(url);
    return { pageUrls, manifest: null };
  }

  const planned = planDocuments(pageUrls, options.baseUrl);
  let manifest;
  await withStagingDirectory(options.outDir, async (stageDir) => {
    log.step(`Fetching ${planned.length} Markdown exports (concurrency: ${options.concurrency})...`);
    const documents = await fetchDocuments(planned, stageDir, options.concurrency, fetchOptions);
    manifest = buildManifest({
      baseUrl: options.baseUrl,
      documents,
      generatedAt: new Date().toISOString(),
      sitemapCount: pageUrls.length,
    });
    writeFileSync(join(stageDir, MANIFEST_NAME), `${JSON.stringify(manifest, null, 2)}\n`);
  });

  return { pageUrls, manifest };
}

async function main() {
  let options;
  try {
    options = parseArgs(process.argv.slice(2));
  } catch (err) {
    if (err instanceof UsageError) {
      log.error(err.message);
      printHelp();
      return 2;
    }
    throw err;
  }

  if (options.help) {
    printHelp();
    return 0;
  }

  log.header('Fern Markdown Corpus Export');
  log.newline();

  try {
    const { manifest } = await exportCorpus(options);
    if (manifest) {
      log.newline();
      log.success(`Wrote ${manifest.counts.written} raw Markdown files to ${options.outDir}`);
    }
    return 0;
  } catch (err) {
    if (err instanceof DocumentExportError) {
      const collector = log.collector('rag-export-failures');
      for (const failure of err.failures) {
        collector.failure(`${failure.url} — ${failure.message}`);
      }
      collector.flush({ header: 'Markdown export failures:', limit: 0 });
      log.failure('Snapshot was not published; the previous output was left unchanged');
      return 1;
    }
    if (err instanceof CorpusExportError) {
      log.failure(err.message);
      return 1;
    }
    if (err instanceof UsageError) {
      log.error(err.message);
      return 2;
    }
    log.error(err.stack || err.message);
    return 2;
  }
}

export {
  CorpusExportError,
  DocumentExportError,
  UsageError,
  buildManifest,
  canonicalPageUrl,
  exportCorpus,
  fetchDocuments,
  fetchSitemapPages,
  markdownUrlForPage,
  pageUrlToRelPath,
  parseArgs,
  parseSitemap,
  planDocuments,
  publishStagedDirectory,
  safeSegment,
  sha256,
  validateMarkdownResponse,
  validateOutputPath,
  withStagingDirectory,
  writeRawDocument,
};

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  main().then((exitCode) => {
    process.exitCode = exitCode;
  }).catch((err) => {
    log.error(err.stack || err.message);
    process.exitCode = 2;
  });
}
