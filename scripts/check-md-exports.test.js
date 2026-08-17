/**
 * Fixture tests for the check heuristics in check-md-exports.js.
 *
 * Run with:  yarn test:scripts
 * (the underlying `node --test` glob lives in package.json — it can't be quoted
 * here because the glob contains the sequence that closes a block comment)
 *
 * These lock in the detection behavior the script exists for. In particular:
 * the "orphaned-descriptions" fixtures encode the exact regression from issue
 * #525 (ParamField terms stripped from .md exports, leaving bare description
 * blocks), and the "clean" fixtures encode legitimate page styles that an
 * earlier version of the heuristic false-positived on. If you tune a check,
 * every fixture here must still pass.
 *
 * No network: these tests exercise the pure functions only (checkPage,
 * stripCode, classifyUrl, parseSourcePage).
 */

import test from 'node:test';
import assert from 'node:assert/strict';
import { checkPage, stripCode, classifyUrl, parseSourcePage } from './check-md-exports.js';

const BASE = 'https://signalwire.com/docs';

/** Run all checks on a body and return the sorted list of check ids found. */
function checkIds(body, { status = 200, severity = null } = {}) {
  return checkPage('https://example.test/page.md', {}, status, body)
    .filter((f) => severity === null || f.severity === severity)
    .map((f) => f.check)
    .sort();
}

// A paragraph long enough to clear the empty-body threshold.
const PROSE =
  'Some prose long enough to pass the empty-body check. Lorem ipsum dolor sit amet, consectetur adipiscing elit.';

// ============================================
// orphaned-descriptions — the #525 regression signature
// ============================================

// How the broken languages.md export looked before Fern's fix: a Properties
// section of separator-delimited descriptions with every defined term stripped.
const PRE_FIX_EXPORT = `# languages

## **Properties**

An array of objects that accept the following properties.

---

Name of the language ("French", "English", etc).

---

Set the language code for ASR purposes.

---
`;

// The same page after Fern's fix: each block opens with a bold-code term.
const POST_FIX_EXPORT = PRE_FIX_EXPORT
  .replace('An array of objects', '**`ai.languages`** `object[]`\n\nAn array of objects')
  .replace('Name of the language', '**`languages[].name`** `string`\n\nName of the language')
  .replace('Set the language code', '**`languages[].code`** `string`\n\nSet the language code');

test('orphaned-descriptions trips on the pre-fix #525 export shape', () => {
  assert.deepEqual(checkIds(PRE_FIX_EXPORT, { severity: 'error' }), ['orphaned-descriptions']);
});

test('post-fix export shape with defined terms is clean', () => {
  assert.deepEqual(checkIds(POST_FIX_EXPORT), []);
});

// Browser SDK v3 reference style: methods separated by ---, params documented
// via #### Parameters + bullets, no bold-code terms anywhere. A legitimate
// older style — an earlier heuristic false-positived on exactly this.
const V3_METHOD_STYLE = `# Conversation Namespace

## **Methods**

### getConversations

Returns a list of conversations.

#### Parameters

- \`pageSize\`: number of items per page.
- \`options\`: query options object.

#### Returns

A promise resolving to conversations.

---

### getMessages

Fetch messages for a conversation.

#### Parameters

- \`conversationId\`: the parent conversation.

---

### subscribe

Subscribe to updates using a callback function you provide here.

---
`;

test('v3 heading+bullet reference style does not false-positive', () => {
  assert.deepEqual(checkIds(V3_METHOD_STYLE, { severity: 'error' }), []);
});

const TABLE_STYLE = `# page

## **Properties**

The object has these fields, listed in the table below for reference.

---

| Field | Description |
| ----- | ----------- |
| id    | Unique id.  |

---
`;

test('table-based params style does not false-positive', () => {
  assert.deepEqual(checkIds(TABLE_STYLE, { severity: 'error' }), []);
});

// ============================================
// unrendered-component / unknown-jsx-tag
// ============================================

const CODE_FENCED_COMPONENTS = `# page

${PROSE}

\`\`\`mdx
<Card title="x" href="/y">text</Card>
<ParamField path="a" type="string">desc</ParamField>
\`\`\`
`;

test('components inside code fences are ignored', () => {
  assert.deepEqual(checkIds(CODE_FENCED_COMPONENTS), []);
});

test('a Fern component leaking outside code is an error (generic JSX warn suppressed)', () => {
  const body = `${CODE_FENCED_COMPONENTS}\n<ParamField path="b" type="string">leaked</ParamField>\n`;
  assert.deepEqual(checkIds(body), ['unrendered-component']);
});

test('an unknown capitalized JSX tag outside code is a warn', () => {
  const body = `${CODE_FENCED_COMPONENTS}\n<MysteryWidget prop="1">x</MysteryWidget>\n`;
  assert.deepEqual(checkIds(body), ['unknown-jsx-tag']);
});

test('backticked custom-element mentions in prose are ignored', () => {
  const body = `# page\n\n${PROSE} Compose the layout from \`<sw-ui-call-layout>\` and \`<Card>\` mentions.\n`;
  assert.deepEqual(checkIds(body), []);
});

// ============================================
// empty-term-block
// ============================================

test('a term rendered with no description is a warn', () => {
  const body = `# page

## **Properties**

**\`params.real\`** \`string\`

A real description that is long enough for the empty-body check to pass fine.

---

**\`params.ghost\`** \`string\`

---
`;
  assert.deepEqual(checkIds(body), ['empty-term-block']);
});

// ============================================
// soft-404 / hard-404 / empty-body
// ============================================

test('a "Page Not Found" stub is a soft-404 error', () => {
  const body = '# Page Not Found\n\nThis page does not exist.\n\n## Similar pages\n';
  assert.deepEqual(checkIds(body, { severity: 'error' }), ['soft-404']);
});

test('HTTP 404 on a listed page is a hard-404 error', () => {
  assert.deepEqual(checkIds('irrelevant', { status: 404 }), ['hard-404']);
});

test('a nearly empty body is an error', () => {
  const body = '> For a complete index of all SignalWire documentation pages, fetch x\n\n# title\n\nshort.\n';
  assert.deepEqual(checkIds(body, { severity: 'error' }), ['empty-body']);
});

// ============================================
// stripCode
// ============================================

test('stripCode removes fenced blocks and inline spans but keeps prose', () => {
  const stripped = stripCode('before `<Card>` middle\n```html\n<ParamField />\n```\nafter');
  assert.ok(!stripped.includes('<Card>'));
  assert.ok(!stripped.includes('<ParamField'));
  assert.ok(stripped.includes('before'));
  assert.ok(stripped.includes('after'));
});

// ============================================
// classifyUrl
// ============================================

test('classifyUrl derives product and version from export URLs', () => {
  assert.deepEqual(classifyUrl(`${BASE}/swml/reference/errors.md`, BASE), { product: 'swml', version: null });
  assert.deepEqual(classifyUrl(`${BASE}/browser-sdk/v3/js/reference/call.md`, BASE), { product: 'browser-sdk', version: 'v3' });
  assert.deepEqual(classifyUrl(`${BASE}/some-root-page.md`, BASE), { product: 'home', version: null });
});

// ============================================
// parseSourcePage (cross-check URL mapping)
// ============================================

test('parseSourcePage computes the export URL from product dir + frontmatter slug', () => {
  const content = `---
title: "languages"
slug: /reference/calling/ai/languages
---

<ParamField path="ai.languages" type="object[]" toc={true}>
  An array of objects.
</ParamField>

<ParamField path='languages[].name' type="string" required={true}>
  Single-quoted path attribute.
</ParamField>
`;
  const parsed = parseSourcePage(
    'fern/products/swml/pages/reference/methods/calling/ai/languages/index.mdx', content, BASE
  );
  assert.equal(parsed.url, `${BASE}/swml/reference/calling/ai/languages.md`);
  assert.deepEqual(parsed.paths, ['ai.languages', 'languages[].name']);
});

test('parseSourcePage handles versioned products and the home product', () => {
  const content = '---\nslug: /guides/thing\n---\n<ParamField path="a" type="string">x</ParamField>\n';
  assert.equal(
    parseSourcePage('fern/products/browser-sdk/pages/v4/guides/thing.mdx', content, BASE).url,
    `${BASE}/browser-sdk/v4/guides/thing.md`
  );
  assert.equal(
    parseSourcePage('fern/products/home/pages/thing.mdx', content, BASE).url,
    `${BASE}/guides/thing.md`
  );
});

test('parseSourcePage maps a "/" slug to the product landing page export', () => {
  const content = '---\nslug: /\n---\n<ParamField path="a" type="string">x</ParamField>\n';
  assert.equal(
    parseSourcePage('fern/products/swml/pages/index.mdx', content, BASE).url,
    `${BASE}/swml.md`
  );
});

test('parseSourcePage returns a null URL when the slug is missing, and null with no ParamFields', () => {
  const noSlug = parseSourcePage('fern/products/swml/pages/x.mdx', '<ParamField path="a">x</ParamField>', BASE);
  assert.equal(noSlug.url, null);
  assert.deepEqual(noSlug.paths, ['a']);
  assert.equal(parseSourcePage('fern/products/swml/pages/x.mdx', 'no components here', BASE), null);
});
