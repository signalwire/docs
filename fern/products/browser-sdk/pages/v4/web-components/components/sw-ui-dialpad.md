# `<sw-ui-dialpad>`

_Class: `SwUiDialpad` · Module: `packages/web-components/src/components/UI/controls/sw-ui-dialpad.ts`_

## class: `SwUiDialpad`, `sw-ui-dialpad`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name             | Privacy | Type      | Default          | Description                                                                                                           | Inherited From |
| ---------------- | ------- | --------- | ---------------- | --------------------------------------------------------------------------------------------------------------------- | -------------- |
| `showCallButton` |         | `boolean` | `false`          | Whether to display the call button below the keypad.                                                                  |                |
| `allowText`      |         | `boolean` | `false`          | Allow free-text input in the display field (e.g., SIP URIs, vanity letters). Keypad buttons still append DTMF digits. |                |
| `placeholder`    |         | `string`  | `'Enter number'` | Placeholder text shown in the digit display input.                                                                    |                |

### Attributes

| Name               | Field          | Inherited From |
| ------------------ | -------------- | -------------- |
| `show-call-button` | showCallButton |                |
| `allow-text`       | allowText      |                |
| `placeholder`      | placeholder    |                |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-dial` | `{ digits: string }` | Fired when the call button is pressed |
| `sw-dialpad-backspace` | `{ digits: string }` | Fired when the backspace button is pressed |
| `sw-dialpad-input` | `{ digits: string }` | Fired when free-text input changes (only when `allow-text` is set) |
| `sw-digit-press` | `{ digit: string, digits: string }` | Fired when a digit button is pressed |

---
