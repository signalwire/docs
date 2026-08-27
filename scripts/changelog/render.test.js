/**
 * Fixture tests for the changelog renderer.
 *
 * Run with:  yarn test:scripts
 *
 * Two behaviors here are load-bearing and were only ever verified by hand:
 *   - validate() is the guard on a JSON file pasted in by a human, so it has to
 *     reject a hallucinated PR number and a non-/docs URL rather than let either
 *     reach a customer-facing page.
 *   - buildDatedFile() merges into an existing dated entry file instead of
 *     overwriting it, which is what keeps a reviewer's hand-edits alive when a
 *     late entry lands on an already-published date.
 */

import { test } from 'node:test';
import assert from 'node:assert/strict';
import {
  validate,
  buildDatedFile,
  parseExistingFile,
  sectionHeading,
  collectTags,
  resolveLinks,
} from './render.js';

const KNOWN = new Set([501, 502]);

const notable = (over = {}) => ({
  pr: 501,
  tier: 'notable',
  product: 'platform',
  entry_title: 'A title',
  entry_body: 'A body.',
  support_detail: 'Detail.',
  pages: [],
  confidence: 0.9,
  reasoning: 'Because.',
  ...over,
});

test('validate accepts a well-formed payload', () => {
  const entries = validate({ entries: [notable()] }, KNOWN);
  assert.equal(entries.length, 1);
});

test('validate requires skip entries to carry nothing else', () => {
  // skip entries exist purely so the tier call stays auditable.
  const entries = validate({ entries: [{ pr: 502, tier: 'skip' }] }, KNOWN);
  assert.equal(entries[0].tier, 'skip');
});

test('validate rejects an unknown tier', () => {
  assert.throws(() => validate({ entries: [notable({ tier: 'huge' })] }, KNOWN), /tier.*must be one of/);
});

test('validate rejects a PR absent from input.json', () => {
  assert.throws(
    () => validate({ entries: [notable({ pr: 999 })] }, KNOWN),
    /not in input\.json/,
    'a hallucinated PR number must not reach a published entry',
  );
});

test('validate rejects duplicate PRs', () => {
  assert.throws(
    () => validate({ entries: [notable(), notable()] }, KNOWN),
    /duplicate entry for PR/,
  );
});

test('validate rejects an off-site or relative URL', () => {
  assert.throws(
    () => validate({ entries: [notable({ pages: [{ path: 'a.mdx', url: 'https://evil.example/x' }] })] }, KNOWN),
    /must start with \/docs\//,
  );
});

test('validate requires support_detail on a minor entry', () => {
  // Support is the only audience for `minor`, so an empty detail reports nothing.
  assert.throws(
    () => validate({ entries: [notable({ tier: 'minor', support_detail: null })] }, KNOWN),
    /"support_detail" is required for tier "minor"/,
  );
});

test('validate reports every problem in one pass', () => {
  try {
    validate({ entries: [{ pr: 'x', tier: 'nope' }, notable({ pr: 999 })] }, KNOWN);
    assert.fail('should have thrown');
  } catch (err) {
    // A hand-pasted file is fixed in one pass or not at all.
    assert.match(err.message, /failed validation \(\d+ problems\)/);
    assert.ok(err.message.split('\n').length > 2);
  }
});

test('validate rejects a payload with no entries', () => {
  assert.throws(() => validate({ entries: [] }, KNOWN), /empty "entries"/);
  assert.throws(() => validate({}, KNOWN), /no "entries" array/);
});

test('parseExistingFile splits frontmatter tags from sections', () => {
  const file = '---\ntags: ["swml","platform"]\n---\n\n## One\n\nBody one.\n\n## Two\n\nBody two.\n';
  const { tags, sections } = parseExistingFile(file);
  assert.deepEqual(tags, ['swml', 'platform']);
  assert.equal(sections.length, 2);
  assert.deepEqual(sections.map(sectionHeading), ['One', 'Two']);
});

test('buildDatedFile writes a fresh file when none exists', () => {
  const out = buildDatedFile(null, [notable({ entry_title: 'New thing' })], new Map());
  assert.match(out, /^---\ntags: \["platform"\]\n---\n\n## New thing\n/);
});

test('buildDatedFile merges without duplicating an existing entry', () => {
  const existing = '---\ntags: ["platform"]\n---\n\n## Already here\n\nOld body.\n';
  const out = buildDatedFile(existing, [notable({ entry_title: 'Already here' })], new Map());
  assert.equal((out.match(/^## Already here$/gm) || []).length, 1, 'same heading must not be added twice');
  assert.match(out, /Old body\./, 'the existing text wins, not the regenerated one');
});

test('buildDatedFile preserves a reviewer hand-edit and appends the new entry', () => {
  const existing = '---\ntags: ["swml"]\n---\n\n## Hand-written by a reviewer\n\nKeep me.\n';
  const out = buildDatedFile(existing, [notable({ entry_title: 'Generated' })], new Map());
  assert.match(out, /## Hand-written by a reviewer/);
  assert.match(out, /Keep me\./);
  assert.match(out, /## Generated/);
  assert.deepEqual(parseExistingFile(out).tags, ['platform', 'swml'], 'tags union, sorted');
});

test('collectTags drops the "other" bucket', () => {
  assert.deepEqual(collectTags([notable({ product: 'other' }), notable({ product: 'swml' })]), ['swml']);
});

test('resolveLinks takes URLs and labels from the repo, never the model', () => {
  const meta = new Map([['a.mdx', { url: '/docs/platform/subscribers', title: 'Subscribers' }]]);
  const entry = notable({ pages: [{ path: 'a.mdx', url: '/docs/WRONG', status: 'modified' }] });
  const links = resolveLinks(entry, meta);
  assert.deepEqual(links, [{ url: '/docs/platform/subscribers', label: 'Subscribers', status: 'modified' }]);
});

test('resolveLinks omits a page with no resolvable URL and dedupes', () => {
  const meta = new Map([['a.mdx', { url: '/docs/x', title: 'X' }], ['b.mdx', { url: '/docs/x', title: 'X' }]]);
  const entry = notable({ pages: [{ path: 'a.mdx' }, { path: 'b.mdx' }, { path: 'gone.mdx' }] });
  assert.equal(resolveLinks(entry, meta).length, 1);
});

test('resolveLinks falls back to the URL when no title is known', () => {
  const meta = new Map([['a.mdx', { url: '/docs/x', title: null }]]);
  // Link text must still name its destination — never "this page".
  assert.equal(resolveLinks(notable({ pages: [{ path: 'a.mdx' }] }), meta)[0].label, '/docs/x');
});
