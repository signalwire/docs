---
title: "embeddableCall"
---

> **embeddableCall**(`options`): `Promise`\<[`Call`](../interfaces/Call.md)\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/utils/embeddableCall.ts#L27)</sub>

Creates a call using an embed token for simple, embeddable integrations.

Handles client creation, authentication, and dialing in a single call.

## Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `options` | `EmbeddableCallOptions` | Embed token, host, and destination. |

## Returns

`Promise`\<[`Call`](../interfaces/Call.md)\>

The created [Call](../interfaces/Call.md) instance.
