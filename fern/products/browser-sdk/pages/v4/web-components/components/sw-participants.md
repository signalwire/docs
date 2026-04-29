# `<sw-participants>`

_Class: `Participants` · Module: `packages/web-components/src/components/participants.ts`_

## class: `Participants`, `sw-participants`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name   | Privacy | Type                | Default | Description                                                                   | Inherited From |
| ------ | ------- | ------------------- | ------- | ----------------------------------------------------------------------------- | -------------- |
| `call` |         | `Call \| undefined` |         | Public call property for direct assignment (when not nested in sw-call-media) |                |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-participant-mute-audio` | `{ participantId: string, muted: boolean }` | Fired to toggle a participant's audio |
| `sw-participant-mute-video` | `{ participantId: string, muted: boolean }` | Fired to toggle a participant's video |
| `sw-participant-remove` | `{ participantId: string }` | Fired to remove a participant |

---
