# `<sw-transcript-view>`

Renders AI transcript bubbles. Consumes `transcriptContext` — must be inside a host that uses `TranscriptController`.

## Props

None.

## Behaviour

- User bubbles right-aligned (blue), agent bubbles left-aligned (grey)
- Partial entries shown at reduced opacity
- New entries animate in with a scale pop
- Auto-scrolls to bottom when near the bottom

## CSS parts

| part | description |
|------|-------------|
| `messages` | Scrollable message container |
| `bubble` | Any message bubble |
| `bubble-user` | User bubble |
| `bubble-agent` | Agent bubble |
