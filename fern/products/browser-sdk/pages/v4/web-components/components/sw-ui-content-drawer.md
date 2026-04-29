---
title: "sw-ui-content-drawer"
slug: "/web-components/sw-ui-content-drawer"
---
# `<sw-ui-content-drawer>`

Slide-in drawer that displays rich content the agent pushed
mid-call (a snippet, a markdown article, a sanitized HTML fragment, or
plain text) without leaving the call view.

Used by `<sw-call-widget>` to render `display_content` user events from
the AI agent. The drawer auto-orients itself to the available space:

- **Wide containers** — slides in from the right at ~360 px wide.
- **Narrow containers** (parent ≤ 480 px) — slides up from the bottom at
~50 % container height for better mobile ergonomics.

Four content formats are supported, each with appropriate sanitisation:

- `text` — rendered verbatim with whitespace preserved.
- `markdown` — parsed via `marked`, sanitised via DOMPurify with a
strict tag/attribute allowlist; `target="_blank"` links are rewritten
with `rel="noopener noreferrer"`.
- `code` — highlighted via Prism; the language must be supplied in
`payload.language` and is loaded lazily.
- `html` — passed through DOMPurify with the same allowlist as markdown.

_Class: `SwUiContentDrawer` · Module: `packages/web-components/src/components/UI/layout/sw-ui-content-drawer.ts`_

## class: `SwUiContentDrawer`, `sw-ui-content-drawer`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name       | Privacy | Type            | Default  | Description | Inherited From |
| ---------- | ------- | --------------- | -------- | ----------- | -------------- |
| `open`     |         | `boolean`       | `false`  |             |                |
| `narrow`   |         | `boolean`       | `false`  |             |                |
| `title`    |         | `string`        | `''`     |             |                |
| `content`  |         | `string`        | `''`     |             |                |
| `format`   |         | `ContentFormat` | `'text'` |             |                |
| `language` |         | `string`        | `''`     |             |                |

### Attributes

| Name       | Field    | Inherited From |
| ---------- | -------- | -------------- |
| `open`     | open     |                |
| `narrow`   | narrow   |                |
| `title`    | title    |                |
| `content`  | content  |                |
| `format`   | format   |                |
| `language` | language |                |

### CSS Properties

| Name                 | Default | Description                                      |
| -------------------- | ------- | ------------------------------------------------ |
| `--bg-page`          |         | Drawer background.                               |
| `--fg-default`       |         | Primary text color.                              |
| `--border-default`   |         | Header divider color.                            |
| `--shadow-md`        |         | Drawer drop shadow.                              |
| `--radius-md`        |         | Drawer corner rounding (only the visible edges). |
| `--type-family-body` |         | Body font family.                                |
| `--type-size-small`  |         | Body font size.                                  |

### CSS Parts

| Name        | Description                           |
| ----------- | ------------------------------------- |
| `container` | Outer drawer container.               |
| `header`    | Sticky header (title + close button). |
| `title`     | Title heading.                        |
| `close`     | Close-button anchor.                  |
| `body`      | Scrollable content body.              |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-content-drawer-close` | — | User clicked the close button. No detail. |

---
