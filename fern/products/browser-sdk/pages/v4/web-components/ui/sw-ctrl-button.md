# `<sw-ctrl-button>`

Plain action button for control bars.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `variant` | `'default' \| 'primary' \| 'danger'` | `'default'` | Colour variant |
| `disabled` | `boolean` | `false` | — |
| `label` | `string` | `''` | `aria-label` |

## Slots

| slot | description |
|------|-------------|
| *(default)* | Icon or content |

## Parts

`button`

## Shared ctrl tokens

All `sw-ctrl-*` primitives inherit these CSS custom properties. Set them on any ancestor to theme the entire control bar.

| property | default | description |
|----------|---------|-------------|
| `--ctrl-size` | `44px` | Button width & height |
| `--ctrl-radius` | `50%` | Button border radius |
| `--ctrl-bg` | `rgba(255,255,255,0.12)` | Default surface |
| `--ctrl-bg-hover` | `rgba(255,255,255,0.22)` | Hover surface |
| `--ctrl-fg` | `#ffffff` | Icon colour |
| `--ctrl-focus-ring` | `#044cf6` | Focus outline colour |
| `--ctrl-active-bg` | `#ef4444` | Toggle active background |
| `--ctrl-active-bg-hover` | `#dc2626` | Toggle active hover |
| `--ctrl-active-fg` | `#ffffff` | Toggle active icon |
| `--ctrl-primary-bg` | `#044cf6` | Primary variant background |
| `--ctrl-primary-bg-hover` | `#0339c4` | — |
| `--ctrl-primary-fg` | `#ffffff` | — |
| `--ctrl-danger-bg` | `#ef4444` | Danger variant background |
| `--ctrl-danger-bg-hover` | `#dc2626` | — |
| `--ctrl-danger-fg` | `#ffffff` | — |
| `--ctrl-label-color` | `rgba(255,255,255,0.55)` | Indicator text colour |
| `--ctrl-label-size` | `10px` | Indicator text size |
| `--ctrl-menu-bg` | `#1e1e2e` | Drop-up menu background |
| `--ctrl-menu-border` | `rgba(255,255,255,0.14)` | Menu border |
| `--ctrl-menu-item-hover` | `rgba(255,255,255,0.1)` | Menu item hover |
| `--ctrl-menu-item-active` | `rgba(4,76,246,0.35)` | Selected menu item |
| `--ctrl-menu-radius` | `10px` | Menu border radius |
| `--ctrl-menu-shadow` | `0 8px 24px rgba(0,0,0,0.45)` | Menu shadow |
