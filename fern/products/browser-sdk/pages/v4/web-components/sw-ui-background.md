---
title: "sw-ui-background"
slug: "/web-components/sw-ui-background"
---
# `<sw-ui-background>`

Decorative full-bleed background that progressively reveals a
high-resolution image — a blurred thumbnail shows immediately, then
crossfades to the full image once it has finished loading.

The component owns two stacked layers:

1. A blurred-thumbnail layer driven by a `data:` URL (small, encoded
inline) so something visible paints on first frame.
2. An `<img>` that crossfades in (`opacity: 0 → 1`, slight `transform: scale`
settle) when its `load` event fires.

Set `default` to use the built-in SignalWire brand background; otherwise
supply your own `thumbnail` (data URL) and `src` (full image URL).
Designed to be slotted into `<sw-ui-call-layout>`'s `background` slot or
`<sw-call-widget>`'s `background` slot.

_Class: `SwUiBackground` · Module: `packages/web-components/src/components/UI/layout/sw-ui-background.ts`_

## class: `SwUiBackground`, `sw-ui-background`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name         | Privacy | Type                  | Default  | Description | Inherited From |
| ------------ | ------- | --------------------- | -------- | ----------- | -------------- |
| `default`    |         | `boolean`             | `false`  |             |                |
| `thumbnail`  |         | `string \| undefined` |          |             |                |
| `src`        |         | `string \| undefined` |          |             |                |
| `blurAmount` |         | `string`              | `'20px'` |             |                |

### Attributes

| Name          | Field      | Inherited From |
| ------------- | ---------- | -------------- |
| `default`     | default    |                |
| `thumbnail`   | thumbnail  |                |
| `src`         | src        |                |
| `blur-amount` | blurAmount |                |

### CSS Parts

| Name    | Description                                                     |
| ------- | --------------------------------------------------------------- |
| `thumb` | The blurred low-res thumbnail layer (initially visible).        |
| `image` | The full-resolution \`\<img>\` layer that fades in once loaded. |

---
