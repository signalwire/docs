# Type Alias: ExecuteMethod

> **ExecuteMethod** = \<`T`\>(`target`, `method`, `args`) => `Promise`\<`T`\>

Defined in: [core/entities/Participant.ts:27](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L27)

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
