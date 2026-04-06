# `<sw-modal>`

Wraps a native `<dialog>` with bounce-in/out animations and body scroll lock.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `open` | `boolean` | `false` | Show/hide the dialog |

## Slots

| slot | description |
|------|-------------|
| *(default)* | Dialog content |

## CSS custom properties

| property | default |
|----------|---------|
| `--modal-animation` | `bounce-in 200ms ease-out` |
| `--modal-close-animation` | `bounce-out 200ms ease-out` |
| `--modal-backdrop-animation` | `backdrop-in 200ms ease-out` |
| `--modal-backdrop-close-animation` | `backdrop-out 200ms ease-out` |
