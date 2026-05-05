---
title: "history"
---

#### Get Signature

> **get** **history**(): `EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`AddressHistory`](../interfaces/AddressHistory.md)\<`Address`\>\> \| `undefined`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Address.ts#L314)</sub>

Collection of call history entries for this address, with pagination support.

Returns `undefined` until [history$](#history) has been subscribed to (lazy-loaded).
Filters to `'log'` subtype messages including kind, status, start/end times.

##### See

[history$](#history) to trigger lazy loading.

##### Returns

`EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`AddressHistory`](../interfaces/AddressHistory.md)\<`Address`\>\> \| `undefined`
