---
title: "sw-participant-controls"
slug: "/web-components/sw-participant-controls"
---
# `<sw-participant-controls>`

Per-participant action panel — mute / unmute audio & video,
adjust volume, pin / unpin, and remove a single participant from the call.

Identifies the target participant from the `participant-id` attribute by
looking it up in `callState.participants` (or in the live `Call` when
`.call` is set). Available actions are gated by the call's
`capabilities` list — for instance, "Remove" only renders when the
server has granted the `end_member` (or equivalent) capability to the
local user, and audio/video mute toggles require `member_mute` / etc.

Designed to be slotted into `<sw-participants>`'s
`controls-${memberId}` named slot, but it works standalone anywhere you
have a `participant-id`.

Input precedence (most specific wins): **`.call` &gt; context**.

_Class: `SwParticipantControls` · Module: `packages/web-components/src/components/sw-participant-controls.ts`_

## class: `SwParticipantControls`, `sw-participant-controls`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name            | Privacy | Type                | Default | Description                                                         | Inherited From |
| --------------- | ------- | ------------------- | ------- | ------------------------------------------------------------------- | -------------- |
| `participantId` |         | `string`            | `''`    |                                                                     |                |
| `showVolume`    |         | `boolean`           | `false` |                                                                     |                |
| `showPin`       |         | `boolean`           | `false` |                                                                     |                |
| `call`          |         | `Call \| undefined` |         | Explicit Call — when set, subscribes directly and bypasses context. |                |

### Attributes

| Name             | Field         | Inherited From |
| ---------------- | ------------- | -------------- |
| `participant-id` | participantId |                |
| `show-volume`    | showVolume    |                |
| `show-pin`       | showPin       |                |
| `call`           | call          |                |

### CSS Properties

| Name                                     | Default | Description                                  |
| ---------------------------------------- | ------- | -------------------------------------------- |
| `--bg-page`                              |         | Panel background.                            |
| `--bg-surface`                           |         | Hover background for action buttons.         |
| `--bg-surface-raised`                    |         | Active/pressed button background.            |
| `--fg-default`                           |         | Foreground text & icon color.                |
| `--border-default`                       |         | Border between sections.                     |
| `--radius-md`                            |         | Panel border radius.                         |
| `--shadow-md`                            |         | Panel drop shadow.                           |
| `--type-family-body`                     |         | Body font family.                            |
| `--type-size-small`                      |         | Body font size.                              |
| `--interactive-button-destructive-bg`    |         | Background for the "Remove" button.          |
| `--interactive-button-destructive-hover` |         | Hover background for "Remove".               |
| `--transition-fast`                      |         | Transition duration for hover/active states. |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-participant-mute-audio` | — | Audio mute toggled. |
| `sw-participant-mute-video` | — | Video mute toggled. |
| `sw-participant-pin-toggle` | — | Pin / unpin clicked. |
| `sw-participant-remove` | — | Remove-from-call clicked. |
| `sw-participant-volume-change` | — | Volume slider released. |

---
