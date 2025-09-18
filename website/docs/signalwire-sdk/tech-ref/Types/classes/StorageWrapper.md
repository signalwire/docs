Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:8](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L8)

A wrapper that adds client-specific prefixing to any storage implementation.
All keys are automatically prefixed with `swcf:${profileId}:` to ensure isolation
between different client instances.

## Implements

- [`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md)

## Constructors

### Constructor

> **new StorageWrapper**(`storage`, `profileId`): `StorageWrapper`

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:16](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L16)

Creates a new StorageWrapper instance

#### Parameters

##### storage

The underlying storage implementation (can be undefined)

`undefined` | [`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md)

##### profileId

`string`

The client identifier for key prefixing

#### Returns

`StorageWrapper`

## Methods

### clear()

> **clear**(`prefix?`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:156](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L156)

Clear all items from persistent storage

#### Parameters

##### prefix?

`string`

Optional prefix to only clear matching keys

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`clear`](../interfaces/SignalWireStorageContract.md#clear)

***

### clearSession()

> **clearSession**(`prefix?`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:272](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L272)

Clear all items from session storage

#### Parameters

##### prefix?

`string`

Optional prefix to only clear matching keys

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`clearSession`](../interfaces/SignalWireStorageContract.md#clearsession)

***

### delete()

> **delete**(`key`): `Promise`\<`boolean`\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:60](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L60)

Delete a value from persistent storage

#### Parameters

##### key

`string`

The storage key

#### Returns

`Promise`\<`boolean`\>

True if the item was deleted, false if it didn't exist

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`delete`](../interfaces/SignalWireStorageContract.md#delete)

***

### deleteMany()

> **deleteMany**(`keys`): `Promise`\<`Map`\<`string`, `boolean`\>\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:116](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L116)

Delete multiple values from persistent storage

#### Parameters

##### keys

`string`[]

Array of storage keys

#### Returns

`Promise`\<`Map`\<`string`, `boolean`\>\>

Map of keys to deletion results

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`deleteMany`](../interfaces/SignalWireStorageContract.md#deletemany)

***

### deleteManySession()

> **deleteManySession**(`keys`): `Promise`\<`Map`\<`string`, `boolean`\>\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:232](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L232)

Delete multiple values from session storage

#### Parameters

##### keys

`string`[]

Array of storage keys

#### Returns

`Promise`\<`Map`\<`string`, `boolean`\>\>

Map of keys to deletion results

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`deleteManySession`](../interfaces/SignalWireStorageContract.md#deletemanysession)

***

### deleteSession()

> **deleteSession**(`key`): `Promise`\<`boolean`\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:176](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L176)

Delete a value from session storage

#### Parameters

##### key

`string`

The storage key

#### Returns

`Promise`\<`boolean`\>

True if the item was deleted, false if it didn't exist

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`deleteSession`](../interfaces/SignalWireStorageContract.md#deletesession)

***

### get()

> **get**(`key`): `Promise`\<`null` \| `string`\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:48](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L48)

Get a value from persistent storage

#### Parameters

##### key

`string`

The storage key

#### Returns

`Promise`\<`null` \| `string`\>

The stored value or null if not found

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`get`](../interfaces/SignalWireStorageContract.md#get)

***

### getMany()

> **getMany**(`keys`): `Promise`\<`Map`\<`string`, `null` \| `string`\>\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:70](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L70)

Get multiple values from persistent storage

#### Parameters

##### keys

`string`[]

Array of storage keys

#### Returns

`Promise`\<`Map`\<`string`, `null` \| `string`\>\>

Map of keys to values (null if not found)

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`getMany`](../interfaces/SignalWireStorageContract.md#getmany)

***

### getManySession()

> **getManySession**(`keys`): `Promise`\<`Map`\<`string`, `null` \| `string`\>\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:186](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L186)

Get multiple values from session storage

#### Parameters

##### keys

`string`[]

Array of storage keys

#### Returns

`Promise`\<`Map`\<`string`, `null` \| `string`\>\>

Map of keys to values (null if not found)

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`getManySession`](../interfaces/SignalWireStorageContract.md#getmanysession)

***

### getSession()

> **getSession**(`key`): `Promise`\<`null` \| `string`\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:164](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L164)

Get a value from session storage

#### Parameters

##### key

`string`

The storage key

#### Returns

`Promise`\<`null` \| `string`\>

The stored value or null if not found

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`getSession`](../interfaces/SignalWireStorageContract.md#getsession)

***

### getStorageInfo()

> **getStorageInfo**(): `Promise`\<[`StorageInfo`](../interfaces/StorageInfo.md)\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:280](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L280)

Get information about the storage implementation

#### Returns

`Promise`\<[`StorageInfo`](../interfaces/StorageInfo.md)\>

Storage information including type and availability

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`getStorageInfo`](../interfaces/SignalWireStorageContract.md#getstorageinfo)

***

### has()

> **has**(`key`): `Promise`\<`boolean`\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:65](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L65)

Check if a key exists in persistent storage

#### Parameters

##### key

`string`

The storage key

#### Returns

`Promise`\<`boolean`\>

True if the key exists

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`has`](../interfaces/SignalWireStorageContract.md#has)

***

### hasSession()

> **hasSession**(`key`): `Promise`\<`boolean`\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:181](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L181)

Check if a key exists in session storage

#### Parameters

##### key

`string`

The storage key

#### Returns

`Promise`\<`boolean`\>

True if the key exists

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`hasSession`](../interfaces/SignalWireStorageContract.md#hassession)

***

### list()

> **list**(`prefix?`): `Promise`\<`string`[]\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:145](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L145)

List all keys in persistent storage

#### Parameters

##### prefix?

`string`

Optional prefix to filter keys

#### Returns

`Promise`\<`string`[]\>

Array of matching keys

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`list`](../interfaces/SignalWireStorageContract.md#list)

***

### listSession()

> **listSession**(`prefix?`): `Promise`\<`string`[]\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:261](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L261)

List all keys in session storage

#### Parameters

##### prefix?

`string`

Optional prefix to filter keys

#### Returns

`Promise`\<`string`[]\>

Array of matching keys

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`listSession`](../interfaces/SignalWireStorageContract.md#listsession)

***

### set()

> **set**(`key`, `value`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:53](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L53)

Set a value in persistent storage

#### Parameters

##### key

`string`

The storage key

##### value

`string`

The value to store

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`set`](../interfaces/SignalWireStorageContract.md#set)

***

### setMany()

> **setMany**(`entries`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:99](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L99)

Set multiple values in persistent storage

#### Parameters

##### entries

Map or array of key-value pairs

`Map`\<`string`, `string`\> | \[`string`, `string`\][]

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`setMany`](../interfaces/SignalWireStorageContract.md#setmany)

***

### setManySession()

> **setManySession**(`entries`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:215](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L215)

Set multiple values in session storage

#### Parameters

##### entries

Map or array of key-value pairs

`Map`\<`string`, `string`\> | \[`string`, `string`\][]

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`setManySession`](../interfaces/SignalWireStorageContract.md#setmanysession)

***

### setSession()

> **setSession**(`key`, `value`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/utils/StorageWrapper.ts:169](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/utils/StorageWrapper.ts#L169)

Set a value in session storage

#### Parameters

##### key

`string`

The storage key

##### value

`string`

The value to store

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`setSession`](../interfaces/SignalWireStorageContract.md#setsession)
