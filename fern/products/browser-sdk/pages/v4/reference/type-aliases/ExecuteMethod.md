---
title: "ExecuteMethod"
---

> **ExecuteMethod** = \<`T`\>(`target`, `method`, `args`) => `Promise`\<`T`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L27)</sub>

Callback type for executing call methods
Injected to avoid circular dependency with Call class

## Type Parameters

| Type Parameter | Default type |
| ------ | ------ |
| `T` *extends* [`JSONRPCResponse`](JSONRPCResponse.md) | [`JSONRPCResponse`](JSONRPCResponse.md) |

## Parameters

| Parameter | Type |
| ------ | ------ |
| `target` | `string` \| `MemberTarget` |
| `method` | `string` |
| `args` | `Record`\<`string`, `unknown`\> |

## Returns

`Promise`\<`T`\>
