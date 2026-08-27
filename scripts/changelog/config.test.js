/**
 * Fixture tests for the changelog pipeline's path filters and change detection.
 *
 * Run with:  yarn test:scripts
 *
 * isMechanicalPatch has already regressed once: it was being run on a TRUNCATED
 * patch, which severs the +/- line pairing the comparison depends on and made it
 * silently report nothing. The truncation case below locks that in.
 */

import { test } from 'node:test';
import assert from 'node:assert/strict';
import {
  CHANGELOG_DIR_REL,
  DRAFT_BRANCH_PREFIX,
  draftBranch,
  entryHeadings,
  isDocsRelevant,
  isChangelogEntryFile,
  isMechanicalPatch,
  batchDir,
  resolveRepo,
} from './config.js';

test('isDocsRelevant admits doc sources and spec sources', () => {
  assert.ok(isDocsRelevant('fern/products/platform/pages/guides/e911.mdx'));
  assert.ok(isDocsRelevant('fern/snippets/common/_advisory.mdx'));
  assert.ok(isDocsRelevant('specs/signalwire-rest/calling-api/calls/models/webhooks.tsp'));
  assert.ok(isDocsRelevant('fern/products/swml/swml.yml'), 'nav yml can move a page URL');
  assert.ok(isDocsRelevant('fern/docs.yml'));
});

test('isDocsRelevant excludes generated output even under an included prefix', () => {
  // The .tsp source is the signal; its emitted output would double-count it.
  assert.equal(isDocsRelevant('specs/swml/tsp-output/@typespec/openapi3/openapi.yaml'), false);
  assert.equal(isDocsRelevant('fern/apis/signalwire-rest/openapi.yaml'), false);
});

test('isDocsRelevant excludes tooling, drafts, and assets', () => {
  assert.equal(isDocsRelevant('scripts/changelog/collect.js'), false);
  assert.equal(isDocsRelevant('.github/workflows/check-links.yml'), false);
  assert.equal(isDocsRelevant('fern/products/x/pages/y.mdx.draft'), false);
  assert.equal(isDocsRelevant('fern/assets/images/diagram.png'), false);
  assert.equal(isDocsRelevant('fern/products/home/pages/styles.css'), false);
});

test('isChangelogEntryFile matches dated entries but not the overview', () => {
  assert.ok(isChangelogEntryFile(`${CHANGELOG_DIR_REL}/2026-08-10.mdx`));
  assert.ok(isChangelogEntryFile(`${CHANGELOG_DIR_REL}/2026-08-10.md`));
  // overview.mdx is hand-maintained; editing it is not self-documenting a change.
  assert.equal(isChangelogEntryFile(`${CHANGELOG_DIR_REL}/overview.mdx`), false);
  assert.equal(isChangelogEntryFile('fern/products/home/pages/welcome.mdx'), false);
});

test('isMechanicalPatch detects a case-only change', () => {
  const patch = [
    '@@ -1,3 +1,3 @@',
    ' context line',
    '-title: RELAY SDK for JavaScript',
    '+title: Relay SDK for JavaScript',
  ].join('\n');
  assert.equal(isMechanicalPatch(patch), true);
});

test('isMechanicalPatch detects a line-ending-only change', () => {
  const patch = ['@@ -1,2 +1,2 @@', '-slug: /guides/data-map\r', '+slug: /guides/data-map'].join('\n');
  assert.equal(isMechanicalPatch(patch), true);
});

test('isMechanicalPatch rejects a real content change', () => {
  const patch = [
    '@@ -1,2 +1,2 @@',
    '-The default timeout is 30 seconds.',
    '+The default timeout is 60 seconds.',
  ].join('\n');
  assert.equal(isMechanicalPatch(patch), false);
});

test('isMechanicalPatch rejects an asymmetric patch', () => {
  // A truncated patch loses its + lines. Reporting "mechanical" here is the
  // regression: it made a sweep detector that never fired.
  const truncated = ['@@ -1,25 +1,25 @@', '-id: 706e7b1b\r', '-slug: /guides/data-map\r'].join('\n');
  assert.equal(isMechanicalPatch(truncated), false, 'additions-only or removals-only is not mechanical');
});

test('isMechanicalPatch rejects empty input', () => {
  assert.equal(isMechanicalPatch(''), false);
  assert.equal(isMechanicalPatch(null), false);
  assert.equal(isMechanicalPatch('@@ -1,1 +1,1 @@\n unchanged only'), false);
});

test('batchDir keeps one folder per batch', () => {
  assert.ok(batchDir('2026-08-11').endsWith('/.github/changelog-state/batches/2026-08-11'));
});

test('draftBranch matches the shape the PR search relies on', () => {
  assert.equal(draftBranch('2026-08-27'), 'action-20260827-changelog');
  assert.ok(draftBranch('2026-08-27').startsWith(DRAFT_BRANCH_PREFIX));
});

test('resolveRepo prefers the environment over the origin remote', () => {
  const saved = { GH_REPO: process.env.GH_REPO, GITHUB_REPOSITORY: process.env.GITHUB_REPOSITORY };
  try {
    process.env.GH_REPO = 'someone/fork';
    assert.equal(resolveRepo(), 'someone/fork');
    delete process.env.GH_REPO;
    process.env.GITHUB_REPOSITORY = 'ci/checkout';
    assert.equal(resolveRepo(), 'ci/checkout');
  } finally {
    for (const [k, v] of Object.entries(saved)) {
      if (v === undefined) delete process.env[k];
      else process.env[k] = v;
    }
  }
});

test('entryHeadings extracts ## headings and nothing else', () => {
  const file = [
    '---',
    'tags: ["apis"]',
    '---',
    '',
    '## First entry',
    '',
    'Body with an ## inline marker that is not a heading.',
    '',
    '### A subsection is not an entry',
    '',
    '##  Second entry, extra space  ',
  ].join('\n');
  assert.deepEqual(entryHeadings(file), ['First entry', 'Second entry, extra space']);
  assert.deepEqual(entryHeadings(''), []);
  assert.deepEqual(entryHeadings(null), []);
});
