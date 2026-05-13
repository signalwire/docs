---
title: "sw-ui-split-button"
slug: /reference/web-component/sw-ui-split-button
---
Pill-shaped icon button with an optional chevron dropdown — the
atomic building block of `<sw-ui-control-bar>`'s mic / camera / speaker
buttons.

```html
<sw-ui-split-button icon="microphone">
  <button slot="menu">Mute</button>
  <button slot="menu">Settings</button>
</sw-ui-split-button>
```

Renders in two layouts:

- **With a chevron menu** (a slotted `<sw-ui-dropup>` or non-empty
`items`): a unified pill split into a main click zone and a chevron
click zone with a subtle divider — `[ 🎤 | ▲ ]`. Clicking the icon
area fires the primary event; clicking the chevron opens the dropup.
- **Without a chevron menu**: a single pill button.

Two interaction modes are inferred from which slots have content:

- **Toggle mode** — both `active` and `inactive` slots are populated.
Each click flips the `active` attribute and fires
`sw-split-button-toggle` with the **new** state.
- **Push mode** — only the default slot is populated. Each click fires
`sw-split-button-click` without toggling.

_Class: `SwUiSplitButton` · Module: `packages/web-components/src/components/UI/controls/sw-ui-split-button.ts`_

## class: `SwUiSplitButton`, `sw-ui-split-button`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields


<ParamField path="items" type="Array<DropUpItem | string>" default="[]" toc={true}>
  `items` field.
</ParamField>

<ParamField path="active" type="boolean" default="false" toc={true}>
  `active` field.
</ParamField>

### Attributes

| Name     | Field  | Inherited From |
| -------- | ------ | -------------- |
| `active` | active |                |
| `items`  | items  |                |

### CSS Properties

| Name                         | Default | Description                                        |
| ---------------------------- | ------- | -------------------------------------------------- |
| `--sw-split-button-size`     |         | \[44px] - Button height (width auto-fits content). |
| `--sw-split-button-bg`       |         | \[var(--bg-surface)] - Button background.          |
| `--sw-split-button-bg-hover` |         | \[var(--bg-surface-raised)] - Hover background.    |
| `--sw-split-button-color`    |         | \[var(--fg-default)] - Icon color.                 |
| `--sw-split-button-radius`   |         | \[var(--radius-full)] - Border radius.             |

### Slots

| Name       | Description                                                               |
| ---------- | ------------------------------------------------------------------------- |
| `active`   | Icon shown when \`active\` is \`true\` (toggle mode).                     |
| `inactive` | Icon shown when \`active\` is \`false\` (toggle mode).                    |
|            | Default slot used by push-mode buttons (no \`active\`/\`inactive\` slot). |
| `dropup`   | Optional \`\<sw-ui-dropup>\` to enable the chevron menu.                  |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-split-button-click` | — | Fired in push mode after each click. No detail. |
| `sw-split-button-toggle` | — | Fired in toggle mode after each click. |

---
