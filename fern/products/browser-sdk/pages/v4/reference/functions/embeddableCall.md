# Function: embeddableCall()

> **embeddableCall**(`options`): `Promise`\<[`Call`](../interfaces/Call.md)\>

Defined in: [utils/embeddableCall.ts:25](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/utils/embeddableCall.ts#L25)

Creates a call using an embed token for simple, embeddable integrations.

Handles client creation, authentication, and dialing in a single call.

## Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `options` | `EmbeddableCallOptions` | Embed token, host, and destination. |

## Returns

`Promise`\<[`Call`](../interfaces/Call.md)\>

The created [Call](../interfaces/Call.md) instance.
