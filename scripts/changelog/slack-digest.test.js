/**
 * Fixture tests for the Slack digest renderer.
 *
 * Run with:  yarn test:scripts
 *
 * The lead-sentence split is the fragile part: it must not break on a product
 * name containing a period ("Smallest.ai") or on a version like "v2." at a
 * sentence end, because the result is posted verbatim to a channel.
 */

import { test } from 'node:test';
import assert from 'node:assert/strict';
import {
  splitSections,
  stripFrontmatter,
  toMrkdwn,
  truncate,
  windowLabel,
  MAX_SECTION_CHARS,
} from './slack-digest.js';

test('stripFrontmatter removes a leading block and leaves the body', () => {
  assert.equal(stripFrontmatter('---\ntags: ["a"]\n---\n\n## Head\n').trim(), '## Head');
  assert.equal(stripFrontmatter('## Head\n').trim(), '## Head', 'no frontmatter is fine');
});

test('splitSections yields one section per heading', () => {
  const sections = splitSections('## One\n\nBody one.\n\n## Two\n\nBody two.\n', 2);
  assert.deepEqual(sections.map((s) => s.heading), ['One', 'Two']);
  assert.equal(sections[0].body, 'Body one.');
});

test('splitSections ignores deeper headings inside a section body', () => {
  const sections = splitSections('## One\n\n### Sub\n\nText.\n', 2);
  assert.equal(sections.length, 1);
  assert.match(sections[0].body, /### Sub/);
});

test('toMrkdwn rewrites a /docs link onto the production host', () => {
  const out = toMrkdwn('See [Subscribers](/docs/platform/subscribers).', 'https://signalwire.com/docs');
  assert.equal(out, 'See <https://signalwire.com/docs/platform/subscribers|Subscribers>.');
});

test('toMrkdwn passes an absolute link through', () => {
  assert.equal(
    toMrkdwn('See [the issue](https://github.com/x/y/pull/1).', 'https://signalwire.com/docs'),
    'See <https://github.com/x/y/pull/1|the issue>.',
  );
});

test('truncate leaves short text alone and marks long text', () => {
  assert.equal(truncate('short'), 'short');
  const long = truncate('x'.repeat(MAX_SECTION_CHARS + 500));
  assert.ok(long.length <= MAX_SECTION_CHARS, 'must fit Slack\'s per-block limit');
  assert.match(long, /_…truncated_$/);
});

test('windowLabel renders a range, and collapses a single day', () => {
  assert.equal(windowLabel({ since: '2026-08-04', until: '2026-08-11' }, 'x'), '2026-08-04 to 2026-08-11');
  assert.equal(windowLabel({ since: '2026-08-11', until: '2026-08-11' }, 'x'), '2026-08-11');
  assert.equal(windowLabel(null, 'fallback'), 'fallback');
});

// The lead-sentence split lives in buildDevexFromFiles; this locks in the regex
// contract it depends on, which is the part that would silently mangle a post.
const lead = (s) => s.split(/(?<=[.!?])\s+/)[0];

test('lead sentence keeps a product name containing a period intact', () => {
  const body = 'Groq, Mistral, Smallest.ai, and Fish Audio are documented. A second sentence follows.';
  assert.equal(lead(body), 'Groq, Mistral, Smallest.ai, and Fish Audio are documented.');
});

test('lead sentence splits on a real sentence boundary', () => {
  const body = 'The v3 guides are removed and v3 is reference-only, matching v2. The reference is unchanged.';
  assert.equal(lead(body), 'The v3 guides are removed and v3 is reference-only, matching v2.');
});

test('lead sentence returns the whole body when there is one sentence', () => {
  assert.equal(lead('Only one sentence here.'), 'Only one sentence here.');
});
