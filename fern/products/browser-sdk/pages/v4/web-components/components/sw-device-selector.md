# `<sw-device-selector>`

_Class: `DeviceSelector` · Module: `packages/web-components/src/components/device-selector.ts`_

## class: `DeviceSelector`, `sw-device-selector`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name               | Privacy | Type                            | Default | Description                                         | Inherited From |
| ------------------ | ------- | ------------------------------- | ------- | --------------------------------------------------- | -------------- |
| `deviceController` |         | `DeviceController \| undefined` |         | Device controller with observables for device lists |                |
| `showPreview`      |         | `boolean`                       | `false` | Whether to show the preview panel                   |                |

### Attributes

| Name               | Field            | Inherited From |
| ------------------ | ---------------- | -------------- |
| `deviceController` | deviceController |                |
| `show-preview`     | showPreview      |                |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-device-change` | `{ type: DeviceType, device: MediaDeviceInfo }` | Fired when a device selection changes |
| `sw-test-speaker` | — | Fired when the speaker test button is clicked. |

---
