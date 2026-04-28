# textMessage

#### Get Signature

> **get** **textMessage**(): `EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`TextMessage`](../../interfaces/TextMessage.md)\<`Address`\>\> \| `undefined`

Defined in: [core/entities/Address.ts:283](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Address.ts#L283)

Collection of text messages for this address, with pagination support.

Returns `undefined` until [textMessages$](#textmessages) has been subscribed to (lazy-loaded).
Filters to `'chat'` subtype messages from the conversation.

##### See

 - [textMessages$](#textmessages) to trigger lazy loading.
 - [sendText](#sendtext) to send a new message.

##### Returns

`EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`TextMessage`](../../interfaces/TextMessage.md)\<`Address`\>\> \| `undefined`
