# `<sw-ui-background>`

Video background with a blurred thumbnail placeholder that crossfades into
the full-resolution image once it has finished loading.

Slot this into `sw-ui-call-layout`'s `background` slot.

_Class: `SwUiBackground` · Module: `packages/web-components/src/components/UI/layout/sw-ui-background.ts`_

## class: `SwUiBackground`, `sw-ui-background`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name         | Privacy | Type      | Default  | Description                                              | Inherited From |
| ------------ | ------- | --------- | -------- | -------------------------------------------------------- | -------------- |
| `default`    |         | `boolean` | `false`  | Use the built-in SignalWire background image             |                |
| `thumbnail`  |         | `string`  |          | Data URL shown immediately as a blurred preview          |                |
| `src`        |         | `string`  |          | URL of the full-resolution background image              |                |
| `blurAmount` |         | `string`  | `'20px'` | CSS blur amount applied to the thumbnail (default: 20px) |                |

### Attributes

| Name          | Field      | Inherited From |
| ------------- | ---------- | -------------- |
| `default`     | default    |                |
| `thumbnail`   | thumbnail  |                |
| `src`         | src        |                |
| `blur-amount` | blurAmount |                |

### CSS Parts

| Name    | Description                                         |
| ------- | --------------------------------------------------- |
| `thumb` | Blurred low-res thumbnail layer.                    |
| `image` | Full-resolution image layer (fades in once loaded). |

---
