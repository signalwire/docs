---
title: "sw-participants"
slug: "/web-components/sw-participants"
---
# `<sw-participants>`

Renders one absolutely-positioned overlay tile per remote
participant in the MCU layout, plus per-participant menu hooks.

Subscribes to `call.layoutLayers$` and `call.participants$` and renders
a `<div>` for each layer whose `member_id` matches a remote participant
(the local user is excluded — use `<sw-self-media>` for that). Each
overlay is positioned via percentage `top` / `left` / `width` / `height`,
so it tracks the MCU layout exactly as the renderer sees it.

Each tile also exposes a small "⋯" menu trigger in its top-left corner.
Clicking it opens a popover whose content is provided by a **named slot**
keyed on the participant's id: `controls-${memberId}`. Drop a
`<sw-participant-controls>` (or any UI of your choosing) into that slot
to expose mute / volume / pin / remove actions for that participant only.

Input precedence (most specific wins): **`.call` &gt; context**.
Mounting `<sw-participants>` outside `<sw-call-media>` is allowed but
usually you want it to overlay the remote video, so it should live
inside the default slot of `<sw-call-media>`.

_Class: `SwParticipants` · Module: `packages/web-components/src/components/sw-participants.ts`_

## class: `SwParticipants`, `sw-participants`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name   | Privacy | Type                | Default | Description                                                         | Inherited From |
| ------ | ------- | ------------------- | ------- | ------------------------------------------------------------------- | -------------- |
| `call` |         | `Call \| undefined` |         | Explicit Call — when set, subscribes directly and bypasses context. |                |

### Attributes

| Name   | Field | Inherited From |
| ------ | ----- | -------------- |
| `call` | call  |                |

### Slots

| Name                  | Description                                                                                                                                    |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
|                       | Default slot for any overlay content rendered above the tiles.                                                                                 |
| `controls-{memberId}` | Replace \`\{memberId\}\` with a participant's \`member\_id\` to inject the popover content shown when that participant's "⋯" trigger is clicked. |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-participant-mute-audio` | — | User muted/unmuted a participant's audio. |
| `sw-participant-mute-video` | — | User muted/unmuted a participant's video. |
| `sw-participant-remove` | — | User removed a participant from the call. |

---
