# `<sw-dialpad>`

DTMF keypad with optional call button.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `call` | `DialpadCall` | — | Active call for sending DTMF |
| `show-call-button` | `boolean` | `false` | Show a dial/hangup action button |
| `placeholder` | `string` | — | Input placeholder text |

## Events

| event | detail | description |
|-------|--------|-------------|
| `sw-digit-press` | `{ digit, digits }` | Key pressed |
| `sw-backspace` | `{ digits }` | Backspace pressed |
| `sw-dial` | `{ digits }` | Call button pressed |

## CSS custom properties

`--sw-color-primary/hover`, `--sw-color-success/danger`, `--sw-color-text/muted`, `--sw-color-border`, `--sw-color-background/hover/active`, `--sw-font-family`, `--sw-font-size-sm/base/lg/xl`, `--sw-border-radius`, `--sw-border-radius-full`
