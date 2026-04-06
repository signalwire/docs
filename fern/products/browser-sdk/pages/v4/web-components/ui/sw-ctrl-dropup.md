# `<sw-ctrl-dropup>`

Button that opens a menu above itself. Shows the selected item label as a small indicator beneath the icon.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `options` | `DropupOption[]` | `[]` | `{ value: string, label: string }[]` |
| `value` | `string` | `''` | Currently selected value |
| `disabled` | `boolean` | `false` | — |
| `label` | `string` | `''` | `aria-label` for the trigger button |

## Events

| event | detail | description |
|-------|--------|-------------|
| `sw-change` | `{ value: string }` | Option selected |

## Slots

| slot | description |
|------|-------------|
| *(default)* | Trigger icon |

## Parts

`button`, `button-open`, `indicator`

## CSS tokens

Inherits all `--ctrl-*` tokens. Menu appearance controlled by `--ctrl-menu-*` tokens — see [sw-ctrl-button](./sw-ctrl-button.md#shared-ctrl-tokens).
