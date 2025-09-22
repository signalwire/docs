Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:6](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L6)

Browser-based storage adapter using localStorage and sessionStorage

## Implements

- [`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md)

## Constructors

### Constructor

> **new LocalStorageAdapter**(): `LocalStorageAdapter`

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:10](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L10)

#### Returns

`LocalStorageAdapter`

## Methods

### clear()

> **clear**(`prefix?`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:156](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L156)

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

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:270](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L270)

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

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:87](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L87)

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

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:130](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L130)

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

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:244](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L244)

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

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:199](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L199)

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

> **get**\<`T`\>(`key`): `Promise`\<`null` \| `T`\>

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:63](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L63)

Get a value from persistent storage

#### Type Parameters

##### T

`T` = `unknown`

#### Parameters

##### key

`string`

The storage key

#### Returns

`Promise`\<`null` \| `T`\>

The stored value or null if not found

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`get`](../interfaces/SignalWireStorageContract.md#get)

***

### getMany()

> **getMany**\<`T`\>(`keys`): `Promise`\<`Map`\<`string`, `null` \| `T`\>\>

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:113](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L113)

Get multiple values from persistent storage

#### Type Parameters

##### T

`T` = `unknown`

#### Parameters

##### keys

`string`[]

Array of storage keys

#### Returns

`Promise`\<`Map`\<`string`, `null` \| `T`\>\>

Map of keys to values (null if not found)

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`getMany`](../interfaces/SignalWireStorageContract.md#getmany)

***

### getManySession()

> **getManySession**\<`T`\>(`keys`): `Promise`\<`Map`\<`string`, `null` \| `T`\>\>

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:225](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L225)

Get multiple values from session storage

#### Type Parameters

##### T

`T` = `unknown`

#### Parameters

##### keys

`string`[]

Array of storage keys

#### Returns

`Promise`\<`Map`\<`string`, `null` \| `T`\>\>

Map of keys to values (null if not found)

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`getManySession`](../interfaces/SignalWireStorageContract.md#getmanysession)

***

### getSession()

> **getSession**\<`T`\>(`key`): `Promise`\<`null` \| `T`\>

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:175](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L175)

Get a value from session storage

#### Type Parameters

##### T

`T` = `unknown`

#### Parameters

##### key

`string`

The storage key

#### Returns

`Promise`\<`null` \| `T`\>

The stored value or null if not found

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`getSession`](../interfaces/SignalWireStorageContract.md#getsession)

***

### getStorageInfo()

> **getStorageInfo**(): `Promise`\<[`StorageInfo`](../interfaces/StorageInfo.md)\>

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:289](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L289)

Get information about the storage implementation

#### Returns

`Promise`\<[`StorageInfo`](../interfaces/StorageInfo.md)\>

Storage information including type and availability

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`getStorageInfo`](../interfaces/SignalWireStorageContract.md#getstorageinfo)

***

### has()

> **has**(`key`): `Promise`\<`boolean`\>

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:102](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L102)

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

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:214](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L214)

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

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:138](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L138)

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

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:252](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L252)

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

> **set**\<`T`\>(`key`, `value`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:75](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L75)

Set a value in persistent storage

#### Type Parameters

##### T

`T` = `unknown`

#### Parameters

##### key

`string`

The storage key

##### value

`T`

The value to store

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`set`](../interfaces/SignalWireStorageContract.md#set)

***

### setMany()

> **setMany**\<`T`\>(`entries`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:121](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L121)

Set multiple values in persistent storage

#### Type Parameters

##### T

`T` = `unknown`

#### Parameters

##### entries

Map or array of key-value pairs

`Map`\<`string`, `T`\> | \[`string`, `T`\][]

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`setMany`](../interfaces/SignalWireStorageContract.md#setmany)

***

### setManySession()

> **setManySession**\<`T`\>(`entries`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:235](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L235)

Set multiple values in session storage

#### Type Parameters

##### T

`T` = `unknown`

#### Parameters

##### entries

Map or array of key-value pairs

`Map`\<`string`, `T`\> | \[`string`, `T`\][]

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`setManySession`](../interfaces/SignalWireStorageContract.md#setmanysession)

***

### setSession()

> **setSession**\<`T`\>(`key`, `value`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/storage/LocalStorageAdapter.ts:187](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/storage/LocalStorageAdapter.ts#L187)

Set a value in session storage

#### Type Parameters

##### T

`T` = `unknown`

#### Parameters

##### key

`string`

The storage key

##### value

`T`

The value to store

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md).[`setSession`](../interfaces/SignalWireStorageContract.md#setsession)
