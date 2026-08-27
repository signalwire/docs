/**
 * Tiering rubric for the docs changelog.
 *
 * This is the file to edit when the weekly digest is too noisy or too quiet.
 * It is deliberately CommonJS (`.cjs`) because the repo is `"type": "module"`
 * and `actions/github-script` consumes these modules with `require()`.
 *
 * Consumed by:
 *   - .github/scripts/changelog-prompt.cjs  (embeds the rubric in the prompt)
 *   - scripts/changelog/render.js                  (validates tiers, routes entries)
 */

/** Tier names, in descending order of reach. */
const TIERS = ['notable', 'minor', 'skip'];

/**
 * Max files listed individually per PR before the prompt falls back to a
 * per-directory tally.
 *
 * Lives here, not in config.js, because the prompt builder is the only consumer
 * and it is CommonJS — this file is the one both worlds already read. config.js
 * re-exports it so ESM callers still have a single import surface.
 */
const MAX_LISTED_FILES = 20;

/**
 * Which audiences each tier reaches. Render and publish both key off this.
 *
 * There are exactly two: `changelog` is external and public, `slack` is internal.
 * Every internal channel gets the same digest, so adding one is a webhook in
 * changelog-publish.yml, not a new tier or a new artifact.
 */
const TIER_ROUTING = {
  notable: ['changelog', 'slack'],
  minor: ['slack'],
  skip: [],
};

/**
 * The rubric, as prompt text.
 *
 * Structured after cloud-product's `.github/scripts/docs-criteria.js`:
 * role, then instructions, then worked examples, then an explicit default.
 * The bias is toward silence — a wrong `skip` costs one missing line in a
 * digest, a wrong `notable` costs a false customer-facing changelog entry.
 */
const rubric = `## Role

You are tiering merged documentation pull requests for SignalWire's developer
documentation. Each PR gets exactly one tier, which decides who hears about it.

## Tiers

**notable** — published to the public customer-facing changelog AND the internal
Slack digest. The test is always what a reader can now do or now knows. It is
never whether the documentation improved:
- A capability a reader had no way to discover before. Age is irrelevant: a guide
  for behavior that has worked the same way for years is notable if readers
  genuinely could not find it, and is not notable if they could.
- A new endpoint, method, field, or parameter appearing in the API or SWML reference.
- A documented behavior change, new limit, or changed default.
- A deprecated or removed **capability**. Retiring, consolidating, or reorganizing
  documentation pages is not a deprecation — that is a URL change, so \`minor\`.

**minor** — internal Slack digest only. Colleagues answering questions need these;
customers do not get a card for them:
- A corrected factual error (wrong type, wrong default, wrong enum value, wrong
  description). Colleagues must know the docs previously said something wrong.
- A page that moved, was renamed, or got a new slug — any URL change, because
  someone may have shared the old link. This includes retiring or consolidating
  pages for an existing product.
- A substantive change to an example or code sample: it previously did not run,
  used the wrong parameter, or now demonstrates a different approach.
- A clarification that changes what a reader would conclude.
- **Filling a documentation gap**: formalizing something a reader could already
  learn. Moving a contract from prose into the rendered reference, adding schemas
  to a page that already described them in words, completing a partially
  documented payload. The information was reachable; it is now tidier.
- **A change of posture or emphasis**: new warnings, callouts, or guidance steering
  readers away from a footgun, where the platform behaves as it always did and the
  behavior was already documented. The volume of new prose does not make this
  notable.

**skip** — nobody hears about it:
- Typos, spelling, grammar, punctuation, capitalization.
- Formatting, whitespace, heading levels, table or component markup.
- Broken-link fixes and link target updates.
- Rewording that does not change meaning: tightening prose, cutting filler,
  style-guide compliance, voice fixes.
- Tooling, CI, scripts, dependencies, build configuration.
- Regenerated build artifacts with no underlying source change.
- \`.draft\` files, and any page not yet wired into navigation.
- Internal refactors: moving content between files with no reader-visible change.

## Steps

1. Read the PR title, body, and the changed files with their diffs.
2. Ask what a customer reading the docs would *newly be able to do or know*.
   If the answer is nothing, the tier is \`skip\` or \`minor\`, never \`notable\`.
3. If the change documents something that already existed, apply exactly the same
   test — the feature's age is irrelevant. Ask only: **could a reader have found
   this before?** If yes, you are filling a gap, so \`minor\` at most. Never tier
   something \`notable\` on the grounds that the documentation caught up.
4. Ask whether the docs previously told someone something false, or whether a URL
   changed. If so, the tier is at least \`minor\`.
5. Assign the single highest tier justified by the change. One PR that adds a new
   guide and also fixes six typos is \`notable\` — describe the guide, ignore the typos.

## Worked examples

- Adds \`fern/products/calling/pages/guides/port-numbers.mdx\`, a new guide.
  → **notable**. "New guide: porting numbers with E911."

- Adds a \`codecs\` field to a SIP endpoint model in \`specs/**/*.tsp\`.
  → **notable**. A new field in the reference is a new capability to a reader.

- Changes a documented default from \`30s\` to \`60s\` in the reference.
  → **notable**. Behavior change; readers may have built around the old value.

- Corrects a parameter documented as \`string\` that is actually an object.
  → **minor**. The docs were wrong and colleagues need to know, but this is not a
  new capability and does not belong on the public timeline.

- Adds a guide for verifying request signatures. The signing has behaved this way
  for years but was documented nowhere.
  → **notable**. Undiscoverable before, discoverable now — a reader gained
  something real, whatever the feature's age. Describe the verification itself,
  not the arrival of documentation.

- Adds response schemas to webhook reference pages whose response contract was
  already described in prose on the same pages.
  → **minor**. Gap-filling. A reader could already learn the contract; it is now
  rendered rather than narrated.

- Retires the guides for an older SDK version, leaving its reference pages in
  place, with the old guide URLs redirecting.
  → **minor**. Documentation reorganization and a URL change. Retiring *guides* is
  not deprecating a *product*, and nobody wants a public card announcing that some
  pages went away.

- Adds callouts and a reliability section warning that status callbacks are
  best-effort and must not gate critical logic. The platform is unchanged and the
  behavior was already documented.
  → **minor**. A posture change: the docs now steer harder. Worth flagging
  internally, but no reader gained a capability.

- Moves a page from \`/docs/ai/tool-calling\` to \`/docs/swml/ai/tool-calling\`.
  → **minor**. URL change; Support may have sent customers the old link.

- Rewrites an intro paragraph to cut "In this guide you will learn" and drop the
  editorial "we".
  → **skip**. Style compliance; nothing a reader concludes differently.

- Fixes 12 broken links flagged by the link checker.
  → **skip**. Even at volume, this reaches nobody.

- Rewrites a warning from "this may take a while" to "this takes up to 30 seconds".
  → **minor**. Vague became specific, so a reader now concludes something they
  could not before. Not \`skip\`, despite reading like a reword.

- Updates \`.github/workflows/check-links.yml\` and \`scripts/check-links.js\`.
  → **skip**. Tooling.

## Narrowing

Default to the *lower* tier when genuinely torn. Over-reporting trains people to
ignore the digest, which is the failure mode this pipeline exists to avoid. Set
\`confidence\` below 0.7 whenever you are unsure, and say why in \`reasoning\` —
a human reviews every tier call before anything is published.`;

module.exports = { TIERS, TIER_ROUTING, MAX_LISTED_FILES, rubric };
