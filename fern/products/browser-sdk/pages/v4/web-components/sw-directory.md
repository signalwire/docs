---
title: "sw-directory"
slug: "/web-components/sw-directory"
---
# `<sw-directory>`

Searchable, paginated contact list bound to a `DirectoryService`.

Displays the live `addresses$` observable from a directory service as a
scrollable list with a built-in search input. Each row is selectable
and exposes per-channel call buttons (audio / video / messaging) when
the corresponding channel is advertised by the address. The list also
surfaces the service's `loading$` and `hasMore$` observables and calls
`loadMore()` (when available) for infinite-scroll pagination.

_Class: `SwDirectory` · Module: `packages/web-components/src/components/sw-directory.ts`_

## class: `SwDirectory`, `sw-directory`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name        | Privacy | Type                       | Default | Description                                  | Inherited From |
| ----------- | ------- | -------------------------- | ------- | -------------------------------------------- | -------------- |
| `directory` |         | `DirectoryService \| null` | `null`  | Directory service with addresses$ observable |                |

### Attributes

| Name        | Field     | Inherited From |
| ----------- | --------- | -------------- |
| `directory` | directory |                |

### CSS Properties

| Name                                 | Default                  | Description                   |
| ------------------------------------ | ------------------------ | ----------------------------- |
| `--interactive-button-primary-bg`    | `#044ef4`                | Primary brand color.          |
| `--interactive-button-primary-hover` | `#0342cf`                | Primary color on hover.       |
| `--interactive-status-success`       | `#22c55e`                | Success / positive color.     |
| `--fg-default`                       | `#f0f0f4`                | Primary text color.           |
| `--fg-muted`                         | `#a0a0aa`                | Secondary / muted text color. |
| `--bg-surface`                       | `#181a28`                | Component background color.   |
| `--bg-surface-raised`                | `#222436`                | Background on hover.          |
| `--interactive-dropdown-hover`       | `#333338`                | Background on active/press.   |
| `--border-default`                   | `rgba(255,255,255,0.12)` | Border color.                 |

### CSS Parts

| Name            | Description                                      |
| --------------- | ------------------------------------------------ |
| `container`     | Outer flex container.                            |
| `search`        | Search-input row at the top of the list.         |
| `list`          | The scrollable list of addresses.                |
| `item`          | One row in the list.                             |
| `item-selected` | A row when it is selected.                       |
| `action`        | Per-row call button (audio / video / messaging). |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-address-select` | — | The user clicked a row. |
| `sw-dial` | — | The user clicked a per-channel call button. |

---
