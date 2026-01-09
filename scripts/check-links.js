#!/usr/bin/env node
/**
 * Link Checker Script
 *
 * Checks links from a sitemap using lychee, plus local GitHub URL verification.
 * Designed to work identically in local development and CI environments.
 *
 * Usage:
 *   node scripts/check-links.js                     # Check production sitemap
 *   node scripts/check-links.js --sitemap <url>     # Check specific sitemap URL
 *   node scripts/check-links.js --skip-github       # Skip GitHub local verification
 *   node scripts/check-links.js --skip-http         # Skip HTTP link checking (lychee)
 *   node scripts/check-links.js --no-progress       # Disable lychee progress bar
 *   node scripts/check-links.js --format json       # Use JSON output for lychee
 *   node scripts/check-links.js --output <file>     # Write report to file
 *
 * The script:
 *   1. Fetches sitemap URLs
 *   2. Extracts GitHub blob/tree/tag URLs from source files for local verification
 *   3. Extracts GitHub HTTP URLs (issues, PRs, etc.) for separate low-concurrency checking
 *   4. Verifies GitHub blob/tree/tag URLs locally (without HTTP requests)
 *   5. Runs lychee on sitemap URLs (excluding GitHub entirely)
 *   6. Runs lychee on GitHub HTTP URLs with low concurrency (to avoid rate limiting)
 *   7. Retries 429 failures with exponential backoff
 *   8. Falls back to local verification for 5xx GitHub errors
 *
 * Environment Variables:
 *   LOGGER_LEVEL  Set log verbosity: error, warn, info, debug, trace (default: info)
 */

import { execSync, spawnSync } from 'node:child_process';
import { existsSync, mkdirSync, readFileSync, readdirSync, writeFileSync, unlinkSync, rmSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { Logger } from './utils/logger.js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = dirname(__dirname);
const LINK_CHECK_DIR = join(REPO_ROOT, '.link-check');
const GITHUB_REPOS_DIR = join(LINK_CHECK_DIR, '.github-repos');

// ============================================
// Cleanup
// ============================================

function cleanup() {
  if (existsSync(LINK_CHECK_DIR)) {
    log.debug(`Cleaning up: ${LINK_CHECK_DIR}`);
    try {
      rmSync(LINK_CHECK_DIR, { recursive: true, force: true });
    } catch (err) {
      log.debug(`Failed to cleanup: ${err.message}`);
    }
  }
}

const log = new Logger();
const LYCHEE_CONFIG = join(REPO_ROOT, 'lychee.toml');

// ============================================
// Retry Configuration
// ============================================

const RETRY_CONFIG = {
  maxAttempts: 4,
  initialDelayMs: 5000,  // 5 seconds
  maxDelayMs: 60000,     // 60 seconds
  backoffMultiplier: 2,
};

const GITHUB_HTTP_CONCURRENCY = 2;  // Low concurrency for GitHub to avoid rate limits

// ============================================
// Sitemap
// ============================================

async function fetchSitemap(url) {
  log.step(`Fetching sitemap: ${url}`);
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`Failed to fetch sitemap: ${response.status}`);
  }
  const xml = await response.text();
  const urls = [...xml.matchAll(/<loc>([^<]+)<\/loc>/g)].map((m) => m[1]);
  return [...new Set(urls)]; // Dedupe
}

// ============================================
// GitHub URL Extraction
// ============================================

function getFilesRecursively(dir) {
  const files = [];
  try {
    for (const entry of readdirSync(dir, { withFileTypes: true })) {
      const fullPath = join(dir, entry.name);
      if (entry.isDirectory() && !entry.name.startsWith('.') && entry.name !== 'node_modules') {
        files.push(...getFilesRecursively(fullPath));
      } else if (entry.isFile()) {
        files.push(fullPath);
      }
    }
  } catch {
    // Skip unreadable directories
  }
  return files;
}

/**
 * Extract GitHub URLs from source files, categorized by type.
 * - localVerify: blob/tree/tag URLs that should be verified locally (GitHub blocks HTTP requests)
 * - httpCheck: issues/PRs/discussions/commits that need HTTP checking but with low concurrency
 */
function extractGitHubUrls() {
  log.debug('Extracting GitHub URLs from source files...');

  const localPatterns = [
    /https:\/\/github\.com\/[^/]+\/[^/]+\/(blob|tree)\/[^"')<>\s]+/g,
    /https:\/\/github\.com\/[^/]+\/[^/]+\/releases\/tag\/[^"')<>\s]+/g,
  ];

  const httpPatterns = [
    /https:\/\/github\.com\/[^/]+\/[^/]+\/issues\/[^"')<>\s]+/g,
    /https:\/\/github\.com\/[^/]+\/[^/]+\/pull\/[^"')<>\s]+/g,
    /https:\/\/github\.com\/[^/]+\/[^/]+\/discussions\/[^"')<>\s]+/g,
    /https:\/\/github\.com\/[^/]+\/[^/]+\/commits?\/[^"')<>\s]+/g,
    /https:\/\/github\.com\/[^/]+\/[^/]+\/compare\/[^"')<>\s]+/g,
  ];

  const exclude = [/github\.com\/your-org\//, /github\.com\/owner\/repo/];

  const localVerify = new Set();
  const httpCheck = new Set();
  const fernDir = join(REPO_ROOT, 'fern');

  if (!existsSync(fernDir)) return { localVerify: [], httpCheck: [] };

  const files = getFilesRecursively(fernDir);
  if (existsSync(join(REPO_ROOT, 'README.md'))) {
    files.push(join(REPO_ROOT, 'README.md'));
  }

  for (const file of files) {
    try {
      const content = readFileSync(file, 'utf8');

      // Extract local verification URLs (blob/tree/tag)
      for (const pattern of localPatterns) {
        pattern.lastIndex = 0;
        for (const match of content.matchAll(pattern)) {
          const url = match[0];
          if (!exclude.some((p) => p.test(url))) {
            localVerify.add(url);
          }
        }
      }

      // Extract HTTP check URLs (issues/PRs/etc)
      for (const pattern of httpPatterns) {
        pattern.lastIndex = 0;
        for (const match of content.matchAll(pattern)) {
          const url = match[0];
          if (!exclude.some((p) => p.test(url))) {
            httpCheck.add(url);
          }
        }
      }
    } catch {
      // Skip unreadable files
    }
  }

  return {
    localVerify: [...localVerify],
    httpCheck: [...httpCheck],
  };
}

// ============================================
// GitHub Verification (Local)
// ============================================

function cloneRepo(repoUrl, repoDir) {
  if (existsSync(repoDir)) {
    log.debug(`Repo already cloned: ${repoDir}`);
    return true;
  }

  log.debug(`Cloning ${repoUrl}...`);
  try {
    execSync(`git clone --depth 1 --filter=blob:none --sparse "${repoUrl}.git" "${repoDir}"`, {
      stdio: 'ignore',
    });
    execSync('git fetch --tags --depth 1', { cwd: repoDir, stdio: 'ignore' });
    return true;
  } catch {
    log.debug(`Failed to clone ${repoUrl}`);
    return false;
  }
}

function verifyGitHubUrl(url, reposDir) {
  const cleanUrl = url.split('#')[0].split('?')[0];
  const match = cleanUrl.match(/https:\/\/github\.com\/([^/]+)\/([^/]+)\/(blob|tree|releases\/tag)\/(.+)/);

  if (!match) return { valid: false, error: 'Could not parse URL' };

  const [, org, repo, type, rest] = match;
  const repoDir = join(reposDir, `${org}_${repo}`);

  if (!cloneRepo(`https://github.com/${org}/${repo}`, repoDir)) {
    return { valid: false, error: 'Failed to clone repo' };
  }

  try {
    if (type === 'releases/tag') {
      const tags = execSync('git tag -l', { cwd: repoDir, encoding: 'utf8' }).split('\n').map((t) => t.trim());
      return tags.includes(rest) ? { valid: true } : { valid: false, error: `Tag not found: ${rest}` };
    }

    // blob or tree
    const slashIndex = rest.indexOf('/');
    const ref = slashIndex > 0 ? rest.slice(0, slashIndex) : rest;
    const path = slashIndex > 0 ? decodeURIComponent(rest.slice(slashIndex + 1)) : '';

    // Fetch commit if SHA
    if (/^[0-9a-f]{40}$/.test(ref)) {
      try {
        execSync(`git fetch --depth 1 origin ${ref}`, { cwd: repoDir, stdio: 'ignore' });
      } catch {
        // May already exist
      }
    }

    // Check file
    const files = execSync(`git ls-tree -r --name-only "${ref}" -- "${path}"`, {
      cwd: repoDir,
      encoding: 'utf8',
      stdio: ['pipe', 'pipe', 'ignore'],
    });
    if (files.trim().split('\n').includes(path)) return { valid: true };

    // Check directory
    const dirs = execSync(`git ls-tree -d --name-only "${ref}" -- "${path}"`, {
      cwd: repoDir,
      encoding: 'utf8',
      stdio: ['pipe', 'pipe', 'ignore'],
    });
    if (dirs.trim()) return { valid: true };

    return { valid: false, error: `Path not found: ${path}` };
  } catch {
    return { valid: false, error: `Invalid ref or path` };
  }
}

function verifyGitHubUrls(urls) {
  if (urls.length === 0) return { passed: 0, failed: 0, errors: [] };

  mkdirSync(GITHUB_REPOS_DIR, { recursive: true });

  // Clone repos first
  const repos = new Set();
  for (const url of urls) {
    const m = url.match(/https:\/\/github\.com\/([^/]+\/[^/]+)/);
    if (m) repos.add(m[1]);
  }

  log.step('Cloning repositories for verification...');
  for (const repo of repos) {
    const [org, name] = repo.split('/');
    const repoDir = join(GITHUB_REPOS_DIR, `${org}_${name}`);
    if (!existsSync(repoDir)) {
      log.info(`  Cloning ${repo}...`);
      cloneRepo(`https://github.com/${repo}`, repoDir);
    }
  }

  // Verify each URL
  log.step('Verifying GitHub URLs...');
  const collector = log.collector('github');
  let passed = 0;
  const errors = [];

  for (const url of urls) {
    const result = verifyGitHubUrl(url, GITHUB_REPOS_DIR);
    if (result.valid) {
      collector.success(url);
      passed++;
    } else {
      collector.failure(`${url} (${result.error})`);
      errors.push({ url, error: result.error });
    }
  }

  collector.flush({ indent: '  ' });

  return { passed, failed: errors.length, errors };
}

// ============================================
// Lychee HTTP Link Checking
// ============================================

// Lychee exit codes:
// 0 - Success
// 1 - Missing inputs or runtime/config errors
// 2 - Link check failures (broken links found)
// 3 - Config file errors
const LYCHEE_EXIT = {
  SUCCESS: 0,
  RUNTIME_ERROR: 1,
  LINK_FAILURES: 2,
  CONFIG_ERROR: 3,
};

/**
 * Run lychee and parse JSON results
 */
function runLychee(urls, options = {}) {
  const {
    noProgress = false,
    concurrency = 20,
    excludeGithub = false,
    label = 'links',
  } = options;

  if (urls.length === 0) {
    log.info(`No ${label} to check`);
    return { exitCode: 0, failed: false, results: null };
  }

  log.step(`Checking ${urls.length} ${label} with lychee (concurrency: ${concurrency})...`);

  // Write URLs to temp file for lychee to read
  const tempFile = join(LINK_CHECK_DIR, `urls-${Date.now()}.txt`);
  const outputFile = join(LINK_CHECK_DIR, `lychee-output-${Date.now()}.json`);
  mkdirSync(LINK_CHECK_DIR, { recursive: true });
  writeFileSync(tempFile, urls.join('\n'));

  const args = [
    '--config', LYCHEE_CONFIG,
    '--format', 'json',
    '--output', outputFile,
    '--max-concurrency', String(concurrency),
    '--files-from', tempFile,
  ];

  if (noProgress) {
    args.push('--no-progress');
  }

  if (excludeGithub) {
    args.push('--exclude', '^https://github\\.com/');
  }

  // Run lychee
  const result = spawnSync('lychee', args, {
    stdio: noProgress ? 'ignore' : 'inherit',
    encoding: 'utf8',
  });

  // Clean up temp file
  try {
    unlinkSync(tempFile);
  } catch {
    // Ignore cleanup errors
  }

  const code = result.status;
  log.debug(`Lychee exited with code ${code}`);

  // Parse JSON output
  let results = null;
  try {
    const output = readFileSync(outputFile, 'utf8');
    results = JSON.parse(output);
    unlinkSync(outputFile);
  } catch {
    log.debug('Could not parse lychee JSON output');
  }

  if (code === LYCHEE_EXIT.SUCCESS) {
    return { exitCode: code, failed: false, results };
  } else if (code === LYCHEE_EXIT.LINK_FAILURES) {
    return { exitCode: code, failed: true, results };
  } else if (code === LYCHEE_EXIT.CONFIG_ERROR) {
    log.error('Lychee config error - check lychee.toml');
    return { exitCode: code, failed: true, results };
  } else {
    log.error(`Lychee runtime error (exit code ${code})`);
    return { exitCode: code, failed: true, results };
  }
}

/**
 * Parse lychee JSON results into categorized failures
 */
function categorizeLycheeFailures(results) {
  const failures = {
    rateLimited: [],    // 429 errors - will retry
    serverErrors: [],   // 5xx errors - may fallback to local verification
    clientErrors: [],   // 4xx errors (except 429) - likely real broken links
    other: [],          // Network errors, timeouts, etc.
  };

  if (!results || !results.error_map) {
    return failures;
  }

  for (const [sourceUrl, errors] of Object.entries(results.error_map)) {
    for (const error of errors) {
      // Extract status code - lychee format: { status: { text: "...", code: 404 } }
      // error.url is the actual broken link, sourceUrl is the page where it was found
      const statusCode = error.status?.code;
      const statusText = error.status?.text || '';
      const brokenUrl = error.url || sourceUrl;

      if (statusCode === 429 || statusText.includes('429')) {
        failures.rateLimited.push({ url: brokenUrl, error, status: statusCode, sourceUrl });
      } else if (statusCode >= 500 && statusCode < 600) {
        failures.serverErrors.push({ url: brokenUrl, error, status: statusCode, sourceUrl });
      } else if (statusCode >= 400 && statusCode < 500) {
        failures.clientErrors.push({ url: brokenUrl, error, status: statusCode, sourceUrl });
      } else {
        // Network errors, timeouts, etc. - statusCode may be undefined
        failures.other.push({ url: brokenUrl, error, status: statusCode || statusText, sourceUrl });
      }
    }
  }

  return failures;
}

// ============================================
// Retry Logic with Exponential Backoff
// ============================================

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function checkUrlWithRetry(url) {
  let delay = RETRY_CONFIG.initialDelayMs;

  for (let attempt = 1; attempt <= RETRY_CONFIG.maxAttempts; attempt++) {
    try {
      const controller = new AbortController();
      const timeout = setTimeout(() => controller.abort(), 30000);

      const response = await fetch(url, {
        method: 'HEAD',
        signal: controller.signal,
        headers: {
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        },
      });

      clearTimeout(timeout);

      if (response.ok || (response.status >= 300 && response.status < 400)) {
        return { success: true, status: response.status };
      }

      if (response.status === 429) {
        if (attempt < RETRY_CONFIG.maxAttempts) {
          log.debug(`  [${attempt}/${RETRY_CONFIG.maxAttempts}] 429 for ${url}, waiting ${delay / 1000}s...`);
          await sleep(delay);
          delay = Math.min(delay * RETRY_CONFIG.backoffMultiplier, RETRY_CONFIG.maxDelayMs);
          continue;
        }
      }

      return { success: false, status: response.status };
    } catch (err) {
      if (attempt === RETRY_CONFIG.maxAttempts) {
        return { success: false, error: err.message };
      }
      await sleep(delay);
      delay = Math.min(delay * RETRY_CONFIG.backoffMultiplier, RETRY_CONFIG.maxDelayMs);
    }
  }

  return { success: false, error: 'Max retries exceeded' };
}

async function retryRateLimitedUrls(urls) {
  if (urls.length === 0) return { recovered: [], stillFailing: [] };

  log.step(`Retrying ${urls.length} rate-limited URLs with exponential backoff...`);

  const recovered = [];
  const stillFailing = [];

  for (const { url } of urls) {
    const result = await checkUrlWithRetry(url);
    if (result.success) {
      log.debug(`  ✓ Recovered: ${url}`);
      recovered.push(url);
    } else {
      log.debug(`  ✗ Still failing: ${url} (${result.status || result.error})`);
      stillFailing.push({ url, status: result.status, error: result.error });
    }
  }

  return { recovered, stillFailing };
}

// ============================================
// 5xx Fallback: Local Verification for GitHub URLs
// ============================================

function tryLocalVerificationFallback(serverErrors) {
  const githubErrors = serverErrors.filter(({ url }) =>
    url.match(/^https:\/\/github\.com\/[^/]+\/[^/]+\/(blob|tree|releases\/tag)\//)
  );

  if (githubErrors.length === 0) {
    return { verified: [], stillFailing: serverErrors };
  }

  log.step(`Attempting local verification for ${githubErrors.length} GitHub 5xx errors...`);

  const verified = [];
  const stillFailing = [];

  // Ensure repos are cloned
  mkdirSync(GITHUB_REPOS_DIR, { recursive: true });

  for (const { url, error, status } of serverErrors) {
    // Check if it's a GitHub blob/tree/tag URL
    if (url.match(/^https:\/\/github\.com\/[^/]+\/[^/]+\/(blob|tree|releases\/tag)\//)) {
      const result = verifyGitHubUrl(url, GITHUB_REPOS_DIR);
      if (result.valid) {
        log.debug(`  ✓ Verified locally (5xx but exists): ${url}`);
        verified.push(url);
      } else {
        stillFailing.push({ url, error, status, localError: result.error });
      }
    } else {
      // Non-GitHub URL with 5xx - keep as failure
      stillFailing.push({ url, error, status });
    }
  }

  return { verified, stillFailing };
}

// ============================================
// Results Summary
// ============================================

function printSummary(results) {
  const {
    githubLocal,
    httpMain,
    githubHttp,
    retryResults,
    fallbackResults,
    finalFailures,
  } = results;

  log.newline();
  log.header('Summary');
  log.newline();

  // GitHub local verification
  if (githubLocal) {
    log.info(`GitHub URLs (local verification): ${githubLocal.passed} passed, ${githubLocal.failed} failed`);
  }

  // HTTP results - lychee uses top-level fields not a stats object
  if (httpMain.results) {
    const r = httpMain.results;
    log.info(`HTTP links: ${r.successful || 0} passed, ${r.errors || 0} failed, ${r.excludes || 0} excluded`);
  }

  if (githubHttp.results) {
    const r = githubHttp.results;
    log.info(`GitHub HTTP links: ${r.successful || 0} passed, ${r.errors || 0} failed`);
  }

  // Retry results
  if (retryResults.recovered.length > 0) {
    log.info(`Rate-limited (429): ${retryResults.recovered.length} recovered after retry`);
  }
  if (retryResults.stillFailing.length > 0) {
    log.warn(`Rate-limited (429): ${retryResults.stillFailing.length} still failing after retry`);
  }

  // Fallback results
  if (fallbackResults.verified.length > 0) {
    log.info(`5xx errors: ${fallbackResults.verified.length} verified locally (false positives)`);
  }

  // Final failures
  log.newline();
  if (finalFailures.length === 0) {
    log.success('All links are valid!');
  } else {
    log.failure(`${finalFailures.length} broken link(s) found:`);
    log.newline();
    for (const failure of finalFailures.slice(0, 20)) {
      const status = failure.status || failure.error || 'unknown';
      log.info(`  • [${status}] ${failure.url}`);
    }
    if (finalFailures.length > 20) {
      log.info(`  ... and ${finalFailures.length - 20} more`);
    }
  }

  return finalFailures.length === 0;
}

function writeReport(outputFile, results) {
  const {
    githubLocal,
    finalFailures,
    retryResults,
    fallbackResults,
  } = results;

  let report = '# Link Check Report\n\n';
  report += `Generated: ${new Date().toISOString()}\n\n`;

  if (finalFailures.length === 0) {
    report += '## ✅ All links are valid!\n\n';
  } else {
    report += `## ❌ ${finalFailures.length} Broken Link(s)\n\n`;
    report += '| URL | Status |\n|-----|--------|\n';
    for (const failure of finalFailures) {
      const status = failure.status || failure.error || 'unknown';
      report += `| ${failure.url} | ${status} |\n`;
    }
    report += '\n';
  }

  if (githubLocal && githubLocal.errors.length > 0) {
    report += `## GitHub URLs Missing Locally\n\n`;
    for (const { url, error } of githubLocal.errors) {
      report += `- ${url} (${error})\n`;
    }
    report += '\n';
  }

  if (retryResults.recovered.length > 0) {
    report += `## Recovered After Retry (429)\n\n`;
    report += `${retryResults.recovered.length} URLs recovered after exponential backoff retry.\n\n`;
  }

  if (fallbackResults.verified.length > 0) {
    report += `## Verified Locally (5xx False Positives)\n\n`;
    report += `${fallbackResults.verified.length} GitHub URLs returned 5xx but exist locally.\n\n`;
  }

  writeFileSync(outputFile, report);
  log.info(`Report written to: ${outputFile}`);
}

// ============================================
// Main
// ============================================

async function main() {
  const args = process.argv.slice(2);
  let sitemapUrl = 'https://signalwire.docs.buildwithfern.com/sitemap.xml';
  let skipGithub = false;
  let skipHttp = false;
  let noProgress = false;
  let outputFile = null;

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--sitemap' && args[i + 1]) sitemapUrl = args[++i];
    if (args[i] === '--skip-github') skipGithub = true;
    if (args[i] === '--skip-http') skipHttp = true;
    if (args[i] === '--no-progress') noProgress = true;
    if (args[i] === '--output' && args[i + 1]) outputFile = args[++i];
    if (args[i] === '-h' || args[i] === '--help') {
      console.log(`
Usage: node scripts/check-links.js [options]

Options:
  --sitemap <url>   Check a specific sitemap URL (default: production)
  --skip-github     Skip GitHub URL verification (both local and HTTP)
  --skip-http       Skip all HTTP link checking (lychee)
  --no-progress     Disable progress output (for CI)
  --output <file>   Write report to file

Environment Variables:
  LOGGER_LEVEL      Set log verbosity: error, warn, info, debug, trace (default: info)

Examples:
  # Check production docs
  node scripts/check-links.js

  # Check a preview deployment
  node scripts/check-links.js --sitemap https://preview-xxx.docs.buildwithfern.com/sitemap.xml

  # Quick local check (skip GitHub for speed)
  node scripts/check-links.js --skip-github
`);
      process.exit(0);
    }
  }

  log.header('Link Checker');
  log.newline();

  // 1. Fetch sitemap URLs
  const sitemapUrls = await fetchSitemap(sitemapUrl);
  log.info(`Found ${sitemapUrls.length} URLs in sitemap`);
  log.debug(`Sample URLs: ${sitemapUrls.slice(0, 3).join(', ')}${sitemapUrls.length > 3 ? '...' : ''}`);

  // 2. Extract GitHub URLs from source files
  const githubUrls = extractGitHubUrls();
  log.info(`Found ${githubUrls.localVerify.length} GitHub URLs for local verification`);
  log.info(`Found ${githubUrls.httpCheck.length} GitHub URLs for HTTP checking`);

  log.newline();

  // Initialize results tracking
  const results = {
    githubLocal: null,
    httpMain: { results: null, failed: false },
    githubHttp: { results: null, failed: false },
    retryResults: { recovered: [], stillFailing: [] },
    fallbackResults: { verified: [], stillFailing: [] },
    finalFailures: [],
  };

  // 3. Verify GitHub blob/tree/tag URLs locally
  if (skipGithub) {
    log.info('Skipping GitHub verification (--skip-github)');
  } else if (githubUrls.localVerify.length === 0) {
    log.info('No GitHub URLs found for local verification');
  } else {
    results.githubLocal = verifyGitHubUrls(githubUrls.localVerify);
    log.newline();
  }

  // 4. Run lychee on sitemap URLs (excluding all GitHub URLs)
  if (skipHttp) {
    log.info('Skipping HTTP link checking (--skip-http)');
  } else {
    // Main lychee run - exclude GitHub entirely (handled separately)
    results.httpMain = runLychee(sitemapUrls, {
      noProgress,
      concurrency: 20,
      excludeGithub: true,
      label: 'non-GitHub links',
    });

    // Separate low-concurrency run for GitHub HTTP URLs
    if (!skipGithub && githubUrls.httpCheck.length > 0) {
      log.newline();
      results.githubHttp = runLychee(githubUrls.httpCheck, {
        noProgress,
        concurrency: GITHUB_HTTP_CONCURRENCY,
        excludeGithub: false,
        label: 'GitHub HTTP links',
      });
    }

    // 5. Categorize and handle failures
    const mainFailures = categorizeLycheeFailures(results.httpMain.results);
    const githubHttpFailures = categorizeLycheeFailures(results.githubHttp.results);

    // Combine failures from both runs
    const allRateLimited = [...mainFailures.rateLimited, ...githubHttpFailures.rateLimited];
    const allServerErrors = [...mainFailures.serverErrors, ...githubHttpFailures.serverErrors];
    const allClientErrors = [...mainFailures.clientErrors, ...githubHttpFailures.clientErrors];
    const allOtherErrors = [...mainFailures.other, ...githubHttpFailures.other];

    // 6. Retry rate-limited URLs
    if (allRateLimited.length > 0) {
      log.newline();
      results.retryResults = await retryRateLimitedUrls(allRateLimited);
    }

    // 7. Try local verification for 5xx GitHub errors
    if (allServerErrors.length > 0) {
      log.newline();
      results.fallbackResults = tryLocalVerificationFallback(allServerErrors);
    }

    // 8. Compile final failures
    // Add client errors (real broken links)
    for (const { url, status } of allClientErrors) {
      results.finalFailures.push({ url, status });
    }

    // Add rate-limited URLs that didn't recover
    for (const failure of results.retryResults.stillFailing) {
      results.finalFailures.push(failure);
    }

    // Add server errors that couldn't be verified locally
    for (const failure of results.fallbackResults.stillFailing) {
      results.finalFailures.push(failure);
    }

    // Add other errors
    for (const { url, error } of allOtherErrors) {
      results.finalFailures.push({ url, error });
    }
  }

  // Add GitHub local verification failures
  if (results.githubLocal && results.githubLocal.errors.length > 0) {
    for (const { url, error } of results.githubLocal.errors) {
      results.finalFailures.push({ url, error });
    }
  }

  // Print summary and write report
  log.newline();
  const allPassed = printSummary(results);

  if (outputFile) {
    writeReport(outputFile, results);
  }

  // Cleanup cloned repositories
  cleanup();

  // Exit with appropriate code
  process.exit(allPassed ? 0 : 1);
}

main().catch((err) => {
  log.error(err.message);
  process.exit(1);
});
