---
title: "Directory"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Directory.ts#L13)</sub>

Directory interface for managing addresses

This is the public API contract for address directory functionality.
It provides access to addresses, loading capabilities, and search functionality.

## Extends

- `AddressProvider`\<[`Address`](../Address/index.md)\>

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| `addresses` | `readonly` | [`Address`](../Address/index.md)[] | Current snapshot of all addresses in the directory | [core/entities/Directory.ts:23](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Directory.ts#L23) |
| `addresses$` | `readonly` | `Observable`\<[`Address`](../Address/index.md)[]\> | Observable stream of all addresses in the directory Emits a new array whenever addresses are added, removed, or updated | [core/entities/Directory.ts:18](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Directory.ts#L18) |
| `hasMore$` | `readonly` | `Observable`\<`boolean`\> | Observable indicating whether more addresses can be loaded from the server | [core/entities/Directory.ts:28](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Directory.ts#L28) |
| `loading` | `readonly` | `boolean` | - | [core/entities/Directory.ts:36](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Directory.ts#L36) |
| `loading$` | `readonly` | `Observable`\<`boolean`\> | Observable indicating the current loading state Emits `true` when loading, `false` when idle | [core/entities/Directory.ts:34](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Directory.ts#L34) |

## Methods

### findAddressIdByURI()

> **findAddressIdByURI**(`uri`): `Promise`\<`string` \| `undefined`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Directory.ts#L58)</sub>

Find an address ID by searching for a name

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `uri` | `string` | The address name to search for |

#### Returns

`Promise`\<`string` \| `undefined`\>

Promise resolving to the address ID, or undefined if not found

***

### get()

> **get**(`addressId`): [`Address`](../Address/index.md) \| `undefined`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Directory.ts#L50)</sub>

Get a specific address by ID

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `addressId` | `string` | The address ID to retrieve |

#### Returns

[`Address`](../Address/index.md) \| `undefined`

The address instance, or undefined if not found

***

### get$()

> **get$**(`id`): `Observable`\<[`Address`](../Address/index.md)\> \| `undefined`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/AddressProvider.ts#L22)</sub>

Get an observable stream for a specific address by ID

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `id` | `string` | The address ID to retrieve |

#### Returns

`Observable`\<[`Address`](../Address/index.md)\> \| `undefined`

Observable of the address, or undefined if not found

#### Inherited from

`AddressProvider.get$`

***

### loadMore()

> **loadMore**(): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Directory.ts#L42)</sub>

Load more addresses from the server
Only loads if `hasMore` is true

#### Returns

`void`
