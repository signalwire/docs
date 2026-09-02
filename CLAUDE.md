# SignalWire docs

Fern-powered documentation site. Two sources of truth: MDX pages under `fern/products/**/pages/`, and TypeSpec under `specs/` that generates the REST and SWML reference.

## Authoring rules

`.claude/rules/` holds the binding conventions. They are path-scoped and fire when a matching file is read — so when you create a file from scratch, open the matching rule first: `mdx-style`, `mdx-mechanics`, `mdx-components`, `mdx-reference-pages`, `docs-conventions` for anything under `fern/`; `spec-conventions` for `specs/`. Rationale and depth behind the style rules: `.claude/docs/mdx-style-reference.md` (read on demand, never auto-loads).

## Don't hand-edit generated output

`specs/**/tsp-output/**` and the OpenAPI files it produces (`fern/apis/signalwire-rest/openapi.yaml`, `fern/apis/compatibility/openapi.yaml`) are build artifacts. The REST reference has no MDX at all: change the `.tsp` under `specs/`, run `yarn build:specs`, and commit source plus regenerated output together. When a rendered page is wrong, fix the generator or its source — never patch the output, which the next build overwrites.

A SWML-only `.tsp` edit still moves `fern/apis/signalwire-rest/openapi.yaml`, because the REST tree imports the SWML models. Run `yarn build:specs` before committing even a SWML-only change, and expect a large REST diff in a SWML PR.

## Changelog

`fern/products/platform/changelog/` is a **product** changelog, written for customers and
authored by Product, Marketing, and PMs as well as docs. Copy `_template.mdx` to
`YYYY-MM-DD.mdx` — the date the change reached customers, not the day you wrote it. Several
changes on one date share a file, one `##` heading each.

- **Titles say what was added, changed, removed, or deprecated** — in words, since no tag
  carries the kind. Sentence case, no end punctuation.
  A reader skimming the index shouldn't have to open the entry. "Tool calling guide added",
  not "Tool calling"; "Default TTS engine changed from Google to ElevenLabs", not "TTS
  update". No marketing phrasing ("One AI agent, many languages").
- **Lead with the capability, concretely, in the first clause** — the opening line is the
  whole entry for anyone skimming. An imperative usually beats a formula ("Pick Groq or
  Mistral as your TTS engine"); "You can now …" is one option, not a house opening, and a
  run of identical openings stops being read. One to three sentences, second person.
- **Tag product areas only, alphabetical** — `voice`, `messaging`, `ai`, `video`, `fabric`,
  `sdks`, `swml`, `apis`, `tts`, `e911`, `compliance`, `security`. Chips render on the index
  and feed the tag filter, so keep the list short; a tag matching one entry filters nothing.
  The kind of change belongs in the title, not in a tag.
- **Documentation work gets no entry at all.** A new guide, a new reference page, or writing
  up something that already shipped is not a changelog entry, however important the feature.
  The only exception is a capability customers had no way to discover, where publishing it is
  effectively the release. When in doubt, leave it out.
- **Every `##` section opens with a text paragraph**, never a component — Fern previews each
  entry by its opening content and a callout there renders badly. A breaking change puts a
  titled `<Warning>` after that paragraph; an untitled callout flattens to plain prose in the
  Markdown export.
- **Links inline in prose, never a trailing "Updated pages:" list.** Copy every URL from the
  target page's own `slug:` frontmatter, prefixed `/docs/<product-slug>/`. Never guess one.

Entries are customer-facing, so everything under "Everything here is customer-facing" applies.

## Everything here is customer-facing

Assume no prior knowledge, and never expose internal implementation detail — backend endpoints, transports, engine-side params. Every fact traces to source, a spec, the dashboard, or a ticket; if you can't verify one, write `[NEEDS SOURCE: what's missing]` instead of guessing.

## Verify

| Change | Run |
|---|---|
| MDX pages | `yarn fern-md-check` |
| Nav yml (`fern/docs.yml`, `fern/products/*/*.yml`) | `yarn fern-check` |
| TypeSpec under `specs/` | `yarn build:specs` |

CI runs `fern-check` and `fern-md-check` on every PR. No check covers `#anchor` fragments — verify by hand any link you touch.

Never start the dev server (`yarn start`, `yarn start:dev`, `fern docs dev`). Ask the user to preview, and hand them the URLs of the pages you changed.
