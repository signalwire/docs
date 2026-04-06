# `<sw-call-widget>`

All-in-one call widget. Handles client init, dialling, media, controls, and optional AI transcript. Works inline or in a modal overlay.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `token` | `string` | `''` | SignalWire SAT or embed token (`c2c_` / `c2t_`) |
| `host` | `string` | `''` | Server host (defaults to `embeds.signalwire.com`) |
| `destination` | `string` | `''` | Call destination address |
| `modal` | `boolean` | `false` | Render in a `<sw-modal>` overlay |
| `transcription` | `boolean` | `false` | Show AI transcript panel |

## Methods

| method | description |
|--------|-------------|
| `dial()` | Imperatively start a call (also triggered by clicking a slotted element) |

## Events

| event | detail | description |
|-------|--------|-------------|
| `user_event` | signaling payload | Forwarded `user_event` from the signaling stream |

## Slots

| slot | description |
|------|-------------|
| *(default)* | Trigger element (button) — click starts the call / opens modal |

## CSS custom properties

All `--ctrl-*` tokens are set on `:host` and inherited by inner controls. Override any of them to retheme the entire widget.

| property | default |
|----------|---------|
| `--ctrl-size` | `40px` |
| `--ctrl-bg` | `rgba(255,255,255,0.12)` |
| `--ctrl-active-bg` | `#ef4444` |
| `--ctrl-primary-bg` | `#044cf6` |
| `--ctrl-danger-bg` | `#ef4444` |
| `--ctrl-menu-bg` | `#1a1a2a` |
