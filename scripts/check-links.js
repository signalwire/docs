#!/usr/bin/env node
/**
 * Link Checker Script
 *
 * Checks links from a sitemap using lychee, plus local GitHub URL verification.
 *
 * Usage:
 *   node scripts/check-links.js                     # Check production sitemap
 *   node scripts/check-links.js --sitemap <url>     # Check specific sitemap URL
 *   node scripts/check-links.js --skip-github       # Skip GitHub local verification
 *   node scripts/check-links.js --skip-http         # Skip HTTP link checking (lychee)
 *   node scripts/check-links.js --no-progress       # Disable lychee progress bar
 *   node scripts/check-links.js --format json       # Use JSON output for lychee
 *
 * The script:
 *   1. Fetches sitemap URLs
 *   2. Extracts GitHub blob/tree/tag URLs from source files
 *   3. Verifies GitHub URLs locally (without HTTP requests)
 *   4. Pipes sitemap URLs to lychee for HTTP link checking
 *
 * Environment Variables:
 *   LOGGER_LEVEL  Set log verbosity: error, warn, info, debug, trace (default: info)
 */

import { execSync, spawn } from 'node:child_process';
import { existsSync, mkdirSync, readFileSync, readdirSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { Logger } from './utils/logger.js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = dirname(__dirname);
const GITHUB_REPOS_DIR = join(REPO_ROOT, '.link-check', '.github-repos');

const log = new Logger();
const LYCHEE_CONFIG = join(REPO_ROOT, 'lychee.toml');

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

function extractGitHubUrls() {
  log.debug('Extracting GitHub URLs from source files...');

  const patterns = [
    /https:\/\/github\.com\/[^/]+\/[^/]+\/(blob|tree)\/[^"')<>\s]+/g,
    /https:\/\/github\.com\/[^/]+\/[^/]+\/releases\/tag\/[^"')<>\s]+/g,
  ];
  const exclude = [/github\.com\/your-org\//, /github\.com\/owner\/repo/];

  const urls = new Set();
  const fernDir = join(REPO_ROOT, 'fern');

  if (!existsSync(fernDir)) return [];

  const files = getFilesRecursively(fernDir);
  if (existsSync(join(REPO_ROOT, 'README.md'))) {
    files.push(join(REPO_ROOT, 'README.md'));
  }

  for (const file of files) {
    try {
      const content = readFileSync(file, 'utf8');
      for (const pattern of patterns) {
        pattern.lastIndex = 0;
        for (const match of content.matchAll(pattern)) {
          const url = match[0];
          if (!exclude.some((p) => p.test(url))) {
            urls.add(url);
          }
        }
      }
    } catch {
      // Skip unreadable files
    }
  }

  return [...urls];
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

function runLychee(urls, options = {}) {
  log.step('Checking HTTP links with lychee...');
  log.newline();

  return new Promise((resolve) => {
    // Use --files-from to read input URLs from stdin (pages to crawl for links)
    const args = ['--config', LYCHEE_CONFIG, '--files-from', '-'];

    if (options.noProgress) {
      args.push('--no-progress');
    }
    if (options.format) {
      args.push('--format', options.format);
    }

    const lychee = spawn('lychee', args, {
      stdio: ['pipe', 'inherit', 'inherit'],
    });

    // Pipe page URLs to lychee's stdin - lychee will crawl each page for links
    lychee.stdin.write(urls.join('\n'));
    lychee.stdin.end();

    lychee.on('close', (code) => {
      log.debug(`Lychee exited with code ${code}`);

      if (code === LYCHEE_EXIT.SUCCESS) {
        resolve({ exitCode: code, failed: false });
      } else if (code === LYCHEE_EXIT.LINK_FAILURES) {
        resolve({ exitCode: code, failed: true });
      } else if (code === LYCHEE_EXIT.CONFIG_ERROR) {
        log.error('Lychee config error - check lychee.toml');
        resolve({ exitCode: code, failed: true });
      } else {
        log.error(`Lychee runtime error (exit code ${code})`);
        resolve({ exitCode: code, failed: true });
      }
    });
  });
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
  let lycheeFormat = null;

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--sitemap' && args[i + 1]) sitemapUrl = args[++i];
    if (args[i] === '--skip-github') skipGithub = true;
    if (args[i] === '--skip-http') skipHttp = true;
    if (args[i] === '--no-progress') noProgress = true;
    if (args[i] === '--format' && args[i + 1]) lycheeFormat = args[++i];
    if (args[i] === '-h' || args[i] === '--help') {
      console.log(`
Usage: node scripts/check-links.js [options]

Options:
  --sitemap <url>   Check a specific sitemap URL
  --skip-github     Skip GitHub URL verification
  --skip-http       Skip HTTP link checking (lychee)
  --no-progress     Disable lychee progress bar
  --format <fmt>    Set lychee output format (json, markdown, raw, etc.)

Environment Variables:
  LOGGER_LEVEL      Set log verbosity: error, warn, info, debug, trace (default: info)
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
  log.info(`Found ${githubUrls.length} GitHub URLs to verify`);
  if (githubUrls.length > 0) {
    log.debug(`Sample GitHub URLs: ${githubUrls.slice(0, 3).join(', ')}${githubUrls.length > 3 ? '...' : ''}`);
  }

  log.newline();

  // Track failures
  let githubFailed = 0;
  let httpFailed = 0;

  // 3. Verify GitHub URLs locally
  if (skipGithub) {
    log.info('Skipping GitHub verification (--skip-github)');
  } else if (githubUrls.length === 0) {
    log.info('No GitHub URLs found to verify');
  } else {
    const githubResult = verifyGitHubUrls(githubUrls);
    githubFailed = githubResult.failed;
    log.newline();
    log.info(`GitHub: ${githubResult.passed} passed, ${githubResult.failed} failed`);
  }

  // 4. Run lychee on sitemap URLs (piped via stdin)
  if (skipHttp) {
    log.newline();
    log.info('Skipping HTTP link checking (--skip-http)');
  } else {
    const httpResult = await runLychee(sitemapUrls, {
      noProgress,
      format: lycheeFormat,
    });
    httpFailed = httpResult.failed ? 1 : 0;
  }

  // 5. Exit with appropriate code
  const failed = githubFailed > 0 || httpFailed > 0;
  process.exit(failed ? 1 : 0);
}

main().catch((err) => {
  log.error(err.message);
  process.exit(1);
});
