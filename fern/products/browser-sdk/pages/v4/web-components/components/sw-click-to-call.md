# `<sw-click-to-call>`

Single-button widget that dials on click and shows mute/hangup once connected.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `client` | `ClickToCallClient` | — | Initialised SignalWire client |
| `destination` | `string` | — | Address to dial |
| `label` | `string` | `'Call'` | Button label |
| `audio-only` | `boolean` | `false` | Disable video |

## Events

| event | detail | description |
|-------|--------|-------------|
| `sw-dial` | `{ destination }` | Call initiated |
| `sw-hangup` | — | Call ended |
| `sw-mute-toggle` | `{ muted: boolean }` | Mute toggled |

## CSS custom properties

`--sw-color-primary/hover`, `--sw-color-success/hover`, `--sw-color-danger/hover`, `--sw-color-warning`, `--sw-color-text/muted/inverse`, `--sw-color-background/hover`, `--sw-color-border`, `--sw-font-family`, `--sw-font-size-sm/base/lg`, `--sw-space-1/2/3/4`, `--sw-border-radius`, `--sw-border-radius-full`
