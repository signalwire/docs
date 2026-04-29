---
title: "transfer"
---

# transfer

> **transfer**(`options`): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:1311](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L1311)

Transfers the call to another destination.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `options` | [`TransferOptions`](../interfaces/TransferOptions.md) | Transfer configuration including the target destination. |

#### Returns

`Promise`\<`void`\>

#### See

[status$](#status-1) to observe the transfer progress.

#### Implementation of

`CallManager.transfer`
