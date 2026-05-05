---
title: "TextMessage<TAddress>"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/conversation.types.ts#L33)</sub>

Text message from conversation
Contains a reference to the sender address as an observable

## Remarks

Uses a generic type parameter to maintain type safety while avoiding
circular dependencies. The Address class provides the concrete type.

## Type Parameters

| Type Parameter | Default type | Description |
| ------ | ------ | ------ |
| `TAddress` | `never` | The Address type, provided by the implementation |

## Properties

| Property | Type | Defined in |
| ------ | ------ | ------ |
| `created` | `number` | [core/types/conversation.types.ts:36](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/conversation.types.ts#L36) |
| `fromAddress$` | `Observable`\<`TAddress`\> \| `undefined` | [core/types/conversation.types.ts:35](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/conversation.types.ts#L35) |
| `id` | `string` | [core/types/conversation.types.ts:34](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/conversation.types.ts#L34) |
| `text` | `string` | [core/types/conversation.types.ts:37](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/conversation.types.ts#L37) |
