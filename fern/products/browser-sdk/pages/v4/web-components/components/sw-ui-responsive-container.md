---
title: "sw-ui-responsive-container"
slug: "/web-components/sw-ui-responsive-container"
---
# `<sw-ui-responsive-container>`

Aspect-ratio-aware sizing wrapper used to host call surfaces
inside `<sw-ui-modal>` so the experience adapts gracefully from
ultra-wide monitors down to phones.

Applies a tiered set of CSS rules based on viewport size:

- **≥ 1280 px** (large monitors): 80 vw, 16:9 aspect, height capped at
`(width × 9 / 16) + 300 px` to leave room for controls.
- **600 px – 1279 px** (laptops, small monitors): 90 vw, same 16:9 baseline.
- **≤ 600 px** (mobile portrait): 100 vw minus a 20 px gutter, fluid
height up to 85 svh — drops the strict aspect ratio so portrait
content fills the screen.
- **≤ 500 px tall, ≥ 600 px wide** (landscape phones, short windows):
90 vw, 90 vh max, aspect ratio relaxed.

_Class: `SwUiResponsiveContainer` · Module: `packages/web-components/src/components/UI/layout/sw-ui-responsive-container.ts`_

## class: `SwUiResponsiveContainer`, `sw-ui-responsive-container`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Slots

| Name | Description                                                    |
| ---- | -------------------------------------------------------------- |
|      | Default slot for the content the container should size around. |

---
