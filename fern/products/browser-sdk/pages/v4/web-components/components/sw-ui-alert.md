# `<sw-ui-alert>`

Confirmation/alert prompt dialog

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

### Slots

| Name          | Description                                          |
| ------------- | ---------------------------------------------------- |
| `description` | content (falls back to the \`description\` property) |

---

## Functions

| Name         | Description                                                   | Parameters                                                                   | Return             |
| ------------ | ------------------------------------------------------------- | ---------------------------------------------------------------------------- | ------------------ |
| `showPrompt` | Programmatically show a prompt and await the user's response. | `options: { title: string; description?: string; type?: PromptType; }` | `Promise<boolean>` |

---
