/**
 * Fixture tests for the changelog collector's pure helpers.
 *
 * Run with:  yarn test:scripts
 *
 * buildPageUrl is the piece worth locking in: a wrong URL here puts a broken
 * link on a customer-facing changelog entry. The home product has an empty slug
 * and must not contribute a path segment.
 */

import { test } from 'node:test';
import assert from 'node:assert/strict';
import { buildPageUrl, frontmatter, resolveWindow } from './collect.js';

test('buildPageUrl composes a product slug and a page slug', () => {
  // Verified against a real page: platform/.../subscribers.mdx has slug /subscribers
  // and the repo links to it as /docs/platform/subscribers.
  assert.equal(buildPageUrl('platform', '/subscribers'), '/docs/platform/subscribers');
  assert.equal(buildPageUrl('swml', '/reference/messaging/switch'), '/docs/swml/reference/messaging/switch');
});

test('buildPageUrl treats the home product as having no segment', () => {
  assert.equal(buildPageUrl('', '/'), '/docs/');
  assert.equal(buildPageUrl('', '/changelog'), '/docs/changelog');
});

test('buildPageUrl tolerates a slug without a leading slash', () => {
  assert.equal(buildPageUrl('platform', 'getting-started'), '/docs/platform/getting-started');
});

test('buildPageUrl collapses duplicate slashes', () => {
  assert.equal(buildPageUrl('apis', '//rest//calls'), '/docs/apis/rest/calls');
});

test('frontmatter parses a leading YAML block', () => {
  const fm = frontmatter('---\ntitle: Subscribers\nslug: /subscribers\n---\n\nBody\n');
  assert.equal(fm.title, 'Subscribers');
  assert.equal(fm.slug, '/subscribers');
});

test('frontmatter returns null for missing, unterminated, or invalid blocks', () => {
  assert.equal(frontmatter('No frontmatter here\n'), null);
  assert.equal(frontmatter('---\ntitle: x\n'), null, 'unterminated block');
  assert.equal(frontmatter(null), null);
  assert.equal(frontmatter('---\n\tbad: [unclosed\n---\n'), null, 'invalid YAML must not throw');
});

test('resolveWindow honors explicit bounds', () => {
  const w = resolveWindow('2026-08-04', '2026-08-11', { reported: {} });
  assert.deepEqual(w, { since: '2026-08-04', until: '2026-08-11' });
});

test('resolveWindow starts from the newest batch end in the ledger', () => {
  // Overlapping the previous day is deliberate — the ledger, not the window,
  // guarantees a PR is reported once, and this re-nets same-day stragglers.
  const ledger = {
    reported: {
      1: { batch: '2026-08-04', window: { since: '2026-07-28', until: '2026-08-04' } },
      2: { batch: '2026-08-11', window: { since: '2026-08-04', until: '2026-08-11' } },
    },
  };
  assert.equal(resolveWindow(null, '2026-08-18', ledger).since, '2026-08-11');
});

test('resolveWindow falls back to seven days with an empty ledger', () => {
  assert.deepEqual(resolveWindow(null, '2026-08-11', { reported: {} }), {
    since: '2026-08-04',
    until: '2026-08-11',
  });
});
