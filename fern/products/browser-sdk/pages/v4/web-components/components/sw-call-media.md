# `<sw-call-media>`

Remote video container. Root context provider for call — wrap all other call components inside it.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `call` | `Call` | — | SDK call object |

## CSS custom properties

| property | default | description |
|----------|---------|-------------|
| `--sw-color-primary` | `#044cf6` | Accent colour |
| `--sw-color-background` | `#000000` | Video background |
| `--sw-border-radius` | `0px` | Corner radius |

## Slots

| slot | description |
|------|-------------|
| *(default)* | Overlaid child components (controls, self-media, etc.) |

## Parts

`container`, `video`
