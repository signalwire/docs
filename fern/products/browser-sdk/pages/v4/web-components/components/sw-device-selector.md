---
title: "sw-device-selector"
slug: "/web-components/sw-device-selector"
---
# `<sw-device-selector>`

Single-button popover that lets the user pick microphone, camera,
and speaker devices, with optional live preview of each.

The trigger renders as a small icon button; clicking it opens a panel
with three sections (Microphone, Camera, Speaker), each populated from
the corresponding observable on the bound `DeviceController`:
`audioInputDevices$`, `videoInputDevices$`, `audioOutputDevices$`. The
currently selected device is read from
`selectedAudio[Input|Output]Device$` / `selectedVideoInputDevice$`.

When `show-preview` is set, the open panel also renders:

- A live camera preview powered by `<sw-local-camera>` for the selected
video input.
- A real-time microphone level meter (`<sw-audio-level>`) for the
selected audio input.
- A "Test speaker" button that plays a short tone through the selected
audio output (uses `setSinkId()` where supported).

Streams are acquired only while the popover is open and stopped as soon
as it closes — no permanent media access. The popover closes on outside
click via a `composedPath()`-aware document listener.

_Class: `SwDeviceSelector` · Module: `packages/web-components/src/components/sw-device-selector/sw-device-selector.ts`_

## class: `SwDeviceSelector`, `sw-device-selector`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name               | Privacy | Type                            | Default | Description                                                                                                                                                                                       | Inherited From |
| ------------------ | ------- | ------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| `deviceController` |         | `DeviceController \| undefined` |         |                                                                                                                                                                                                   |                |
| `showPreview`      |         | `boolean`                       | `false` | Render inline previews (camera video, mic level, speaker test) inside&#xA;each section while the panel is open. Streams are acquired only while&#xA;the panel is open and stopped when it closes. |                |

### Attributes

| Name               | Field            | Inherited From |
| ------------------ | ---------------- | -------------- |
| `show-preview`     | showPreview      |                |
| `deviceController` | deviceController |                |

### CSS Properties

| Name                  | Default | Description                                           |
| --------------------- | ------- | ----------------------------------------------------- |
| `--ctrl-bg`           |         | Background color of the trigger button.               |
| `--ctrl-bg-hover`     |         | Background color on hover.                            |
| `--ctrl-color`        |         | Foreground (icon + text) color.                       |
| `--ctrl-radius`       |         | Trigger button border radius.                         |
| `--bg-surface`        |         | Popover panel background.                             |
| `--bg-surface-raised` |         | Popover row hover background.                         |
| `--border-default`    |         | Popover borders & dividers.                           |
| `--fg-default`        |         | Primary text color inside the panel.                  |
| `--fg-muted`          |         | Secondary text color (device sub-labels, kind hints). |
| `--radius-md`         |         | Panel border radius.                                  |
| `--shadow-md`         |         | Panel drop shadow.                                    |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-device-change` | — | User picked a device from one of the dropdowns. |

---
