---
title: "sw-ui-alert"
slug: "/web-components/sw-ui-alert"
---
# `<sw-ui-alert>`

Modal confirmation / alert dialog primitive built on the native
`<dialog>` element. Resolves a Promise with the user's choice when used
via the companion `showPrompt()` helper.

Two interaction modes are selectable through the reflected `type` attribute:

- `confirm` (default) — renders both **Cancel** and **OK** buttons; the
returned Promise resolves to `true` on accept and `false` on reject /
dialog close.
- `alert` — renders only **OK**; the Promise resolves to `true` once
acknowledged or the dialog is dismissed.

The dialog uses the platform `<dialog>` element so focus management,
ESC-to-dismiss, and `::backdrop` styling all come for free.

_Class: `SwUiAlert` · Module: `packages/web-components/src/components/UI/sw-ui-alert.ts`_

## class: `SwUiAlert`, `sw-ui-alert`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name          | Privacy | Type         | Default     | Description | Inherited From |
| ------------- | ------- | ------------ | ----------- | ----------- | -------------- |
| `title`       |         | `string`     |             |             |                |
| `description` |         | `string`     | `''`        |             |                |
| `type`        |         | `PromptType` | `'confirm'` |             |                |

### Methods

| Name   | Privacy | Description                                                                  | Parameters | Return             | Inherited From |
| ------ | ------- | ---------------------------------------------------------------------------- | ---------- | ------------------ | -------------- |
| `show` |         | Opens the prompt and returns a promise that resolves with the user's choice. |            | `Promise<boolean>` |                |

### Attributes

| Name          | Field       | Inherited From |
| ------------- | ----------- | -------------- |
| `title`       | title       |                |
| `description` | description |                |
| `type`        | type        |                |

### CSS Properties

| Name                                 | Default | Description                            |
| ------------------------------------ | ------- | -------------------------------------- |
| `--type-family-body`                 |         | Dialog font family.                    |
| `--radius-md`                        |         | Dialog border radius.                  |
| `--shadow-md`                        |         | Dialog drop shadow.                    |
| `--interactive-button-primary-bg`    |         | Background color of the accept button. |
| `--interactive-button-primary-hover` |         | Hover background of the accept button. |

### Slots

| Name | Description                                                                                           |
| ---- | ----------------------------------------------------------------------------------------------------- |
|      | Default slot for rich body content. When non-empty, takes priority over the \`description\` property. |

---

## Functions

| Name         | Description                                                   | Parameters                                                                   | Return             |
| ------------ | ------------------------------------------------------------- | ---------------------------------------------------------------------------- | ------------------ |
| `showPrompt` | Programmatically show a prompt and await the user's response. | `options: { title: string; description?: string; type?: PromptType; }` | `Promise<boolean>` |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-ui-alert-accept` | — | User clicked OK / accepted. No detail. |
| `sw-ui-alert-reject` | — | User clicked Cancel, closed via ESC, or |

---
