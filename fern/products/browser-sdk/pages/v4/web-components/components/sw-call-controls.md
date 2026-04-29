# `<sw-call-controls>`

_Class: `CallControls` · Module: `packages/web-components/src/components/call-controls.ts`_

## class: `CallControls`, `sw-call-controls`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name           | Privacy | Type                            | Default        | Description                                               | Inherited From |
| -------------- | ------- | ------------------------------- | -------------- | --------------------------------------------------------- | -------------- |
| `call`         |         | `CallControlsCall \| undefined` |                | The call object - can be provided via property or context |                |
| `orientation`  |         | `'horizontal' \| 'vertical'`    | `'horizontal'` | Layout orientation: 'horizontal' or 'vertical'.           |                |
| `showTooltips` |         | `boolean`                       | `true`         | Whether to display tooltip labels on buttons.             |                |

### Attributes

| Name            | Field        | Inherited From |
| --------------- | ------------ | -------------- |
| `call`          | call         |                |
| `orientation`   | orientation  |                |
| `show-tooltips` | showTooltips |                |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-hangup` | — | Fired when the hangup button is clicked. |
| `sw-mute-audio` | `{ muted: boolean }` | Fired when the mute audio button is clicked |
| `sw-mute-video` | `{ muted: boolean }` | Fired when the mute video button is clicked |
| `sw-screen-share` | `{ active: boolean }` | Fired when the screen share button is clicked |

---
