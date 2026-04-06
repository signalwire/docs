# Type Alias: ExecuteMethod

> **ExecuteMethod** = \<`T`\>(`target`, `method`, `args`) => `Promise`\<`T`\>

Defined in: [core/entities/Participant.ts:28](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L28)

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
