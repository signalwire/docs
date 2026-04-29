---
title: "sw-ui-dropup"
slug: "/web-components/sw-ui-dropup"
---
# `<sw-ui-dropup>`

Tiny pop-up menu that opens **above** its anchor and closes on
outside click — the building block used for the chevron menus inside
`<sw-ui-split-button>` (mic / camera / speaker selectors).

Items are supplied as a JSON-encoded array on the `items` attribute (or
the `items` property). Each entry is either a string (used as both
label and id) or a `DropUpItem` object — `{ label, id, selected? }`.
Clicking an item dispatches `sw-dropup-select` with that entry as the
`detail` and closes the menu. Any click outside the host dispatches
`sw-dropup-close`.

_Class: `SwUiDropup` · Module: `packages/web-components/src/components/UI/controls/sw-ui-dropup.ts`_

## class: `SwUiDropup`, `sw-ui-dropup`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name     | Privacy | Type                          | Default | Description | Inherited From |
| -------- | ------- | ----------------------------- | ------- | ----------- | -------------- |
| `items`  |         | `Array<DropUpItem \| string>` | `[]`    |             |                |
| `open`   |         | `boolean`                     | `false` |             |                |
| `anchor` |         | `Element \| undefined`        |         |             |                |

### Attributes

| Name    | Field | Inherited From |
| ------- | ----- | -------------- |
| `open`  | open  |                |
| `items` | items |                |

### CSS Properties

| Name                      | Default | Description                                             |
| ------------------------- | ------- | ------------------------------------------------------- |
| `--sw-dropup-offset`      |         | \[4px] - Gap between anchor and menu.                   |
| `--sw-dropup-max-width`   |         | \[200px] - Maximum menu width.                          |
| `--sw-dropup-bg`          |         | \[var(--bg-page)] - Menu background.                    |
| `--sw-dropup-border`      |         | \[1px solid var(--border-default)] - Menu border.       |
| `--sw-dropup-radius`      |         | \[var(--radius-md)] - Menu border-radius.               |
| `--sw-dropup-shadow`      |         | \[var(--shadow-md)] - Menu box-shadow.                  |
| `--sw-dropup-color`       |         | \[var(--fg-default)] - Item text color.                 |
| `--sw-dropup-item-hover`  |         | \[var(--bg-surface)] - Item hover background.           |
| `--sw-dropup-item-active` |         | \[var(--bg-surface-raised)] - Selected item background. |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-dropup-close` | — | Outside click closed the menu. No detail. |
| `sw-dropup-select` | — | User picked an item. |

---
