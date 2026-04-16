# `<sw-call-widget>`

All-in-one call widget. Creates client, manages call lifecycle, and provides `callStateContext`, `devicesContext`, and `transcriptContext` to all descendants. Works inline or in a modal overlay.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `token` | `string` | `''` | SAT or embed token |
| `host` | `string` | `''` | Server host |
| `destination` | `string` | `''` | Call destination |
| `modal` | `boolean` | `false` | Render in modal overlay |
| `transcription` | `boolean` | `false` | Show transcript panel |
| `user-events` | `boolean` | `false` | Inject AI `user_event` payloads (links, code) into transcript |
| `allow-incoming-calls` | `boolean` | `false` | Listen for inbound calls and prompt to accept/reject |

## Methods

| method | description |
|--------|-------------|
| `dial()` | Initiate call |
| `hangup()` | End call |

## Slots

| slot | description |
|------|-------------|
| `background` | Background element (e.g. `<sw-ui-background>`) |
| *(default)* | Trigger element (click to dial) |
