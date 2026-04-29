---
title: "sw-ui-icon"
slug: "/web-components/sw-ui-icon"
---
# `<sw-ui-icon>`

Inline SVG icon component backed by a curated icon set.

Picks an SVG out of the bundled `ICONS` map (raw `import` of `.svg`
files in this folder) by name and renders it inline so it inherits
`color` from its host — use `currentColor` in your stylesheets to tint
the icon. Width and height are written into the SVG markup at render
time using the `size` property so layout doesn't depend on extra CSS.

The full set of available names is exported as the `IconName` type.
Unknown names render nothing rather than throwing.

_Class: `SwUiIcon` · Module: `packages/web-components/src/components/UI/icons/sw-ui-icon.ts`_

## class: `SwUiIcon`, `sw-ui-icon`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name   | Privacy | Type       | Default   | Description | Inherited From |
| ------ | ------- | ---------- | --------- | ----------- | -------------- |
| `name` |         | `IconName` | `'close'` |             |                |
| `size` |         | `number`   | `24`      |             |                |

### Attributes

| Name   | Field | Inherited From |
| ------ | ----- | -------------- |
| `name` | name  |                |
| `size` | size  |                |

---
