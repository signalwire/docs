# `<one-layout>`

Responsive split layout: video pane + controls bar + animated transcript panel. Switches from side-by-side to stacked below 600 px.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `transcript` | `boolean` | `false` | Open the transcript panel |
| `shadow` | `boolean` | `false` | Apply drop shadow to host |

## Methods

| method | description |
|--------|-------------|
| `toggleTranscript()` | Animates transcript panel open/closed |

## Slots

| slot | description |
|------|-------------|
| `video` | Main video area |
| `background` | Background image/picture behind video |
| `floating-video` | PiP overlay (bottom-right of video) |
| `controls` | Controls bar below video |
| `transcript` | Transcript side panel |

## CSS custom properties

| property | default | description |
|----------|---------|-------------|
| `--transcript-toggle-duration` | `350ms` | Panel animation duration |
| `--transcript-toggle-easing` | `ease-in-out` | Panel animation easing |
| `--transcript-toggle-blackout` | `black` | Overlay colour during transition |
| `--roundness` | `0` | Corner radius |
| `--drop-shadow` | — | Box shadow (when `shadow` is set) |
| `--video-bg-thumb` | — | Blurred background data URI |
| `--video-bg-blur` | `20px` | Background blur radius |
