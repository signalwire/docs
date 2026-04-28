# executeMethod

> **executeMethod**\<`T`\>(`target`, `method`, `args`): `Promise`\<`T`\>

Defined in: [core/entities/Call.ts:424](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L424)

Executes a Verto RPC method targeting a specific participant.

Constructs call context (node_id, call_id, member_id) and sends the RPC request.

#### Type Parameters

| Type Parameter | Default type |
| ------ | ------ |
| `T` *extends* [`JSONRPCResponse`](../../type-aliases/JSONRPCResponse.md) | [`JSONRPCResponse`](../../type-aliases/JSONRPCResponse.md) |

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `target` | `string` \| `MemberTarget` | Target member ID string, or a MemberTarget object. |
| `method` | `string` | Verto method name (e.g. `'call.mute'`, `'call.member.remove'`). |
| `args` | `Record`\<`string`, `unknown`\> | Parameters for the RPC method. |

#### Returns

`Promise`\<`T`\>

The RPC response.

#### Throws

If the RPC call returns an error.

#### Implementation of

`CallManager.executeMethod`
