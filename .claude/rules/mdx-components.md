---
paths:
  - "fern/**/*.mdx"
---

# Component catalog

Every component available on this site: Fern's full default library (descriptions from Fern's docs) plus our custom components. **Unused** = available but zero uses in this repo — confirm it renders on our pinned Fern version (`fern.config.json`) and call it out in the PR before first use.

| Component | What it does | Here |
|---|---|---|
| `Accordion` / `AccordionGroup` | Expandable sections for progressive disclosure (FAQs, optional detail) | In use — collapse long or optional content |
| `Anchor` | Linkable anchor for content without a heading | Unused |
| `Aside` | Floating, sticky right-rail content (e.g. a pinned endpoint snippet) | Unused |
| `Badge` | Small inline label for status, versions, metadata | Unused |
| `Button` | Interactive button with styles, sizes, intents, icons | Unused |
| `Callout` → named variants `Note` `Info` `Warning` `Tip` `Check` `Error` `Success` `Launch` | Highlighted admonition block with intent and optional custom icon | House set: `Note`/`Tip`/`Warning`/`Info` = prereq / suggestion / hazard / pointer; `Error` rare (×2). Write the named variant, never generic `<Callout>` |
| `Card` / `CardGroup` | Boxed content and link grids | In use — overviews and `## Next steps`. `<Cards>` is an undocumented legacy alias (×2 old pages); use `CardGroup` |
| Code blocks: fenced + `CodeBlocks` / `CodeBlock` | Syntax highlighting with `title="…"`, line highlights `{6,9}`, focus | House: single example = plain fence; several languages/formats = `CodeBlocks` of titled `CodeBlock`s. `CodeGroup` (Fern's `for=`-synced grouping) unused here |
| `Copy` | Click-to-copy for arbitrary text | Unused |
| `Download` | Lets readers download PDFs, files, ZIP bundles | Unused |
| `EndpointRequestSnippet` | Embeds an endpoint's request example from the API Reference | In use — pair with a link to the reference page |
| `EndpointResponseSnippet` | Embeds an endpoint's response example | In use |
| `EndpointSchemaSnippet` | Embeds an endpoint's schema | In use — heavily, in SDK reference |
| `Files` | Interactive file tree with expandable folders | Unused |
| `Frame` | Image or diagram with caption and background variants | In use — wrap meaningful images |
| `Icon` | Inline Font Awesome icon with size/color/style | Rare (×2) — short-form icon syntax per `mdx-mechanics` |
| `If` | Shows/hides content by product, version, or reader role | Unused |
| `Indent` | Left indentation for nested parameters and hierarchy | In use — nests `ParamField`s (blank lines inside) |
| `Markdown src="…"` | Includes a reusable snippet from `fern/snippets/`; supports `{{param}}` substitution | In use — self-closing; only genuinely shared content |
| `ParamField` | Documents one API parameter: type, required, default, description | The house workhorse (6.5k uses) — patterns in `mdx-reference-pages` |
| `Prompt` | Copyable prompt with open-in actions for Cursor/Claude/ChatGPT | Unused |
| `RunnableEndpoint` | In-page testable endpoint with environments and live responses | **Never** — its server variable isn't reader-editable; use `EndpointRequestSnippet` plus a reference link |
| `Schema` | Renders any type definition from the API Reference | In use |
| `SchemaSnippet` | Displays a type definition as a JSON code block | Unused |
| `Steps` / `Step` | Auto-numbered sequential walkthrough | In use — ordered procedures in guides |
| Tables (markdown) | Rows and columns, optional sticky header | Native markdown — genuine enumerations only (see `mdx-style`) |
| `Tabs` / `Tab` | Tabbed views with language synchronization | In use — switchable non-code variants |
| `Tooltip` | Contextual info on hover, for text and code | Rare (×6) — only where it genuinely helps |
| `Versions` | Content that switches with a version dropdown | Unused |
| `WebhookPayloadSnippet` | Embeds a webhook payload example from the API Reference | In use |

Custom components (registered in `docs.yml` → `fern/components/`):

- `VoiceWidget` — interactive click-to-call demo. Human-only: wrap usages in `<llms-ignore>`.
- `Skeleton` / `SkeletonText` — loading placeholders; registered, no MDX uses yet.
