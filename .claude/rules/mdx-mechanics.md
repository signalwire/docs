---
paths:
  - "fern/**/*.mdx"
  - "fern/**/*.md"
---

# MDX mechanics — Fern

## Frontmatter — required on every page

```yaml
---
title: "Tool calling"      # becomes the H1 and the sidebar label
slug: /ai/tool-calling     # lowercase-kebab, 2–3 segments, no product prefix/extension; independent of folder path
description: One concrete sentence — feeds SEO meta AND llms.txt.
max-toc-depth: 3           # always exactly 3
---
```

Optional when needed: `subtitle`, `sidebar-title`, `position` (only to force order, e.g. a getting-started sequence; default is alphabetical), `hidden`. Never fabricate `id:` (legacy import marker); don't add `headline`, `keywords`, or `x-custom`.

## Structure

- The H1 is the `title` — body headings start at `##`. No opening "## Overview" heading; the body starts with the intro paragraph.
- The folder tree builds nested nav (labels from frontmatter). Tabs and top-level entries live in `fern/products/<product>/<product>.yml` — a new folder or top-level page needs a `- folder:`/`- page:` entry there.
- Landing files: `overview.mdx` (+ `position: 0`) for a top-level section — renders a non-clickable header with "Overview" as its first child; `index.mdx` for a nested topic — clickable header opening the landing, children nested beneath; none for a pure grouping folder (collapsible label only).
- Slugs drop filing buckets (`methods/`, `basics/`, `recipes/`) but keep stable domains (`calling`); a reference slug may mirror a meaningful hierarchy — mirror meaning, never folders.
- One concept per file, `kebab-case.mdx`.

## Components

Only catalog components — the house set and its boundaries live in `mdx-components`. Never invent a component name; `.md` files take no JSX at all.

## The LLM view

Every page is also served as plain Markdown (append `.md` to its URL to preview) and indexed in `llms.txt`; frontmatter `description` feeds both it and SEO. Endpoint snippets already render as fenced code there. Filter the rest deliberately:

- An information-carrying graphic (SVG/PNG diagram) reaches agents only as a link — pair it with an adjacent `<llms-only>` text equivalent. Mermaid needs none; its source is already text.
- Wrap human-only material in `<llms-ignore>`: UI click-throughs, marketing CTAs, decorative or theme-duplicate images, interactive widgets (`VoiceWidget`). Where a programmatic equivalent exists (CLI/API), give it to agents in a paired `<llms-only>` block — UI steps for humans, commands for agents.
- `noindex: true` (frontmatter) drops a page from llms.txt and search engines; `hidden: true` (nav yml) also removes it from the sidebar.

## Code, links, media

- Every fence declares a language. Label with `title="…"` where a filename or variant helps; highlight lines `{6,9}` and keep highlights aligned across parallel language examples. Mermaid fences render natively.
- Internal links are root-relative `/docs/<slug>` — no `.mdx`, no trailing slash. Link-heavy pages gather reference-style definitions (`[key]: /docs/…`) at the top.
- Images live in `fern/assets/images/**`, referenced `/assets/images/…`, always with meaningful alt text.
- Icons: short form (`regular robot`), not `fa-regular fa-robot` and not bare names. (judgment — standardizes a three-way drift toward the modern-page form)

## MDX v3 — these break the build

- Close every tag (`<br />`); self-close standalone components (`<Markdown src="…" />`).
- Comments are `{/* … */}`, never `<!-- -->`.
- Quote string attributes; brace everything else (`cols={3}`, `required={true}`).
- No bare `<` or `{` in prose — backtick it or fence it (the most common failure).
- Blank lines around block components and inside `Indent`/`Steps`/`Accordion`, or the inner Markdown won't parse.

## Checks

- After MDX edits: `yarn fern-md-check`. If you touched any nav yml: `yarn fern-check`.
- Hand-verify `#anchor` fragments in links you touched — no CI check covers them (lychee skips fragments).
- Never run `yarn start:dev` (dev server) — ask the user to preview, and hand them the changed page URLs.
- Propose commits via diff; don't commit unasked.

*Everything here is repo-verified (census 2026-07) or from Fern's docs source. Deep reference: `.claude/docs/mdx-style-reference.md`.*
