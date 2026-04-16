# `<sw-call-controls>`

Bridges `devicesContext` + `callStateContext` → `<sw-ui-control-bar>`. The settings dropdown (echo cancellation, auto-gain, noise suppression) is always rendered — toggles are wired through `devicesContext`.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `show-screen-share` | `boolean` | `true` | Show screen share button |
| `show-hand-raise` | `boolean` | `true` | Show hand raise button |
| `show-transcript` | `boolean` | `false` | Show transcript toggle |
| `transcript-active` | `boolean` | `false` | Transcript panel state |

## Events

| event | detail | description |
|-------|--------|-------------|
| `sw-hang-up` | `void` | Hangup pressed |
| `sw-fullscreen-toggle` | `{ fullscreen }` | Fullscreen toggled |
| `sw-transcript-toggle` | `void` | Transcript toggle pressed |
