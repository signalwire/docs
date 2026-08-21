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

/** Which audiences each tier reaches. Render and publish both key off this. */
const TIER_ROUTING = {
  notable: ['changelog', 'devex', 'support'],
  minor: ['support'],
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

**notable** — published to the public customer-facing changelog AND both internal
Slack digests. Reserve this for changes a customer building on SignalWire would
want to know about:
- A new page, guide, or tutorial.
- A new endpoint, method, field, or parameter appearing in the API or SWML reference.
- A documented behavior change, new limit, or changed default.
- A deprecation or removal.

**minor** — internal Support digest only. Support needs these to answer tickets;
customers do not get a card for them:
- A corrected factual error (wrong type, wrong default, wrong enum value, wrong
  description). Support must know the docs previously said something wrong.
- A page that moved, was renamed, or got a new slug — any URL change, because
  Support may have shared the old link.
- A substantive change to an example or code sample: it previously did not run,
  used the wrong parameter, or now demonstrates a different approach.
- A clarification that changes what a reader would conclude.

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
3. Ask whether the docs previously told someone something false, or whether a URL
   changed. If so, the tier is at least \`minor\`.
4. Assign the single highest tier justified by the change. One PR that adds a new
   guide and also fixes six typos is \`notable\` — describe the guide, ignore the typos.

## Worked examples

- Adds \`fern/products/calling/pages/guides/port-numbers.mdx\`, a new guide.
  → **notable**. "New guide: porting numbers with E911."

- Adds a \`codecs\` field to a SIP endpoint model in \`specs/**/*.tsp\`.
  → **notable**. A new field in the reference is a new capability to a reader.

- Changes a documented default from \`30s\` to \`60s\` in the reference.
  → **notable**. Behavior change; readers may have built around the old value.

- Corrects a parameter documented as \`string\` that is actually an object.
  → **minor**. The docs were wrong and Support needs to know, but this is not a
  new capability and does not belong on the public timeline.

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

module.exports = { TIERS, TIER_ROUTING, rubric };
