/** Fixture tests for the raw Fern Markdown corpus exporter. */

import test from 'node:test';
import assert from 'node:assert/strict';
import {
  existsSync,
  mkdirSync,
  mkdtempSync,
  readFileSync,
  readdirSync,
  rmSync,
  writeFileSync,
} from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import {
  DocumentExportError,
  UsageError,
  buildManifest,
  exportCorpus,
  fetchDocuments,
  markdownUrlForPage,
  pageUrlToRelPath,
  parseArgs,
  parseSitemap,
  planDocuments,
  safeSegment,
  validateMarkdownResponse,
  withStagingDirectory,
  writeRawDocument,
} from './export-rag-corpus.js';
import { fetchWithRetry, runPool } from './utils/md-export.js';

const BASE = 'https://signalwire.com/docs';

function temporaryDirectory() {
  return mkdtempSync(join(tmpdir(), 'rag-corpus-test-'));
}

test('parseSitemap returns sorted, unique canonical URLs', () => {
  const xml = `<?xml version="1.0"?>
<urlset>
  <url><loc>${BASE}/swml/</loc></url>
  <url><loc>${BASE}</loc></url>
  <url><loc>${BASE}/swml</loc></url>
</urlset>`;

  assert.deepEqual(parseSitemap(xml, BASE), [BASE, `${BASE}/swml`]);
});

test('parseSitemap rejects empty, external, and query-bearing inventories', () => {
  assert.throws(() => parseSitemap('<urlset/>', BASE), /contains no <loc>/);
  assert.throws(
    () => parseSitemap('<urlset><url><loc>https://example.com/docs/x</loc></url></urlset>', BASE),
    /outside --base-url/
  );
  assert.throws(
    () => parseSitemap(`<urlset><url><loc>${BASE}/x?draft=true</loc></url></urlset>`, BASE),
    /query string or fragment/
  );
});

test('parseSitemap rejects a sitemap index instead of treating child sitemaps as pages', () => {
  const index = `<?xml version="1.0"?>
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <sitemap><loc>${BASE}/sitemap-0.xml</loc></sitemap>
</sitemapindex>`;
  assert.throws(() => parseSitemap(index, BASE), /sitemap index/);
});

test('URL paths mirror sitemap paths and encode unsafe filename characters', () => {
  assert.equal(pageUrlToRelPath(BASE, BASE), 'index.md');
  assert.equal(pageUrlToRelPath(`${BASE}/swml`, BASE), 'swml.md');
  assert.equal(pageUrlToRelPath(`${BASE}/browser-sdk/reference`, BASE), 'browser-sdk/reference.md');
  assert.equal(
    pageUrlToRelPath(`${BASE}/browser-sdk/reference/webrtc-call/call-updated$`, BASE),
    'browser-sdk/reference/webrtc-call/call-updated%24.md'
  );
  assert.equal(safeSegment('foo$'), 'foo%24');
  assert.notEqual(safeSegment('foo'), safeSegment('foo$'));
  assert.equal(safeSegment('CON'), '%43ON');
  assert.equal(safeSegment('trailing.'), 'trailing%2E');
  assert.throws(() => safeSegment('%2E%2E'), /Unsafe URL path segment/);
});

test('planDocuments rejects exact and case-insensitive output collisions', () => {
  assert.throws(
    () => planDocuments([`${BASE}/guides/foo$`, `${BASE}/guides/foo%24`], BASE),
    /same local path/
  );
  assert.throws(
    () => planDocuments([`${BASE}/Guides/start`, `${BASE}/guides/start`], BASE),
    /same local path/
  );
});

test('markdownUrlForPage appends .md without changing special path characters', () => {
  assert.equal(markdownUrlForPage(BASE), 'https://signalwire.com/docs.md');
  assert.equal(
    markdownUrlForPage(`${BASE}/browser-sdk/reference/call-updated$`),
    'https://signalwire.com/docs/browser-sdk/reference/call-updated$.md'
  );
});

test('validateMarkdownResponse enforces transport integrity only', () => {
  const valid = {
    status: 200,
    contentType: 'text/markdown; charset=utf-8',
    body: Buffer.from('> directive\n\n# Title\n\n<Anything />\n'),
  };
  assert.equal(validateMarkdownResponse(valid), null);
  assert.match(validateMarkdownResponse({ ...valid, status: 404 }), /HTTP 404/);
  assert.match(validateMarkdownResponse({ ...valid, contentType: 'text/html' }), /text\/markdown/);
  assert.match(validateMarkdownResponse({ ...valid, body: Buffer.alloc(0) }), /empty/);
  assert.match(validateMarkdownResponse({ ...valid, body: Buffer.from('\uFEFF \n') }), /empty/);
  assert.match(
    validateMarkdownResponse({ ...valid, body: Buffer.from('# Page Not Found\n') }),
    /Page Not Found/
  );
});

test('writeRawDocument preserves response bytes exactly', () => {
  const root = temporaryDirectory();
  try {
    const body = Buffer.from([0xef, 0xbb, 0xbf, 0x23, 0x20, 0x78, 0x0a, 0xff]);
    writeRawDocument(root, 'nested/page.md', body);
    assert.deepEqual(readFileSync(join(root, 'nested/page.md')), body);
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
});

test('buildManifest sorts documents without adding page metadata', () => {
  const manifest = buildManifest({
    baseUrl: BASE,
    generatedAt: '2026-09-02T12:00:00.000Z',
    sitemapCount: 3,
    documents: [
      { path: 'z.md', url: `${BASE}/z`, sha256: 'sha256:z', bytes: 2 },
      { path: 'a.md', url: `${BASE}/a`, sha256: 'sha256:a', bytes: 1 },
    ],
  });
  assert.equal(manifest.schema_version, 1);
  assert.deepEqual(manifest.counts, { sitemap: 3, written: 2 });
  assert.deepEqual(manifest.documents.map((document) => document.path), ['a.md', 'z.md']);
});

test('fetchWithRetry retries 5xx and can return a Buffer', async () => {
  let attempts = 0;
  const retries = [];
  const response = await fetchWithRetry('https://example.test/page.md', {
    maxAttempts: 2,
    initialDelayMs: 0,
    responseType: 'buffer',
    sleepImpl: async () => {},
    onRetry(event) { retries.push(event.attempt); },
    async fetchImpl() {
      attempts++;
      if (attempts === 1) return new Response('retry', { status: 503 });
      return new Response(Buffer.from([0x23, 0x20, 0x78]), {
        status: 200,
        headers: { 'Content-Type': 'text/markdown' },
      });
    },
  });

  assert.equal(attempts, 2);
  assert.deepEqual(retries, [1]);
  assert.deepEqual(response.body, Buffer.from([0x23, 0x20, 0x78]));
});

test('runPool respects its concurrency bound', async () => {
  let active = 0;
  let maximum = 0;
  await runPool([1, 2, 3, 4, 5], async () => {
    active++;
    maximum = Math.max(maximum, active);
    await new Promise((resolve) => setImmediate(resolve));
    active--;
  }, 2);
  assert.equal(maximum, 2);
});

test('fetchDocuments writes raw bodies and reports invalid responses', async () => {
  const root = temporaryDirectory();
  const planned = [{ url: `${BASE}/swml`, path: 'swml/index.md' }];
  const raw = Buffer.from('> directive\n\n# SWML\n\n[ref]: /docs/x');

  try {
    const documents = await fetchDocuments(planned, root, 1, {
      maxAttempts: 1,
      async fetchImpl() {
        return new Response(raw, { headers: { 'Content-Type': 'text/markdown' } });
      },
    });
    assert.deepEqual(readFileSync(join(root, 'swml/index.md')), raw);
    assert.equal(documents[0].bytes, raw.length);

    await assert.rejects(
      fetchDocuments(planned, root, 1, {
        maxAttempts: 1,
        async fetchImpl() {
          return new Response('<html/>', { headers: { 'Content-Type': 'text/html' } });
        },
      }),
      DocumentExportError
    );
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
});

function seedSnapshot(output) {
  mkdirSync(output);
  writeFileSync(join(output, 'old.md'), 'old');
  writeFileSync(join(output, 'manifest.json'), JSON.stringify({ schema_version: 1, documents: [] }));
}

test('withStagingDirectory leaves old output untouched when the build fails', async () => {
  const root = temporaryDirectory();
  const output = join(root, 'corpus');
  seedSnapshot(output);

  try {
    await assert.rejects(
      withStagingDirectory(output, async (stageDir) => {
        writeFileSync(join(stageDir, 'new.md'), 'new');
        throw new Error('build failed');
      }),
      /build failed/
    );
    assert.equal(readFileSync(join(output, 'old.md'), 'utf8'), 'old');
    assert.equal(existsSync(join(output, 'new.md')), false);
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
});

test('withStagingDirectory replaces old output only after success', async () => {
  const root = temporaryDirectory();
  const output = join(root, 'corpus');
  seedSnapshot(output);
  const sigintListeners = process.listenerCount('SIGINT');

  try {
    await withStagingDirectory(output, async (stageDir) => {
      assert.equal(process.listenerCount('SIGINT'), sigintListeners + 1);
      writeFileSync(join(stageDir, 'new.md'), 'new');
    });
    assert.equal(process.listenerCount('SIGINT'), sigintListeners);
    assert.equal(existsSync(join(output, 'old.md')), false);
    assert.equal(readFileSync(join(output, 'new.md'), 'utf8'), 'new');
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
});

test('withStagingDirectory accepts missing or empty output directories', async () => {
  const root = temporaryDirectory();
  try {
    await withStagingDirectory(join(root, 'fresh'), async (stageDir) => {
      writeFileSync(join(stageDir, 'new.md'), 'new');
    });
    assert.equal(readFileSync(join(root, 'fresh/new.md'), 'utf8'), 'new');

    mkdirSync(join(root, 'empty'));
    await withStagingDirectory(join(root, 'empty'), async (stageDir) => {
      writeFileSync(join(stageDir, 'new.md'), 'new');
    });
    assert.equal(readFileSync(join(root, 'empty/new.md'), 'utf8'), 'new');
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
});

test('withStagingDirectory refuses to replace a directory that is not a corpus snapshot', async () => {
  const root = temporaryDirectory();
  const output = join(root, 'precious');
  mkdirSync(output);
  writeFileSync(join(output, 'keep.txt'), 'keep');
  const file = join(root, 'file.txt');
  writeFileSync(file, 'file');

  try {
    let built = false;
    await assert.rejects(
      withStagingDirectory(output, async () => { built = true; }),
      UsageError
    );
    assert.equal(built, false, 'refusal must happen before any fetching');
    assert.equal(readFileSync(join(output, 'keep.txt'), 'utf8'), 'keep');
    assert.deepEqual(readdirSync(root).sort(), ['file.txt', 'precious'], 'no staging directory left behind');

    await assert.rejects(withStagingDirectory(file, async () => {}), /not a directory/);
    assert.equal(readFileSync(file, 'utf8'), 'file');
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
});

test('exportCorpus discovers only sitemap URLs and publishes exact Markdown', async () => {
  const root = temporaryDirectory();
  const output = join(root, 'corpus');
  const home = Buffer.from('> index directive\n\n# Home\n');
  const swml = Buffer.from('> index directive\n\n# SWML');
  const sitemap = `<urlset><url><loc>${BASE}</loc></url><url><loc>${BASE}/swml</loc></url></urlset>`;

  try {
    const requested = [];
    const result = await exportCorpus({
      baseUrl: BASE,
      outDir: output,
      concurrency: 2,
      listOnly: false,
    }, {
      maxAttempts: 1,
      async fetchImpl(url) {
        requested.push(String(url));
        if (String(url).endsWith('/sitemap.xml')) {
          return new Response(sitemap, { headers: { 'Content-Type': 'application/xml' } });
        }
        if (String(url) === `${BASE}.md`) {
          return new Response(home, { headers: { 'Content-Type': 'text/markdown' } });
        }
        if (String(url) === `${BASE}/swml.md`) {
          return new Response(swml, { headers: { 'Content-Type': 'text/markdown' } });
        }
        return new Response('missing', { status: 404 });
      },
    });

    assert.deepEqual(requested.sort(), [
      `${BASE}.md`,
      `${BASE}/sitemap.xml`,
      `${BASE}/swml.md`,
    ]);
    assert.deepEqual(readFileSync(join(output, 'index.md')), home);
    assert.deepEqual(readFileSync(join(output, 'swml.md')), swml);
    assert.deepEqual(result.manifest.counts, { sitemap: 2, written: 2 });
    assert.equal(JSON.parse(readFileSync(join(output, 'manifest.json'), 'utf8')).documents.length, 2);
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
});

test('parseArgs keeps the public CLI focused on complete snapshots', () => {
  const options = parseArgs(['--out', 'dist/custom', '--concurrency', '4', '--list']);
  assert.equal(options.concurrency, 4);
  assert.equal(options.listOnly, true);
  assert.ok(options.outDir.endsWith('/dist/custom'));
  assert.throws(() => parseArgs(['--limit', '1']), /Unknown option/);
  assert.throws(() => parseArgs(['--concurrency', '17']), /cannot exceed 16/);
  assert.throws(() => parseArgs(['--out']), /--out requires a directory/);
  assert.throws(() => parseArgs(['--out', '--list']), /--out requires a directory/);
});
