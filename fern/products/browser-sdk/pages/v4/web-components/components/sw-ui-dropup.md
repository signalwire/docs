# `<sw-ui-dropup>`

Dropdown (opens upward) menu anchored to a trigger element.

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
| `items` | items |                |
| `open`  | open  |                |

### CSS Properties

| Name                      | Default | Description                                             |
| ------------------------- | ------- | ------------------------------------------------------- |
| `--sw-dropup-offset`      |         | \[4px]                    - gap between anchor and menu |
| `--sw-dropup-max-width`   |         | \[200px]                  - maximum menu width          |
| `--sw-dropup-bg`          |         | \[#1f2937]                - menu background             |
| `--sw-dropup-border`      |         | \[1px solid rgba(255,255,255,0.1)] - menu border        |
| `--sw-dropup-radius`      |         | \[8px]                    - menu border-radius          |
| `--sw-dropup-shadow`      |         | \[0 4px 12px rgba(0,0,0,0.4)]     - menu box-shadow     |
| `--sw-dropup-color`       |         | \[#e5e7eb]                - item text colour            |
| `--sw-dropup-item-hover`  |         | \[rgba(255,255,255,0.08)] - item hover background       |
| `--sw-dropup-item-active` |         | \[rgba(255,255,255,0.15)] - selected item background    |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-dropup-close` | — | Outside click closed the menu. |
| `sw-dropup-select` | — | User picked an item. `detail` is the selected `DropUpItem`. |

---
