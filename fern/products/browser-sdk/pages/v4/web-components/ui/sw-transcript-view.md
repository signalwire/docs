# `<sw-ui-transcript-view>`

Scrollable chat-bubble list with auto-scroll.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `entries` | `TranscriptEntry[]` | `[]` | Transcript entries to display |
| `header` | `string` | `'Transcript'` | Panel header text |
| `empty-text` | `string` | `'Transcript will appear here'` | Placeholder when no entries |

## CSS parts

| part | description |
|------|-------------|
| `header` | Panel header |
| `messages` | Scrollable message container |
| `bubble` | Any message bubble |
