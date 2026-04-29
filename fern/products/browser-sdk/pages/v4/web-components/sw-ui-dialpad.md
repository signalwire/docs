---
title: "sw-ui-dialpad"
slug: "/web-components/sw-ui-dialpad"
---
# `<sw-ui-dialpad>`

Presentational 12-key telephone keypad (0-9, *, #) for entering
phone numbers, sending DTMF tones, or capturing free-text destinations.

Pure UI primitive — no call logic, no SDK coupling. Use
`<sw-call-dialpad>` for the SDK-aware version that automatically forwards
digits to an active call.

Each key shows the digit plus the standard ITU-T E.161 letter mapping
(2 → ABC, 3 → DEF, …). Two long-press shortcuts are built in:

- Long-press `0` → inserts `+` (international prefix).
- Long-press the backspace button → clears the entire buffer.

Set `allow-text` to let users type into the display field directly
(useful for SIP URIs or destination addresses that aren't strictly
digits). Set `show-call-button` to render an inline "Call" button.

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

### CSS Properties

| Name                                  | Default                  | Description                      |
| ------------------------------------- | ------------------------ | -------------------------------- |
| `--interactive-button-primary-bg`     | `#044ef4`                | Primary accent color.            |
| `--interactive-button-primary-hover`  | `#0342cf`                | Primary color on hover.          |
| `--interactive-status-success`        | `#22c55e`                | Background of the "Call" button. |
| `--interactive-button-destructive-bg` | `#dc2626`                | Backspace / hangup color.        |
| `--bg-surface`                        | `#181a28`                | Container background.            |
| `--fg-default`                        | `#f0f0f4`                | Digit / display text color.      |
| `--fg-muted`                          | `#a0a0aa`                | Letter-mapping subtext color.    |
| `--border-default`                    | `rgba(255,255,255,0.12)` | Borders & dividers.              |

### CSS Parts

| Name          | Description                                       |
| ------------- | ------------------------------------------------- |
| `container`   | Outer dialpad container.                          |
| `display`     | Number / text display field.                      |
| `keypad`      | Grid of digit keys.                               |
| `key`         | Individual digit button.                          |
| `key-pressed` | Digit button while pressed.                       |
| `call-button` | The call button (only when \`show-call-button\`). |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-dial` | — | The call button was pressed. |
| `sw-dialpad-backspace` | — | Backspace was pressed (or long-pressed to clear). |
| `sw-dialpad-input` | — | Free-text input changed (only when `allow-text` is set). |
| `sw-digit-press` | — | A digit button was pressed. |

---
