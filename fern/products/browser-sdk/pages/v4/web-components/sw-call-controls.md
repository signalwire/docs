---
title: "sw-call-controls"
slug: "/web-components/sw-call-controls"
---
# `<sw-call-controls>`

Reactive call-control bar that bridges device + call-state context
to the presentational `<sw-ui-control-bar>` primitive.

`sw-call-controls` is the SDK-aware sibling of `<sw-ui-control-bar>`: it
subscribes to `devicesContext` for mic / camera / speaker state and to
`callStateContext` for self-participant capabilities (`screenshare`,
`handraise`, `end`, …) and then forwards the user's intent to the
underlying `Call` and `DeviceController`.

Input precedence (most specific wins): **`.call`** > context.
When `.call` is set, screen-share / hand-raise / hang-up are driven
directly off the call. Mic / camera / speaker toggles always require
`devicesContext`; without it, those buttons render in their default
(unbound) state.

Buttons are auto-hidden when the corresponding capability is absent
from `callState.capabilities` (e.g. `screenshare`, `handraise`, `end`).
Every event from `<sw-ui-control-bar>` bubbles through, so parents can
still listen to `sw-mic-toggle`, `sw-camera-toggle`, `sw-device-change`,
etc., without re-handling them here.

_Class: `SwCallControls` · Module: `packages/web-components/src/components/sw-call-controls.ts`_

## class: `SwCallControls`, `sw-call-controls`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name               | Privacy | Type                | Default | Description                                                   | Inherited From |
| ------------------ | ------- | ------------------- | ------- | ------------------------------------------------------------- | -------------- |
| `call`             |         | `Call \| undefined` |         | Explicit Call — when set, drives call-state actions directly. |                |
| `showScreenShare`  |         | `boolean`           | `true`  |                                                               |                |
| `showHandRaise`    |         | `boolean`           | `true`  |                                                               |                |
| `showTranscript`   |         | `boolean`           | `false` |                                                               |                |
| `transcriptActive` |         | `boolean`           | `false` |                                                               |                |
| `showSettings`     |         | `boolean`           | `true`  |                                                               |                |
| `showFullscreen`   |         | `boolean`           | `true`  |                                                               |                |

### Attributes

| Name                | Field            | Inherited From |
| ------------------- | ---------------- | -------------- |
| `show-screen-share` | showScreenShare  |                |
| `show-hand-raise`   | showHandRaise    |                |
| `show-transcript`   | showTranscript   |                |
| `transcript-active` | transcriptActive |                |
| `show-settings`     | showSettings     |                |
| `show-fullscreen`   | showFullscreen   |                |
| `call`              | call             |                |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-call-hangup` | — | Re-dispatched after the user clicks hang-up so |
| `sw-camera-toggle` | `{ muted: boolean }` | Bubbled from `<sw-ui-control-bar>` |
| `sw-device-change` | `{ kind: 'mic' \| 'camera' \| 'speaker', deviceId: string, label: string }` | Bubbled |
| `sw-fullscreen-toggle` | `{ fullscreen: boolean }` | Bubbled |
| `sw-hand-raise-toggle` | `{ raised: boolean }` | Bubbled |
| `sw-mic-toggle` | `{ muted: boolean }` | Bubbled from `<sw-ui-control-bar>` |
| `sw-screen-share-toggle` | `{ active: boolean }` | Bubbled |
| `sw-settings-change` | `{ settingId: string }` | Bubbled |
| `sw-speaker-toggle` | `{ muted: boolean }` | Bubbled from `<sw-ui-control-bar>` |
| `sw-transcript-toggle` | — | Bubbled when the transcript button is clicked. No detail. |

---
