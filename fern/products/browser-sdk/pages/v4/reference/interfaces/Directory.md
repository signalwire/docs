# Interface: Directory

Defined in: [core/entities/Directory.ts:13](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Directory.ts#L13)

Directory interface for managing addresses

This is the public API contract for address directory functionality.
It provides access to addresses, loading capabilities, and search functionality.

## Extends

- `AddressProvider`\<[`Address`](../classes/Address.md)\>

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="addresses"></a> `addresses` | `readonly` | [`Address`](../classes/Address.md)[] | Current snapshot of all addresses in the directory | [core/entities/Directory.ts:23](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Directory.ts#L23) |
| <a id="addresses-1"></a> `addresses$` | `readonly` | `Observable`\<[`Address`](../classes/Address.md)[]\> | Observable stream of all addresses in the directory Emits a new array whenever addresses are added, removed, or updated | [core/entities/Directory.ts:18](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Directory.ts#L18) |
| <a id="hasmore"></a> `hasMore$` | `readonly` | `Observable`\<`boolean`\> | Observable indicating whether more addresses can be loaded from the server | [core/entities/Directory.ts:28](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Directory.ts#L28) |
| <a id="loading"></a> `loading` | `readonly` | `boolean` | - | [core/entities/Directory.ts:36](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Directory.ts#L36) |
| <a id="loading-1"></a> `loading$` | `readonly` | `Observable`\<`boolean`\> | Observable indicating the current loading state Emits `true` when loading, `false` when idle | [core/entities/Directory.ts:34](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Directory.ts#L34) |

## Methods

### findAddressIdByURI()

> **findAddressIdByURI**(`uri`): `Promise`\<`string` \| `undefined`\>

Defined in: [core/entities/Directory.ts:58](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Directory.ts#L58)

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

> **get**(`addressId`): [`Address`](../classes/Address.md) \| `undefined`

Defined in: [core/entities/Directory.ts:50](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Directory.ts#L50)

Get a specific address by ID

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `addressId` | `string` | The address ID to retrieve |

#### Returns

[`Address`](../classes/Address.md) \| `undefined`

The address instance, or undefined if not found

***

### get$()

> **get$**(`id`): `Observable`\<[`Address`](../classes/Address.md)\> \| `undefined`

Defined in: [interfaces/AddressProvider.ts:22](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/AddressProvider.ts#L22)

Get an observable stream for a specific address by ID

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `id` | `string` | The address ID to retrieve |

#### Returns

`Observable`\<[`Address`](../classes/Address.md)\> \| `undefined`

Observable of the address, or undefined if not found

#### Inherited from

`AddressProvider.get$`

***

### loadMore()

> **loadMore**(): `void`

Defined in: [core/entities/Directory.ts:42](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Directory.ts#L42)

Load more addresses from the server
Only loads if `hasMore` is true

#### Returns

`void`
