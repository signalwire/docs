# `<sw-participant-controls>`

_Class: `ParticipantControlsComponent` · Module: `packages/web-components/src/components/participant-controls.ts`_

## class: `ParticipantControlsComponent`, `sw-participant-controls`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name           | Privacy | Type                         | Default | Description                                       | Inherited From |
| -------------- | ------- | ---------------------------- | ------- | ------------------------------------------------- | -------------- |
| `participant`  |         | `ControlParticipant \| null` | `null`  | Participant object to control                     |                |
| `capabilities` |         | `string[]`                   | `[]`    | Available capabilities (actions user can perform) |                |
| `showVolume`   |         | `boolean`                    | `false` | Whether to show volume slider                     |                |
| `showPin`      |         | `boolean`                    | `false` | Whether to show pin/spotlight button              |                |

### Attributes

| Name          | Field      | Inherited From |
| ------------- | ---------- | -------------- |
| `show-volume` | showVolume |                |
| `show-pin`    | showPin    |                |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-participant-mute-audio` | `{ participantId: string, muted: boolean }` | Fired to toggle a participant's audio |
| `sw-participant-mute-video` | `{ participantId: string, muted: boolean }` | Fired to toggle a participant's video |
| `sw-participant-pin` | `{ participantId: string, pinned: boolean }` | Fired to pin/unpin a participant |
| `sw-participant-remove` | `{ participantId: string }` | Fired to remove a participant |
| `sw-participant-volume` | `{ participantId: string, volume: number }` | Fired when a participant's volume changes |

---
