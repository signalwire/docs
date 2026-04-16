# `<sw-ui-call-layout>`

Fluid grid layout. Aspect-ratio-driven (side transcript on landscape, bottom on portrait).

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `transcript` | `boolean` | `false` | Show transcript pane |
| `loading` | `boolean` | `false` | Show spinner overlay |
| `shadow` | `boolean` | `false` | Drop shadow |

## Methods

| method | description |
|--------|-------------|
| `toggleTranscript()` | Toggle transcript panel |
| `toggleFullscreen()` | Toggle fullscreen |

## Slots

| slot | description |
|------|-------------|
| `video` | Remote video |
| `background` | Background image |
| `floating-video` | PiP overlay |
| `controls` | Control bar |
| `transcript` | Transcript panel |

## CSS custom properties

| property | default |
|----------|---------|
| `--roundness` | `var(--sw-radius)` |
| `--pip-width` | `clamp(80px, 20%, 200px)` |
| `--pip-bottom` | `12px` |
| `--pip-right` | `12px` |
