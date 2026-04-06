# `<sw-ctrl-toggle>`

Two-state toggle button. Manages active styling; parent owns state.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `active` | `boolean` | `false` | Active/on state (reflected as attribute) |
| `disabled` | `boolean` | `false` | — |
| `label` | `string` | `''` | `aria-label` / `aria-pressed` label |

## Slots

| slot | description |
|------|-------------|
| *(default)* | Icon shown when **inactive** |
| `active-icon` | Icon shown when **active** (falls back to default) |

## Parts

`button`, `button-active`

## CSS tokens

Inherits all `--ctrl-*` tokens. Key overrides:

| property | description |
|----------|-------------|
| `--ctrl-active-bg` | Background when active |
| `--ctrl-active-bg-hover` | Hover when active |
| `--ctrl-active-fg` | Icon colour when active |
