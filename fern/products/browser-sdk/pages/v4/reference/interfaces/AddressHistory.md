---
title: "AddressHistory<TAddress>"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/conversation.types.ts#L14)</sub>

Address history entry from conversation messages
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
| `ended?` | `number` | [core/types/conversation.types.ts:19](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/conversation.types.ts#L19) |
| `fromAddress$` | `Observable`\<`TAddress`\> \| `undefined` | [core/types/conversation.types.ts:20](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/conversation.types.ts#L20) |
| `id` | `string` | [core/types/conversation.types.ts:15](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/conversation.types.ts#L15) |
| `kind` | `string` | [core/types/conversation.types.ts:16](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/conversation.types.ts#L16) |
| `started` | `number` | [core/types/conversation.types.ts:18](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/conversation.types.ts#L18) |
| `status` | `string` | [core/types/conversation.types.ts:17](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/conversation.types.ts#L17) |
