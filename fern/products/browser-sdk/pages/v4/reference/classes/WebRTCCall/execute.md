# execute

> **execute**\<`T`\>(`request`, `options?`): `Promise`\<`T`\>

Defined in: [core/entities/Call.ts:964](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L964)

Executes a raw JSON-RPC request on the client session.

Lower-level than [executeMethod](#executemethod) — allows full control over the RPC request structure.

#### Type Parameters

| Type Parameter | Default type |
| ------ | ------ |
| `T` *extends* [`JSONRPCResponse`](../../type-aliases/JSONRPCResponse.md) | [`JSONRPCResponse`](../../type-aliases/JSONRPCResponse.md) |

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `request` | [`JSONRPCRequest`](../../interfaces/JSONRPCRequest.md) | Complete JSON-RPC request object. |
| `options?` | [`PendingRPCOptions`](../../interfaces/PendingRPCOptions.md) | Optional RPC execution options (timeout, etc.). |

#### Returns

`Promise`\<`T`\>

The RPC response.

#### Throws

If the RPC call returns an error response.

#### Implementation of

`CallManager.execute`
