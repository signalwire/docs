# `<sw-ui-control-bar>`

Call controls bar.

Buttons rendered (left to right): mic, camera, speaker, screen share,
hand raise, transcript, fullscreen, hang-up. Optional buttons are hidden
when their `show*` property is false.

_Class: `SwUiControlBar` · Module: `packages/web-components/src/components/UI/controls/sw-ui-control-bar.ts`_

## class: `SwUiControlBar`, `sw-ui-control-bar`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name               | Privacy | Type           | Default | Description | Inherited From |
| ------------------ | ------- | -------------- | ------- | ----------- | -------------- |
| `micMuted`         |         | `boolean`      | `false` |             |                |
| `cameraMuted`      |         | `boolean`      | `false` |             |                |
| `speakerMuted`     |         | `boolean`      | `false` |             |                |
| `fullscreen`       |         | `boolean`      | `false` |             |                |
| `screenSharing`    |         | `boolean`      | `false` |             |                |
| `handRaised`       |         | `boolean`      | `false` |             |                |
| `transcriptActive` |         | `boolean`      | `false` |             |                |
| `showScreenShare`  |         | `boolean`      | `false` |             |                |
| `showHandRaise`    |         | `boolean`      | `false` |             |                |
| `showTranscript`   |         | `boolean`      | `false` |             |                |
| `showSettings`     |         | `boolean`      | `false` |             |                |
| `showFullscreen`   |         | `boolean`      | `true`  |             |                |
| `micDevices`       |         | `DropUpItem[]` | `[]`    |             |                |
| `cameraDevices`    |         | `DropUpItem[]` | `[]`    |             |                |
| `speakerDevices`   |         | `DropUpItem[]` | `[]`    |             |                |
| `settingsItems`    |         | `DropUpItem[]` | `[]`    |             |                |

### Attributes

| Name                | Field            | Inherited From |
| ------------------- | ---------------- | -------------- |
| `mic-muted`         | micMuted         |                |
| `camera-muted`      | cameraMuted      |                |
| `speaker-muted`     | speakerMuted     |                |
| `fullscreen`        | fullscreen       |                |
| `screen-sharing`    | screenSharing    |                |
| `hand-raised`       | handRaised       |                |
| `transcript-active` | transcriptActive |                |
| `show-screen-share` | showScreenShare  |                |
| `show-hand-raise`   | showHandRaise    |                |
| `show-transcript`   | showTranscript   |                |
| `show-settings`     | showSettings     |                |
| `show-fullscreen`   | showFullscreen   |                |

### CSS Properties

| Name                               | Default | Description                                                                                                                                      |
| ---------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `--sw-control-bar-bg`              |         | \[transparent]             - bar background                                                                                                      |
| `--sw-control-bar-padding`         |         | \[8px 16px]                - bar padding                                                                                                         |
| `--sw-control-bar-gap`             |         | \[8px]                     - gap between buttons                                                                                                 |
| `--sw-control-bar-radius`          |         | \[0]                       - bar border-radius                                                                                                   |
| `--sw-split-button-size`           |         | \[44px]                    - button width & height                                                                                               |
| `--sw-split-button-bg`             |         | \[rgba(255,255,255,0.12)]  - button background                                                                                                   |
| `--sw-split-button-bg-hover`       |         | \[rgba(255,255,255,0.22)]  - button hover bg                                                                                                     |
| `--sw-split-button-color`          |         | \[#fff]                    - icon colour                                                                                                         |
| `--sw-split-button-radius`         |         | \[9999px]                  - button border-radius                                                                                                |
| `--sw-control-bar-hangup-bg`       |         | hang-up background       (falls back to --interactive-button-destructive-bg)                                                                     |
| `--sw-control-bar-hangup-bg-hover` |         | hang-up hover bg          (falls back to --interactive-button-destructive-hover)                                                                 |
| `--sw-control-bar-hangup-color`    |         | hang-up icon colour       (defaults to #fff) The active-toggle variant uses --interactive-button-primary-\{bg,hover,text\} from the design tokens. |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-call-hangup` | — | Hang-up button clicked. No detail. |
| `sw-camera-toggle` | `{ muted: boolean }` | Camera toggled |
| `sw-device-change` | `{ kind, deviceId, label }` | Device picked from a chevron menu |
| `sw-fullscreen-toggle` | `{ fullscreen: boolean }` | Fullscreen toggled |
| `sw-hand-raise-toggle` | `{ raised: boolean }` | Hand raise toggled |
| `sw-mic-toggle` | `{ muted: boolean }` | Mic toggled |
| `sw-screen-share-toggle` | `{ active: boolean }` | Screen share toggled |
| `sw-settings-change` | `{ settingId: string }` | Settings menu item picked |
| `sw-speaker-toggle` | `{ muted: boolean }` | Speaker toggled |
| `sw-transcript-toggle` | — | Transcript button clicked. No detail. |
| `type` | — | — |

---
