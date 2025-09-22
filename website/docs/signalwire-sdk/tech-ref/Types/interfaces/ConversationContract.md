Defined in: [packages/client/src/unified/interfaces/conversation.ts:7](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/conversation.ts#L7)

## Properties

### createdAt

> `readonly` **createdAt**: `number`

Defined in: [packages/client/src/unified/interfaces/conversation.ts:8](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/conversation.ts#L8)

***

### groupId

> `readonly` **groupId**: `string`

Defined in: [packages/client/src/unified/interfaces/conversation.ts:9](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/conversation.ts#L9)

***

### lastMessageAt

> `readonly` **lastMessageAt**: `number`

Defined in: [packages/client/src/unified/interfaces/conversation.ts:10](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/conversation.ts#L10)

***

### metadata

> `readonly` **metadata**: `Record`\<`string`, `unknown`\>

Defined in: [packages/client/src/unified/interfaces/conversation.ts:11](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/conversation.ts#L11)

***

### name

> `readonly` **name**: `string`

Defined in: [packages/client/src/unified/interfaces/conversation.ts:12](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/conversation.ts#L12)

## Methods

### getMessages()

> **getMessages**(`params?`): `Promise`\<[`GetConversationMessagesResult`](../type-aliases/GetConversationMessagesResult.md)\>

Defined in: [packages/client/src/unified/interfaces/conversation.ts:16](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/conversation.ts#L16)

#### Parameters

##### params?

[`ConversationAPIGetMessagesParams`](ConversationAPIGetMessagesParams.md)

#### Returns

`Promise`\<[`GetConversationMessagesResult`](../type-aliases/GetConversationMessagesResult.md)\>

***

### sendMessage()

> **sendMessage**(`params`): `Promise`\<[`SendConversationMessageResponse`](../type-aliases/SendConversationMessageResponse.md)\>

Defined in: [packages/client/src/unified/interfaces/conversation.ts:13](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/conversation.ts#L13)

#### Parameters

##### params

[`ConversationAPISendMessageParams`](ConversationAPISendMessageParams.md)

#### Returns

`Promise`\<[`SendConversationMessageResponse`](../type-aliases/SendConversationMessageResponse.md)\>
