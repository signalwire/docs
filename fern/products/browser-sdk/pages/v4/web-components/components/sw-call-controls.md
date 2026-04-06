# `<sw-call-controls>`

Mute audio, mute video, screen share, and hangup buttons. Accepts `call` as a prop **or** auto-consumes it from a parent `<sw-call-media>` context.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `call` | `CallControlsCall` | — | Explicit call object (overrides context) |
| `orientation` | `'horizontal' \| 'vertical'` | `'horizontal'` | Bar layout direction |
| `respect-capabilities` | `boolean` | `false` | When `true`, gates buttons on server capabilities |

## Events

| event | detail | description |
|-------|--------|-------------|
| `sw-mute-audio` | `{ muted: boolean }` | Audio toggle |
| `sw-mute-video` | `{ muted: boolean }` | Video toggle |
| `sw-screen-share` | `{ active: boolean }` | Screen share toggle |
| `sw-hangup` | — | Hangup pressed |

## CSS custom properties

| property | description |
|----------|-------------|
| `--sw-ctrl-gap` | Gap between buttons (default `8px`) |
| `--sw-ctrl-padding` | Bar padding (default `10px 14px`) |
| `--sw-ctrl-background` | Bar background (default `transparent`) |
| `--ctrl-*` | All primitive ctrl tokens (size, colours, menu) — see [ctrl tokens](../ui/sw-ctrl-button.md) |

## Parts

`bar`, `toggle-audio`, `toggle-video`, `toggle-screen-share`, `btn-hangup`
