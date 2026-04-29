# `<sw-click-to-call>`

_Class: `ClickToCallComponent` · Module: `packages/web-components/src/components/click-to-call.ts`_

## class: `ClickToCallComponent`, `sw-click-to-call`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name          | Privacy | Type                        | Default  | Description                              | Inherited From |
| ------------- | ------- | --------------------------- | -------- | ---------------------------------------- | -------------- |
| `client`      |         | `ClickToCallClient \| null` | `null`   | Client for initiating calls (SignalWire) |                |
| `destination` |         | `string`                    | `''`     | Destination address to call              |                |
| `label`       |         | `string`                    | `'Call'` | Button label when idle                   |                |
| `audioOnly`   |         | `boolean`                   | `true`   | Audio-only mode (no video)               |                |

### Attributes

| Name          | Field       | Inherited From |
| ------------- | ----------- | -------------- |
| `destination` | destination |                |
| `label`       | label       |                |
| `audio-only`  | audioOnly   |                |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-dial` | `{ destination: string }` | Fired when a call is initiated |
| `sw-hangup` | — | Fired when the hangup button is clicked. |
| `sw-mute-toggle` | `{ muted: boolean }` | Fired when the mute button is toggled |

---
