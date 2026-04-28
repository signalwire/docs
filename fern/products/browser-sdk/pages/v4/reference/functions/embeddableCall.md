# Function: embeddableCall()

> **embeddableCall**(`options`): `Promise`\<[`Call`](../interfaces/Call.md)\>

Defined in: [utils/embeddableCall.ts:27](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/utils/embeddableCall.ts#L27)

Creates a call using an embed token for simple, embeddable integrations.

Handles client creation, authentication, and dialing in a single call.

## Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `options` | `EmbeddableCallOptions` | Embed token, host, and destination. |

## Returns

`Promise`\<[`Call`](../interfaces/Call.md)\>

The created [Call](../interfaces/Call.md) instance.
