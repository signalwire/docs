# `<sw-participant-controls>`

Per-participant moderation controls: mute, video mute, remove, volume, pin.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `participant` | `ControlParticipant` | — | Participant to control |
| `capabilities` | `string[]` | `[]` | Allowed actions |
| `show-volume` | `boolean` | `false` | Show volume slider |
| `show-pin` | `boolean` | `false` | Show pin button |

## Events

| event | detail | description |
|-------|--------|-------------|
| `sw-participant-mute-audio` | `{ participant, muted }` | — |
| `sw-participant-mute-video` | `{ participant, muted }` | — |
| `sw-participant-remove` | `{ participant }` | — |
| `sw-participant-volume` | `{ participant, volume }` | — |
| `sw-participant-pin` | `{ participant, pinned }` | — |

## CSS custom properties

`--sw-color-primary/hover`, `--sw-color-success/danger/hover`, `--sw-color-warning`, `--sw-color-text/muted/inverse`, `--sw-color-background/hover/active`, `--sw-color-border`, `--sw-font-family`, `--sw-font-size-xs/sm/base`, `--sw-space-1/2/3/4`, `--sw-border-radius`
