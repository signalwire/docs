# history

#### Get Signature

> **get** **history**(): `EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`AddressHistory`](../../interfaces/AddressHistory.md)\<`Address`\>\> \| `undefined`

Defined in: [core/entities/Address.ts:314](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Address.ts#L314)

Collection of call history entries for this address, with pagination support.

Returns `undefined` until [history$](#history) has been subscribed to (lazy-loaded).
Filters to `'log'` subtype messages including kind, status, start/end times.

##### See

[history$](#history) to trigger lazy loading.

##### Returns

`EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`AddressHistory`](../../interfaces/AddressHistory.md)\<`Address`\>\> \| `undefined`
