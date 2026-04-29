# `<sw-ui-split-button>`

Pill-shaped split button: main action + optional chevron dropdown.

When `items` is non-empty, renders as a unified pill with a subtle
divider between the icon area and the chevron: `[ 🎤 | ▲ ]`

When `items` is empty, renders as a single pill button.

- **active/inactive** slots → toggle button, dispatches `sw-split-button-toggle`
- **default** slot only → push button, dispatches `sw-split-button-click`

_Class: `SwUiSplitButton` · Module: `packages/web-components/src/components/UI/controls/sw-ui-split-button.ts`_

## class: `SwUiSplitButton`, `sw-ui-split-button`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name     | Privacy | Type                          | Default | Description | Inherited From |
| -------- | ------- | ----------------------------- | ------- | ----------- | -------------- |
| `items`  |         | `Array<DropUpItem \| string>` | `[]`    |             |                |
| `active` |         | `boolean`                     | `false` |             |                |

### Attributes

| Name     | Field  | Inherited From |
| -------- | ------ | -------------- |
| `items`  | items  |                |
| `active` | active |                |

### CSS Properties

| Name                         | Default | Description                                          |
| ---------------------------- | ------- | ---------------------------------------------------- |
| `--sw-split-button-size`     |         | \[44px]  - height (width auto-fits content)          |
| `--sw-split-button-bg`       |         | button background (falls back to --bg-surface)       |
| `--sw-split-button-bg-hover` |         | hover background (falls back to --bg-surface-raised) |
| `--sw-split-button-color`    |         | icon colour (falls back to --fg-default)             |
| `--sw-split-button-radius`   |         | border-radius (falls back to --radius-full)          |

### Slots

| Name         | Description                  |
| ------------ | ---------------------------- |
| `active`     | icon shown when active       |
| `inactive`   | icon shown when inactive     |
| `(default)-` | icon for a non-toggle button |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-split-button-click` | — | Fired on push-mode click. No detail. |
| `sw-split-button-toggle` | — | Fired on toggle-mode click. `detail` is the new active state (boolean). |

---
