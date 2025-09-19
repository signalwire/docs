Defined in: [packages/core/src/types/SignalwireStorageContract.ts:16](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L16)

Contract for SignalWire storage implementations.
Provides both persistent and session storage capabilities.

## Methods

### clear()

> **clear**(`prefix?`): `Promise`\<`void`\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:79](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L79)

Clear all items from persistent storage

#### Parameters

##### prefix?

`string`

Optional prefix to only clear matching keys

#### Returns

`Promise`\<`void`\>

***

### clearSession()

> **clearSession**(`prefix?`): `Promise`\<`void`\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:143](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L143)

Clear all items from session storage

#### Parameters

##### prefix?

`string`

Optional prefix to only clear matching keys

#### Returns

`Promise`\<`void`\>

***

### delete()

> **delete**(`key`): `Promise`\<`boolean`\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:37](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L37)

Delete a value from persistent storage

#### Parameters

##### key

`string`

The storage key

#### Returns

`Promise`\<`boolean`\>

True if the item was deleted, false if it didn't exist

***

### deleteMany()

> **deleteMany**(`keys`): `Promise`\<`Map`\<`string`, `boolean`\>\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:66](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L66)

Delete multiple values from persistent storage

#### Parameters

##### keys

`string`[]

Array of storage keys

#### Returns

`Promise`\<`Map`\<`string`, `boolean`\>\>

Map of keys to deletion results

***

### deleteManySession()

> **deleteManySession**(`keys`): `Promise`\<`Map`\<`string`, `boolean`\>\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:130](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L130)

Delete multiple values from session storage

#### Parameters

##### keys

`string`[]

Array of storage keys

#### Returns

`Promise`\<`Map`\<`string`, `boolean`\>\>

Map of keys to deletion results

***

### deleteSession()

> **deleteSession**(`key`): `Promise`\<`boolean`\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:101](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L101)

Delete a value from session storage

#### Parameters

##### key

`string`

The storage key

#### Returns

`Promise`\<`boolean`\>

True if the item was deleted, false if it didn't exist

***

### get()

> **get**(`key`): `Promise`\<`null` \| `string`\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:23](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L23)

Get a value from persistent storage

#### Parameters

##### key

`string`

The storage key

#### Returns

`Promise`\<`null` \| `string`\>

The stored value or null if not found

***

### getMany()

> **getMany**(`keys`): `Promise`\<`Map`\<`string`, `null` \| `string`\>\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:51](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L51)

Get multiple values from persistent storage

#### Parameters

##### keys

`string`[]

Array of storage keys

#### Returns

`Promise`\<`Map`\<`string`, `null` \| `string`\>\>

Map of keys to values (null if not found)

***

### getManySession()

> **getManySession**(`keys`): `Promise`\<`Map`\<`string`, `null` \| `string`\>\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:115](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L115)

Get multiple values from session storage

#### Parameters

##### keys

`string`[]

Array of storage keys

#### Returns

`Promise`\<`Map`\<`string`, `null` \| `string`\>\>

Map of keys to values (null if not found)

***

### getSession()

> **getSession**(`key`): `Promise`\<`null` \| `string`\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:87](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L87)

Get a value from session storage

#### Parameters

##### key

`string`

The storage key

#### Returns

`Promise`\<`null` \| `string`\>

The stored value or null if not found

***

### getStorageInfo()

> **getStorageInfo**(): `Promise`\<[`StorageInfo`](StorageInfo.md)\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:149](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L149)

Get information about the storage implementation

#### Returns

`Promise`\<[`StorageInfo`](StorageInfo.md)\>

Storage information including type and availability

***

### has()

> **has**(`key`): `Promise`\<`boolean`\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:44](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L44)

Check if a key exists in persistent storage

#### Parameters

##### key

`string`

The storage key

#### Returns

`Promise`\<`boolean`\>

True if the key exists

***

### hasSession()

> **hasSession**(`key`): `Promise`\<`boolean`\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:108](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L108)

Check if a key exists in session storage

#### Parameters

##### key

`string`

The storage key

#### Returns

`Promise`\<`boolean`\>

True if the key exists

***

### list()

> **list**(`prefix?`): `Promise`\<`string`[]\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:73](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L73)

List all keys in persistent storage

#### Parameters

##### prefix?

`string`

Optional prefix to filter keys

#### Returns

`Promise`\<`string`[]\>

Array of matching keys

***

### listSession()

> **listSession**(`prefix?`): `Promise`\<`string`[]\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:137](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L137)

List all keys in session storage

#### Parameters

##### prefix?

`string`

Optional prefix to filter keys

#### Returns

`Promise`\<`string`[]\>

Array of matching keys

***

### set()

> **set**(`key`, `value`): `Promise`\<`void`\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:30](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L30)

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

***

### setMany()

> **setMany**(`entries`): `Promise`\<`void`\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:57](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L57)

Set multiple values in persistent storage

#### Parameters

##### entries

Map or array of key-value pairs

`Map`\<`string`, `string`\> | \[`string`, `string`\][]

#### Returns

`Promise`\<`void`\>

***

### setManySession()

> **setManySession**(`entries`): `Promise`\<`void`\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:121](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L121)

Set multiple values in session storage

#### Parameters

##### entries

Map or array of key-value pairs

`Map`\<`string`, `string`\> | \[`string`, `string`\][]

#### Returns

`Promise`\<`void`\>

***

### setSession()

> **setSession**(`key`, `value`): `Promise`\<`void`\>

Defined in: [packages/core/src/types/SignalwireStorageContract.ts:94](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/SignalwireStorageContract.ts#L94)

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
