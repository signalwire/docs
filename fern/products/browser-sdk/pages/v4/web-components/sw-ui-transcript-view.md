---
title: "sw-ui-transcript-view"
slug: "/web-components/sw-ui-transcript-view"
---
# `<sw-ui-transcript-view>`

Chat-bubble timeline that renders an array of `TranscriptEntry`
items, each tagged as user / agent / system with optional rich content.

Designed to live inside `<sw-ui-call-layout>`'s `transcript` slot or
`<sw-ui-content-drawer>` body. The view auto-scrolls to the latest
entry, distinguishes "partial" (in-progress) entries with a subtle
pulse, and renders rich `meta` payloads:

- **Links** — clickable anchors injected as a footer beneath the bubble.
- **Code** — Prism-highlighted snippet (language is loaded lazily).
- **Display content** — content the agent pushed via a
`display_content` user event; preserved verbatim so the download
button can serialise the full payload back to markdown.

The header includes a download icon that exports the entire transcript
as a `.md` file via `transcriptToMarkdown()` so users can save the
conversation.

_Class: `SwUiTranscriptView` · Module: `packages/web-components/src/components/UI/sw-ui-transcript-view.ts`_

## class: `SwUiTranscriptView`, `sw-ui-transcript-view`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name        | Privacy | Type                | Default        | Description | Inherited From |
| ----------- | ------- | ------------------- | -------------- | ----------- | -------------- |
| `entries`   |         | `TranscriptEntry[]` | `[]`           |             |                |
| `header`    |         | `string`            | `'Transcript'` |             |                |
| `emptyText` |         | `string`            | `''`           |             |                |

### Attributes

| Name         | Field     | Inherited From |
| ------------ | --------- | -------------- |
| `header`     | header    |                |
| `empty-text` | emptyText |                |

### CSS Properties

| Name                  | Default | Description                                    |
| --------------------- | ------- | ---------------------------------------------- |
| `--bg-page`           |         | Background of the transcript surface.          |
| `--bg-surface`        |         | Background of agent/system bubbles.            |
| `--bg-surface-raised` |         | Background of user bubbles.                    |
| `--fg-default`        |         | Primary text color.                            |
| `--border-default`    |         | Header divider and bubble borders.             |
| `--type-family-body`  |         | Body font family.                              |
| `--type-size-small`   |         | Body font size.                                |
| `--transition-fast`   |         | Transition duration for hover / state changes. |

### CSS Parts

| Name            | Description                                             |
| --------------- | ------------------------------------------------------- |
| `container`     | Outer flex column.                                      |
| `header`        | Sticky header row with the download button.             |
| `download-btn`  | The download icon button.                               |
| `entries`       | Scrollable container for transcript bubbles.            |
| `entry`         | One transcript entry bubble.                            |
| `entry-user`    | Entry bubble when from the user.                        |
| `entry-agent`   | Entry bubble when from the agent.                       |
| `entry-system`  | Entry bubble when from system events.                   |
| `entry-partial` | Bubble while still streaming (\`state === 'partial'\`). |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-transcript-download` | — | User clicked the download button. |

---
