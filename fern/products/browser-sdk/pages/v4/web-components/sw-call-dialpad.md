---
title: "sw-call-dialpad"
slug: "/web-components/sw-call-dialpad"
---
# `<sw-call-dialpad>`

Context-aware DTMF dialpad — sends tones over the active call when
one exists, otherwise bubbles a `sw-dial` event for the parent to act on
(e.g. as a "start a call to these digits" signal).

Wraps the presentational `<sw-ui-dialpad>` primitive and connects it to
the active call. When `callState.status === 'connected'` (or the
explicit `.call` is connected), each digit press is forwarded to
`call.sendDigits()`. When no call is active, `sw-dial` bubbles up
unchanged so a parent can interpret it as "the user wants to start a
new call to these digits".

Use `show-call-button` to render an inline "Call" button beneath the
keypad, and `allow-text` to permit free-text entry in the display
field — useful for vanity numbers, SIP URIs, or destination addresses.

Input precedence (most specific wins): **`.call` &gt; context**.

_Class: `SwCallDialpad` · Module: `packages/web-components/src/components/sw-call-dialpad.ts`_

## class: `SwCallDialpad`, `sw-call-dialpad`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name             | Privacy | Type                | Default          | Description                                                                  | Inherited From |
| ---------------- | ------- | ------------------- | ---------------- | ---------------------------------------------------------------------------- | -------------- |
| `call`           |         | `Call \| undefined` |                  | Explicit Call — when set, drives DTMF directly and bypasses context.         |                |
| `showCallButton` |         | `boolean`           | `false`          | Whether to display the call button below the keypad.                         |                |
| `allowText`      |         | `boolean`           | `false`          | Allow free-text input in the display field (e.g., SIP URIs, vanity letters). |                |
| `placeholder`    |         | `string`            | `'Enter number'` | Placeholder text shown in the digit display input.                           |                |

### Attributes

| Name               | Field          | Inherited From |
| ------------------ | -------------- | -------------- |
| `show-call-button` | showCallButton |                |
| `allow-text`       | allowText      |                |
| `call`             | call           |                |
| `placeholder`      | placeholder    |                |

### CSS Parts

| Name          | Description                                               |
| ------------- | --------------------------------------------------------- |
| `container`   | Forwarded \`\<sw-ui-dialpad>\` outer container.           |
| `display`     | Forwarded display / input field.                          |
| `keypad`      | Forwarded grid of digit keys.                             |
| `key`         | Forwarded individual digit button.                        |
| `key-pressed` | Forwarded digit button while pressed.                     |
| `call-button` | Forwarded "Call" button (only when \`show-call-button\`). |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-dial` | — | User pressed the call button while no call is connected. |
| `sw-digit-press` | — | A digit was pressed. While the call is connected |

---
