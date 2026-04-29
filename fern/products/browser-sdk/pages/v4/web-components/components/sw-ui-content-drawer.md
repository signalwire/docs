# `<sw-ui-content-drawer>`

Content drawer overlay for the call widget.

Slides in from the right on wide containers; on narrow containers (parent
width ≤ 480 px) it slides up from the bottom instead.

Formats: `text` · `markdown` (marked + DOMPurify) · `code` (Prism) · `html` (DOMPurify)

_Class: `SwUiContentDrawer` · Module: `packages/web-components/src/components/UI/layout/sw-ui-content-drawer.ts`_

## class: `SwUiContentDrawer`, `sw-ui-content-drawer`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name       | Privacy | Type            | Default  | Description | Inherited From |
| ---------- | ------- | --------------- | -------- | ----------- | -------------- |
| `open`     |         | `boolean`       | `false`  |             |                |
| `narrow`   |         | `boolean`       | `false`  |             |                |
| `title`    |         | `string`        | `''`     |             |                |
| `content`  |         | `string`        | `''`     |             |                |
| `format`   |         | `ContentFormat` | `'text'` |             |                |
| `language` |         | `string`        | `''`     |             |                |

### Attributes

| Name       | Field    | Inherited From |
| ---------- | -------- | -------------- |
| `open`     | open     |                |
| `narrow`   | narrow   |                |
| `title`    | title    |                |
| `content`  | content  |                |
| `format`   | format   |                |
| `language` | language |                |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-content-drawer-close` | — | User clicked the close button. No detail. |

---
