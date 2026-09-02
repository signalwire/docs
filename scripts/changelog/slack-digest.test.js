/**
 * Fixture tests for the Slack digest renderer.
 *
 * Run with:  yarn test:scripts
 *
 * These cover the text transforms that reach a channel verbatim: frontmatter
 * stripping, section splitting, markdown-to-mrkdwn conversion, and the truncation
 * guard for Slack's per-block character limit.
 */

import { test } from 'node:test';
import assert from 'node:assert/strict';
import {
  splitSections,
  stripFrontmatter,
  toMrkdwn,
  truncate,
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
