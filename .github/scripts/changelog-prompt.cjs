/**
 * Prompt builder for docs changelog classification.
 *
 * ONE builder, TWO consumers — this is what makes the phase-1 → phase-2 switch
 * a one-step change:
 *   - scripts/changelog/collect.js  writes the output to work/<date>/prompt.md,
 *                                  which a human pastes into Claude Code.
 *   - .github/workflows/changelog-draft.yml  will pass the same string to the
 *                                  Gemini API once GEMINI_API_KEY exists.
 *
 * CommonJS (`.cjs`) on purpose: the repo is `"type": "module"`, so a `.js` file
 * here would be ESM and `require()` from `actions/github-script` would fail.
 * ESM callers import it with `import buildPrompt from '...cjs'` (default interop).
 */

const { rubric, MAX_LISTED_FILES } = require('./changelog-criteria.cjs');

/** The JSON contract. Identical for the human and API paths. */
const OUTPUT_SCHEMA = `{
  "entries": [
    {
      "pr": 123,
      "tier": "notable" | "minor" | "skip",
      "product": "calling" | "swml" | "platform" | "server-sdks" | "browser-sdks" | "apis" | "compatibility-api" | "call-flow-builder" | "other",
      "entry_title": "Sentence-case title naming the change, not the week. Null when tier is skip.",
      "entry_body": "1-3 sentences, second person, present tense. Customer-facing prose. Null when tier is skip.",
      "support_detail": "What specifically changed and what it means for a Support conversation. More detail than entry_body, internal audience. Null when tier is skip.",
      "pages": [{ "path": "fern/...", "url": "/docs/... or null", "status": "added" | "modified" | "removed" | "renamed" }],
      "confidence": 0.0,
      "reasoning": "Why this tier."
    }
  ]
}`;

function formatFile(f) {
  const where = f.url ? ` → ${f.url}${f.title ? ` ("${f.title}")` : ''}` : '';
  const patch = f.patch ? `\n\`\`\`diff\n${f.patch}\n\`\`\`` : '';
  return `- **${f.status}** \`${f.path}\`${where} (+${f.additions}/-${f.deletions})${patch}`;
}

/**
 * Group unlisted files by their directory, so a sweep reads as "42 files under
 * fern/products/swml/pages/reference" rather than 42 near-identical lines.
 */
function tally(files) {
  const counts = new Map();
  for (const f of files) {
    const dir = f.path.split('/').slice(0, -1).join('/');
    counts.set(dir, (counts.get(dir) ?? 0) + 1);
  }
  return [...counts.entries()]
    .sort((a, b) => b[1] - a[1])
    .map(([dir, n]) => `- ${n} ${n === 1 ? 'file' : 'files'} under \`${dir}/\``)
    .join('\n');
}

/**
 * Render one PR as prompt input.
 *
 * Diffs are already sampled within a per-PR budget by collect.js — files with the
 * largest diffs get the budget, because a mechanical sweep's per-file diffs are
 * uniformly tiny and one sample represents them all.
 */
function formatPr(pr) {
  // Show the files carrying sampled diffs first; they are the informative ones.
  const withPatch = pr.files.filter((f) => f.patch);
  const withoutPatch = pr.files.filter((f) => !f.patch);

  const listed = [...withPatch, ...withoutPatch].slice(0, MAX_LISTED_FILES);
  const remainder = [...withPatch, ...withoutPatch].slice(MAX_LISTED_FILES);

  let fileSection = listed.map(formatFile).join('\n');
  if (remainder.length > 0) {
    fileSection += `\n\nAnd ${remainder.length} more changed ${
      remainder.length === 1 ? 'file' : 'files'
    }, not shown individually:\n${tally(remainder)}`;
  }

  const body = pr.body ? pr.body.trim().slice(0, 1500) : '_(no description)_';

  const flagLine = pr.mechanical
    ? '\n**Signal:** Every sampled diff in this PR changes only whitespace, line endings, or letter case. Almost certainly `skip`.\n'
    : '';

  return `### PR #${pr.number} — ${pr.title}

Author: ${pr.author} · Merged: ${pr.mergedAt} · ${pr.fileCount ?? pr.files.length} docs files changed
${flagLine}
${body}

Changed files:
${fileSection}`;
}

/**
 * @param {object[]} prs   Collected PRs (see collect.js for the shape).
 * @param {object} window  { since, until } ISO dates, for context in the prompt.
 * @returns {string} The complete prompt.
 */
function buildPrompt(prs, window) {
  return `${rubric}

## Input

These pull requests merged into \`main\` in the SignalWire documentation repo
between ${window.since} and ${window.until}.

Every URL you may cite is given to you below, read from the page's own
\`slug:\` frontmatter. **Never construct, guess, or infer a documentation URL.**
If a changed file has no URL listed, set that page's \`url\` to \`null\` and do not
put a link in \`entry_body\`. Reference-page URLs in particular are generated from
spec operation IDs and cannot be derived by hand.

Writing constraints for \`entry_title\` and \`entry_body\` — these are published to
customers on a public page:
- Sentence-case titles, no end punctuation. Name the change, never the week.
- Second person, present tense, active voice. No editorial "we".
- No marketing adjectives (powerful, seamless, robust), no emoji, no "simply".
- Do not describe the pull request or the repository. Describe what the reader
  can now do or now knows.

${prs.map(formatPr).join('\n\n---\n\n')}

## Output

Return one entry per pull request above, including \`skip\` entries — the tier
call is auditable, so nothing is silently dropped. Return only a JSON object
matching this shape, with no markdown fences around it:

${OUTPUT_SCHEMA}`;
}

module.exports = buildPrompt;
module.exports.OUTPUT_SCHEMA = OUTPUT_SCHEMA;
