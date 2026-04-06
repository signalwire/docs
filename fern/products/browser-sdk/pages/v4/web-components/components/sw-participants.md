# `<sw-participants>`

Renders positioned overlays for each remote participant. Consumes `callContext`.

## Props

| prop | type | description |
|------|------|-------------|
| `call` | `Call` | Explicit call (overrides context) |

## Events

| event | detail | description |
|-------|--------|-------------|
| `sw-participant-mute-audio` | `{ participant }` | — |
| `sw-participant-mute-video` | `{ participant }` | — |
| `sw-participant-remove` | `{ participant }` | — |

## Slots

| slot | description |
|------|-------------|
| *(default)* | Overlaid content (e.g. `<sw-self-media>`) |
| `controls-{memberId}` | Per-participant control overlay |
