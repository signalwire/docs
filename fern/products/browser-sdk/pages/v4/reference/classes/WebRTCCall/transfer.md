# transfer

> **transfer**(`options`): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:1311](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L1311)

Transfers the call to another destination.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `options` | [`TransferOptions`](../../interfaces/TransferOptions.md) | Transfer configuration including the target destination. |

#### Returns

`Promise`\<`void`\>

#### See

[status$](#status-1) to observe the transfer progress.

#### Implementation of

`CallManager.transfer`
