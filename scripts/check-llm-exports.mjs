#!/usr/bin/env node

import { readFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const SCRIPT_DIR = dirname(fileURLToPath(import.meta.url));
const DEFAULT_MANIFEST = join(SCRIPT_DIR, 'llm-export-cases.json');
const MAX_ATTEMPTS = 5;

function normalizeDocsBase(rawBaseUrl) {
  const url = new URL(rawBaseUrl);
  url.hash = '';
  url.search = '';
  url.pathname = url.pathname.replace(/\/+$/, '');
  if (!url.pathname.endsWith('/docs')) url.pathname = `${url.pathname || ''}/docs`.replace(/\/{2,}/g, '/');
  return url.toString().replace(/\/$/, '');
}

function checkBody(testCase, body) {
  const failures = [];

  if (/(?:^|\n)# Page Not Found(?:\n|$)/.test(body)) {
    failures.push('received a Page Not Found stub');
  }

  if (body.includes('X-Amz-Signature')) {
    failures.push('contains a presigned image URL');
  }

  for (const required of testCase.contains ?? []) {
    if (!body.includes(required)) failures.push(`missing required text: ${JSON.stringify(required)}`);
  }

  for (const forbidden of testCase.notContains ?? []) {
    if (body.includes(forbidden)) failures.push(`contains forbidden text: ${JSON.stringify(forbidden)}`);
  }

  return failures;
}

async function fetchWithRetry(url) {
  let lastError;

  for (let attempt = 1; attempt <= MAX_ATTEMPTS; attempt++) {
    try {
      const response = await fetch(url, {
        headers: { 'User-Agent': 'signalwire-docs-llm-export-check' },
        signal: AbortSignal.timeout(30_000),
      });

      if (response.ok) return response.text();
      lastError = new Error(`HTTP ${response.status}`);
      if (response.status < 500 && response.status !== 429) break;
    } catch (error) {
      lastError = error;
    }

    if (attempt < MAX_ATTEMPTS) {
      await new Promise((resolve) => setTimeout(resolve, 2 ** attempt * 1_000));
    }
  }

  throw lastError;
}

async function main() {
  const [rawBaseUrl, manifestPath = DEFAULT_MANIFEST] = process.argv.slice(2);
  if (!rawBaseUrl) {
    console.error('Usage: node scripts/check-llm-exports.mjs <preview-base-url> [manifest]');
    process.exit(2);
  }

  const baseUrl = normalizeDocsBase(rawBaseUrl);
  const manifest = JSON.parse(await readFile(manifestPath, 'utf8'));
  const testCases = manifest.flatMap((testCase) => {
    const paths = testCase.paths ?? [testCase.path];
    return paths.map((path) => ({ ...testCase, path, paths: undefined }));
  });
  const failures = [];

  await Promise.all(testCases.map(async (testCase) => {
    const url = `${baseUrl}${testCase.path}`;
    try {
      const body = await fetchWithRetry(url);
      for (const failure of checkBody(testCase, body)) {
        failures.push(`${testCase.name} (${url}): ${failure}`);
      }
    } catch (error) {
      failures.push(`${testCase.name} (${url}): ${error.message}`);
    }
  }));

  if (failures.length > 0) {
    console.error(`LLM export checks failed (${failures.length}):`);
    for (const failure of failures) console.error(`- ${failure}`);
    process.exit(1);
  }

  console.log(`LLM export checks passed for ${testCases.length} routes.`);
}

export { checkBody, normalizeDocsBase };

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  main().catch((error) => {
    console.error(error.stack ?? error.message);
    process.exit(2);
  });
}
