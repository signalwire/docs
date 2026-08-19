import assert from 'node:assert/strict';
import test from 'node:test';

import { checkBody, normalizeDocsBase } from './check-llm-exports.mjs';

test('normalizes Fern preview URLs to the docs base', () => {
  assert.equal(normalizeDocsBase('https://example.docs.buildwithfern.com'), 'https://example.docs.buildwithfern.com/docs');
  assert.equal(normalizeDocsBase('https://example.docs.buildwithfern.com/docs/'), 'https://example.docs.buildwithfern.com/docs');
});

test('reports missing and forbidden export content', () => {
  const failures = checkBody({
    contains: ['orientation', 'functional link'],
    notContains: ['class="fern-page-heading"'],
  }, 'orientation\nclass="fern-page-heading"');

  assert.deepEqual(failures, [
    'missing required text: "functional link"',
    'contains forbidden text: "class=\\"fern-page-heading\\""',
  ]);
});
