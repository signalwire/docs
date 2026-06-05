---
paths:
  - "fern/**/*.mdx"
---

# Documentation style (Fern / MDX v3)

How to author and edit `.mdx` pages so the docs site stays consistent.

This is the only guardrail — nothing lints these pages for you, so follow all of it. It covers
page structure, page shape, and the MDX v3 syntax that breaks the build. Companion:
`docs-conventions.md` (which docs are hand-authored vs generated — never hand-edit the generated
REST reference).

## Structure: the folder tree is the nav

Fern builds the sidebar from the folder layout; each label comes from a page's front-matter
`title`. You don't write nav config — you produce a clean tree that reads like the sidebar you
want. `reference/` (exhaustive, one page per symbol) and `guides/` (task-oriented narrative)
stay separate. One concept per file, `kebab-case.mdx`. Alphabetical order by default — don't set
`position` except on `overview.mdx`.

**Section landing pages** — a folder is a sidebar section. Pick by section type:

| Section type | Landing file | Behavior | Use for |
|---|---|---|---|
| Top-level (under a tab) | `overview.mdx` (`position: 0`) | Non-clickable header; landing shows as "Overview" child | Main namespace / top-level area |
| Nested topic | `index.mdx` | Clickable header → landing; detail pages nest beneath | A class, or a complex multi-page method/module |
| Organizational only | *(none)* | Collapsible grouping, nothing to click | A grouping that just lists child pages |

All three cases in one tree (names illustrate a FreeSWITCH reference — adapt to your product):

```
pages/
├── reference/
│   ├── applications/               # top-level section
│   │   ├── overview.mdx            # non-clickable label; "Overview" is its first child
│   │   └── playback.mdx
│   │
│   ├── modules/                    # top-level section
│   │   ├── overview.mdx
│   │   └── mod-dptools/            # nested topic — a module worth its own landing
│   │       ├── index.mdx           # clickable landing; child pages nest beneath it
│   │       └── set.mdx
│   │
│   └── channel-variables/          # top-level section
│       ├── overview.mdx
│       └── core/                   # organizational — only groups variables
│           └── caller-id-name.mdx  # no landing file; collapsible label only
│
└── guides/
    └── get-started/                # top-level guide section
        ├── overview.mdx
        └── quickstart.mdx
```

**Slug ≠ folder path.** Folder drives nav; `slug` drives the URL. Keep them independent so you
can reorganize sections without breaking URLs. Slugs are lowercase-kebab, 2–3 segments, drop
filing buckets (`methods/`, `basics/`, `recipes/`) but keep stable domains (`calling`). No
product prefix, no leading/trailing slash, no extension. A reference slug *may* mirror a
meaningful hierarchy (`/reference/python/agents/agent-base/on-debug-event`) — mirror meaning,
never just folders.

## Front matter

Four fields **required on every page**:

```yaml
---
title: "originate"                          # H1 + sidebar label; exact symbol name for reference pages
slug: /reference/api-commands/originate      # URL; see slug rules above
description: One sentence, for search/SEO.
max-toc-depth: 3                             # always exactly 3
---
```

> **The H1 is the `title`, not body Markdown.** Every page has exactly one H1, rendered from the
> `title` field. Never write a `#` heading in the body — it produces a duplicate, wrongly-styled
> heading. The body opens with the description paragraph; all body headings are `##` or deeper.

Optional when they apply: `subtitle`, `sidebar-title` (e.g. `Overview`), `position` (`0` on
overviews only), `hidden`. Never fabricate an `id`/UUID.

## Page types

Classify every page as one of four types and follow its skeleton. Two conventions apply to all of
them: body headings are `##` or deeper (never a body `# H1`), in **sentence case** ("Next steps",
not "Next Steps"); and the reference section names `## **Parameters**`, `## **Properties**`,
`## **Returns**`, `## **Examples**` are bolded and used verbatim.

### Reference

One page per symbol — an application, command, function, module, or channel variable. Terse and
lookup-oriented (~50–80 lines). Sections in order, dropping any that don't apply: description
paragraph → optional `<Note>` / `<Warning>` → interface shape → `## **Returns**` →
`## **Examples**`.

````mdx
---
title: "originate"
slug: /reference/api-commands/originate
description: Originate a new call and bridge it to a dialplan target.
max-toc-depth: 3
---

Originate a new call from FreeSWITCH and bridge it to a dialplan extension or application.

<Note>
`originate` runs synchronously on the API/CLI unless you prefix the dial string with
inline `{ }` channel-variable options.
</Note>

## **Parameters**

<ParamField path="dial_string" type="string" required={true} toc={true}>
  The endpoint to call, e.g. `sofia/gateway/my_gateway/15551234567`.
</ParamField>

<ParamField path="options" type="object" toc={true}>
  Channel variables passed inline in `{ }` before the dial string.
</ParamField>

<Indent>

<ParamField path="options.call_timeout" type="integer" default="60" toc={true}>
  Seconds to wait for an answer before giving up.
</ParamField>

</Indent>

## **Returns**

`+OK <uuid>` on success; `-ERR <reason>` on failure.

## **Example**

```bash
originate sofia/gateway/my_gateway/15551234567 &playback(/tmp/welcome.wav)
```
````

That `## **Parameters**` block is the workhorse of every reference page — one `<ParamField>` per
element in the order they appear, objects nested with `<Indent>`, followed by a native-syntax example.
Only the heading and `path` form change with the interface; the pattern stays the same:

| Interface | Heading | `path` form |
|---|---|---|
| Data object (JSON/YAML) | `## **Properties**` | dot-notation (`answer.max_duration`) |
| Function / method | `## **Parameters**` | bare arg name (`timeout`) |
| XML element | `## Attributes` | bare attribute (`data`) |
| Callback / event | `## **Parameters**` | arg name; dot-notation for payload |

*Data object (SWML JSON/YAML) — nested keys via dot-notation + `<Indent>`:*

```mdx
## **Properties**

<ParamField path="answer" type="object" toc={true}>
  An object accepting the following properties.
</ParamField>

<Indent>

<ParamField path="answer.max_duration" type="integer" default="14400" toc={true}>
  Maximum call duration in seconds.
</ParamField>

</Indent>
```

*Function / method — write `type` in the language's own terms (here Python):*

```mdx
## **Parameters**

<ParamField path="hint" type="str" required={true} toc={true}>
  A word or phrase to boost recognition accuracy.
</ParamField>
```

*XML element — one field per attribute, bare attribute name as `path`:*

```mdx
## Attributes

<ParamField path="application" type="string" required={true} toc={true}>
  The dialplan application to execute, e.g. `playback`, `bridge`, `set`.
</ParamField>
```

*Callback / event handler — document payload fields inline under the handler:*

```mdx
## **Parameters**

<ParamField path="handler" type="Callable[[str, dict], None]" required={true} toc={true}>
  Invoked on each event with signature `(event_type, data)`.

  - `event_type` — the event label string
  - `data` — full payload, including `call_id` and event-specific fields
</ParamField>
```

In `<ParamField>`: add `required={true}` only to required params (never `required={false}`),
`default` only when the param has one, and `toc={true}` on reference params.

### Overview and index pages

A section's landing page: intro → optional concept `##` sections → a `<CardGroup>` linking the
child pages. Use `overview.mdx` for a top-level section, `index.mdx` for a nested topic (per the
landing-page table above).

```mdx
---
title: "API Commands"
sidebar-title: Overview
slug: /reference/api-commands
description: Reference for FreeSWITCH API commands available via fs_cli, ESL, and mod_xml_rpc.
max-toc-depth: 3
position: 0
---

API commands query and control a running FreeSWITCH instance — originating calls,
inspecting channels, reloading config — without restarting.

<CardGroup cols={3}>
  <Card title="originate" href="/reference/api-commands/originate">
    Originate a new outbound call.
  </Card>
  <Card title="reloadxml" href="/reference/api-commands/reloadxml">
    Reload the XML configuration.
  </Card>
</CardGroup>
```

### Guide

Task-oriented and narrative: intro → optional `<Info>` / `<Tip>` → body (prose + `<CodeBlocks>`,
with `<Steps>` for ordered procedures) → `## Next steps` (bullet links or `<Cards>`).

```mdx
---
title: Route inbound calls with the XML dialplan
subtitle: Match inbound calls and send them to dialplan applications.
slug: /guides/inbound-routing
description: Route inbound calls to dialplan applications using FreeSWITCH XML dialplan conditions.
max-toc-depth: 3
---

This guide shows how to match inbound calls and route them to dialplan applications.

<Info>
For every application you can call from a condition, see the
[Applications reference](/reference/applications).
</Info>

## Add a dialplan extension

<Steps>

### Create the extension

Add an `<extension>` block to `conf/dialplan/default.xml`.

### Match the destination number

Use a `<condition>` on `destination_number` with a regular expression.

</Steps>

## Next steps

- **[Applications reference](/reference/applications)** — every application you can call.
- **[Channel variables](/reference/channel-variables)** — variables you can read and set.
```

### Landing page

The single top page for the whole doc set — like an overview but broader: intro, a few concept
sections, and a `<Cards>` grid pointing at the major areas.

For overview, guide, and landing pages, **match an existing repo page of the same type** rather
than inventing a layout.

## Components — use only these

Full examples in `component-catalog.md`. At a glance:

| Component | For |
|---|---|
| `ParamField` + `Indent` | One interface element; nest sub-fields |
| `CodeBlocks` / `CodeBlock` | Same example in multiple formats/langs (single example → plain fenced block) |
| `Tabs` / `Tab` | Switchable non-code variants |
| `Note` / `Tip` / `Warning` / `Info` | Prerequisite / suggestion / hazard / pointer |
| `Accordion` / `AccordionGroup` | Hide long/optional content |
| `Card` / `CardGroup` / `Cards` | Link grids (overviews, "Next steps") |
| `Steps` / `Step` | Ordered procedure in a guide |
| `Frame` | Image/diagram with caption |
| `Markdown` | Shared snippet include (only real partials) |
| `Button` / `Tooltip` / `Icon` | CTA / inline definition / inline icon |

## Strict MDX v3 rules (these break the build)

The site compiles MDX 3 with Acorn JSX parsing — these are hard errors, not style preferences:

- **Close every tag**: `<br />`, `<img src="x.webp" alt="y" />`; self-close standalone
  components (`<Markdown src="..." />`).
- **Comments are JSX expressions**: `{/* ... */}`, never `<!-- ... -->`.
- **Attributes**: quote strings (`title="YAML"`); brace booleans/numbers/expressions
  (`required={true}`, `cols={3}`, `toc={true}`).
- **No bare `<` or `{` in prose** — backtick it inline or put it in a fenced block. This is the
  single most common failure (describing C syntax, templates, comparisons).
- **Blank lines** around block components and inside `<Indent>` / `<Steps>` / `<Accordion>`, or
  the inner Markdown won't parse.
- **Every code fence has a language** (` ```bash `, ` ```xml `, ` ```python `).
- **No body `# H1`**; headings are `##` or deeper.

## Before you emit

The MDX rules above break the build if missed; the build won't catch these, so verify them by hand:

- All four front-matter fields present; `slug` lowercase-kebab, decoupled from the folder path
  (drops filing buckets); no fabricated `id`.
- Page type identified; sections match its skeleton order; body opens with the description
  paragraph; no placeholder sections.
- Correct landing filename (`overview.mdx` top-level / `index.mdx` nested topic / none for
  organizational).
- Headings are sentence case; house section names used verbatim.
- Only catalog components used; every internal link/anchor resolves to a real slug/heading.
