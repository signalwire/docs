# Contributing to the SignalWire Docs

Thanks for helping improve the SignalWire documentation.
Whether you're fixing a typo, clarifying a confusing paragraph, or writing a new guide,
this page explains how changes get from your editor to 
[signalwire.com/docs](https://signalwire.com/docs).

For local setup (prerequisites, `yarn install`, `yarn start:dev`) 
and an overview of the repo structure, see the [README](README.md).
This page picks up where that leaves off:
the contribution workflow, the conventions we follow, 
and the checks a pull request has to pass.

## Ways to contribute

- **Report a problem.**
  Something wrong, missing, or out of date?
  [Open an issue](https://github.com/signalwire/docs/issues/new/choose).
  A clear description and a link to the affected page is plenty to get started.
- **Small fixes** — typos, broken links, a clearer sentence.
  Use the **Edit this page** link at the bottom of any docs page to jump straight to the source and open a PR from the browser.
  No local setup required.
- **Larger changes** — new pages, reorganizing a section, editing API specs.
  Clone the repo and work locally so you can preview before opening a PR.

## The workflow

1. **Fork** the repository (external contributors) or create a branch (team members).
2. **Set up locally.**
   With [Node.js](https://nodejs.org/en) (v22+) and [Yarn](https://classic.yarnpkg.com/) (v1) installed,
   clone your fork and run `yarn install`.
   See [Usage](README.md#usage) in the README for full details.
   (Skip this if you're using the browser **Edit this page** flow.)
3. **Make your change.**
   See [What you're editing](#what-youre-editing) for where things live and the conventions to follow.
4. **Preview locally** with `yarn start:dev` and confirm it renders the way you expect.
5. **Open a pull request** against `main`.
   Describe what changed and why; link any related issue.
   Screenshots help for anything visual.
6. **CI runs.**
   Once checks run, a preview deployment is posted as a PR comment — use it to check your rendered changes.
   All checks must be green before merge (see [Checks](#checks-your-pr-has-to-pass)).
   For PRs from a fork, a maintainer has to approve the workflow run first, so checks and the preview won't appear until they do.
7. **Address review feedback.**
   A member of the Developer Experience team reviews every PR.
   Push follow-up commits to the same branch; there's no need to open a new PR.

Once approved and merged, the site rebuilds and deploys automatically —
your change is usually live within minutes.
Because merges publish straight to production, keep PRs focused and make sure the preview looks right.

> [!TIP]
> Open a PR early as a **draft** if you'd like feedback before it's finished.
> A PR with no activity for 25 days is marked stale and closed 5 days later;
> commenting, pushing, or removing the stale label keeps it open, and closed PRs can always be reopened.

## What you're editing

Almost all content lives under `fern/`:
`.mdx` pages under `fern/products/<product>/pages/`, and reusable blocks in `fern/snippets/`.

### Content conventions

Page structure, required frontmatter, navigation, components, 
and the strict MDX v3 syntax rules are all documented in the repo's authoring guides:

- [`.claude/rules/mdx-style.md`](.claude/rules/mdx-style.md) — page types (Diátaxis) and writing voice.
- [`.claude/rules/mdx-mechanics.md`](.claude/rules/mdx-mechanics.md) — frontmatter, structure, links, the LLM view, and MDX rules that break the build.
- [`.claude/rules/mdx-components.md`](.claude/rules/mdx-components.md) — the component catalog (house set, custom components, what not to use).
- [`.claude/rules/mdx-reference-pages.md`](.claude/rules/mdx-reference-pages.md) — reference-page patterns (`ParamField`, section names, examples).
- [`.claude/rules/docs-conventions.md`](.claude/rules/docs-conventions.md) — which docs are hand-authored vs. generated.

These are the single source of truth (and double as the guardrails your AI editor loads automatically), so follow them rather than any summary here.
The research and rationale behind them lives in [`.claude/docs/mdx-style-reference.md`](.claude/docs/mdx-style-reference.md).

### Edit the source, not the output

The one rule worth repeating up front:
API reference pages and the SWML schema are **generated** from [TypeSpec](https://typespec.io/docs) source in `specs/`,
so the committed OpenAPI/JSON Schema files under `fern/apis/**` and `specs/swml/**/tsp-output/**` are build artifacts.

> [!IMPORTANT]
> Never hand-edit generated files.
> Change the `.tsp` source in `specs/`, then rebuild with `yarn build:specs` and commit both the source and the regenerated output.
> See [API specifications](README.md#api-specifications) in the README for the full spec workflow.

## Checks your PR has to pass

CI runs on every pull request.
All of it must pass before merge:

| Check | Command (run locally) | What it verifies |
|---|---|---|
| `fern-check` | `yarn fern-check` | Fern configuration and API definitions are valid |
| `fern-md-check` | `yarn fern-md-check` | Markdown/MDX content is well-formed |
| `preview-docs` | — | Builds a preview deployment (linked in a PR comment) |
| Link check | `yarn check-links` | Runs on a schedule against production; you can run it locally |

Running the relevant command before you push catches most failures early.
If you touched specs, also run `yarn build:specs` and `yarn format:specs`.

## Style

Match the voice and formatting of the pages around what you're editing.
When in doubt, favor clear, concise, second-person ("you") instructions and working, copy-pasteable examples.
Commit messages are informal — a short, descriptive summary of what changed is all we ask.

## Licensing

The documentation is published under the terms in [LICENSE](LICENSE).
By contributing, you agree that your contributions are licensed under the same terms.

## Getting help

The docs are maintained by the SignalWire **Developer Experience** team.

- **Questions & feedback:** devex@signalwire.com
- **Community:** [Discord](https://discord.com/invite/F2WNYTNjuF)
- **Product support:** [support.signalwire.com](https://support.signalwire.com/hc/en-us)
