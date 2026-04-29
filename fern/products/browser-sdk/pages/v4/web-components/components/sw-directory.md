# `<sw-directory>`

_Class: `DirectoryComponent` · Module: `packages/web-components/src/components/directory.ts`_

## class: `DirectoryComponent`, `sw-directory`

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

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-address-select` | `{ address: Address }` | Fired when an address is selected |
| `sw-dial` | `{ address: Address, channel: string }` | Fired when the call button on an address is clicked |

---
