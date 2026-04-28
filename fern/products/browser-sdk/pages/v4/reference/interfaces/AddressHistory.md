# Interface: AddressHistory\<TAddress\>

Defined in: [core/types/conversation.types.ts:14](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/conversation.types.ts#L14)

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
| <a id="ended"></a> `ended?` | `number` | [core/types/conversation.types.ts:19](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/conversation.types.ts#L19) |
| <a id="fromaddress"></a> `fromAddress$` | `Observable`\<`TAddress`\> \| `undefined` | [core/types/conversation.types.ts:20](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/conversation.types.ts#L20) |
| <a id="id"></a> `id` | `string` | [core/types/conversation.types.ts:15](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/conversation.types.ts#L15) |
| <a id="kind"></a> `kind` | `string` | [core/types/conversation.types.ts:16](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/conversation.types.ts#L16) |
| <a id="started"></a> `started` | `number` | [core/types/conversation.types.ts:18](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/conversation.types.ts#L18) |
| <a id="status"></a> `status` | `string` | [core/types/conversation.types.ts:17](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/conversation.types.ts#L17) |
