Defined in: [packages/client/src/unified/interfaces/index.ts:16](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/index.ts#L16)

## Extends

- `WSClientContract`.`Omit`\<`HTTPClientContract`, `"getAddresses"` \| `"getAddress"` \| `"getMyAddresses"`\>

## Properties

### address

> **address**: `Pick`\<`HTTPClientContract`, `"getAddresses"` \| `"getAddress"` \| `"getMyAddresses"`\>

Defined in: [packages/client/src/unified/interfaces/index.ts:19](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/index.ts#L19)

***

### chat

> **chat**: `object`

Defined in: [packages/client/src/unified/interfaces/index.ts:31](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/index.ts#L31)

#### getMessages()

> **getMessages**: (`params`) => `Promise`\<[`GetConversationChatMessageResult`](../type-aliases/GetConversationChatMessageResult.md)\>

##### Parameters

###### params

[`GetConversationChatMessageParams`](GetConversationChatMessageParams.md)

##### Returns

`Promise`\<[`GetConversationChatMessageResult`](../type-aliases/GetConversationChatMessageResult.md)\>

#### join()

> **join**: (`params`) => `Promise`\<[`JoinConversationResponse`](JoinConversationResponse.md)\>

##### Parameters

###### params

[`JoinConversationParams`](JoinConversationParams.md)

##### Returns

`Promise`\<[`JoinConversationResponse`](JoinConversationResponse.md)\>

#### sendMessage()

> **sendMessage**: (`params`) => `Promise`\<[`SendConversationMessageResponse`](../type-aliases/SendConversationMessageResponse.md)\>

##### Parameters

###### params

[`SendConversationMessageParams`](SendConversationMessageParams.md)

##### Returns

`Promise`\<[`SendConversationMessageResponse`](../type-aliases/SendConversationMessageResponse.md)\>

#### subscribe()

> **subscribe**: (`params`) => `Promise`\<[`ConversationSubscribeResult`](ConversationSubscribeResult.md)\>

##### Parameters

###### params

[`ConversationChatMessagesSubscribeParams`](ConversationChatMessagesSubscribeParams.md)

##### Returns

`Promise`\<[`ConversationSubscribeResult`](ConversationSubscribeResult.md)\>

***

### conversation

> **conversation**: `object`

Defined in: [packages/client/src/unified/interfaces/index.ts:23](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/index.ts#L23)

#### getConversationMessages()

> **getConversationMessages**: (`params`) => `Promise`\<[`GetConversationMessagesResult`](../type-aliases/GetConversationMessagesResult.md)\>

##### Parameters

###### params

[`GetConversationMessagesParams`](GetConversationMessagesParams.md)

##### Returns

`Promise`\<[`GetConversationMessagesResult`](../type-aliases/GetConversationMessagesResult.md)\>

#### getConversations()

> **getConversations**: (`params?`) => `Promise`\<[`GetConversationsResult`](../type-aliases/GetConversationsResult.md)\>

##### Parameters

###### params?

[`GetConversationsParams`](GetConversationsParams.md)

##### Returns

`Promise`\<[`GetConversationsResult`](../type-aliases/GetConversationsResult.md)\>

#### getMessages()

> **getMessages**: (`params?`) => `Promise`\<[`GetMessagesResult`](../type-aliases/GetMessagesResult.md)\>

##### Parameters

###### params?

[`GetMessagesParams`](GetMessagesParams.md)

##### Returns

`Promise`\<[`GetMessagesResult`](../type-aliases/GetMessagesResult.md)\>

#### join()

> **join**: (`params`) => `Promise`\<[`JoinConversationResponse`](JoinConversationResponse.md)\>

##### Parameters

###### params

[`JoinConversationParams`](JoinConversationParams.md)

##### Returns

`Promise`\<[`JoinConversationResponse`](JoinConversationResponse.md)\>

#### sendMessage()

> **sendMessage**: (`params`) => `Promise`\<[`SendConversationMessageResponse`](../type-aliases/SendConversationMessageResponse.md)\>

##### Parameters

###### params

[`SendConversationMessageParams`](SendConversationMessageParams.md)

##### Returns

`Promise`\<[`SendConversationMessageResponse`](../type-aliases/SendConversationMessageResponse.md)\>

#### subscribe()

> **subscribe**: (`callback`) => `Promise`\<[`ConversationSubscribeResult`](ConversationSubscribeResult.md)\>

##### Parameters

###### callback

[`ConversationSubscribeCallback`](../type-aliases/ConversationSubscribeCallback.md)

##### Returns

`Promise`\<[`ConversationSubscribeResult`](ConversationSubscribeResult.md)\>

## Methods

### dial()

> **dial**(`params`): `Promise`\<[`CallSession`](CallSession.md)\>

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:24](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L24)

Dial a resource and connect the call

#### Parameters

##### params

[`DialParams`](DialParams.md)

[DialParams](DialParams.md)

#### Returns

`Promise`\<[`CallSession`](CallSession.md)\>

A Promise resolving to a [CallSession](CallSession.md) object.

#### Inherited from

`WSClientContract.dial`

***

### disconnect()

> **disconnect**(): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:17](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L17)

Disconnects the client from the SignalWire network.

#### Returns

`Promise`\<`void`\>

#### Inherited from

`WSClientContract.disconnect`

***

### getSubscriberInfo()

> **getSubscriberInfo**(): `Promise`\<[`GetSubscriberInfoResponse`](GetSubscriberInfoResponse.md)\>

Defined in: [packages/client/src/unified/interfaces/httpClient.ts:57](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/httpClient.ts#L57)

Retrieve information about the current subscriber.

#### Returns

`Promise`\<[`GetSubscriberInfoResponse`](GetSubscriberInfoResponse.md)\>

A promise that resolves to the subscriber information object [GetSubscriberInfoResult](../type-aliases/GetSubscriberInfoResult.md).

#### Inherited from

`Omit.getSubscriberInfo`

***

### handlePushNotification()

> **handlePushNotification**(`params`): `Promise`\<[`HandlePushNotificationResult`](HandlePushNotificationResult.md)\>

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:38](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L38)

Handles the incoming call via Push Notification

#### Parameters

##### params

[`HandlePushNotificationParams`](../type-aliases/HandlePushNotificationParams.md)

[HandlePushNotificationParams](../type-aliases/HandlePushNotificationParams.md)

#### Returns

`Promise`\<[`HandlePushNotificationResult`](HandlePushNotificationResult.md)\>

A promise resolving to the push notification result [HandlePushNotificationResult](HandlePushNotificationResult.md).

#### Inherited from

`WSClientContract.handlePushNotification`

***

### offline()

> **offline**(): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:61](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L61)

Mark the client as 'offline' to stop receiving calls over WebSocket.

#### Returns

`Promise`\<`void`\>

A promise that resolves when the client is successfully marked as offline.

#### Inherited from

`WSClientContract.offline`

***

### online()

> **online**(`incomingCallHandlers`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:54](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L54)

Mark the client as 'online' to receive calls over WebSocket.

#### Parameters

##### incomingCallHandlers

[`OnlineParams`](OnlineParams.md)

The handlers for processing incoming calls.

#### Returns

`Promise`\<`void`\>

A promise that resolves when the client is successfully marked as online.

#### Inherited from

`WSClientContract.online`

***

### reattach()

> **reattach**(`params`): `Promise`\<[`CallSession`](CallSession.md)\>

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:31](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L31)

Reattach to the previous call if the previous call was not disconnected

#### Parameters

##### params

[`ReattachParams`](ReattachParams.md)

[ReattachParams](ReattachParams.md)

#### Returns

`Promise`\<[`CallSession`](CallSession.md)\>

A Promise resolving to a [CallSession](CallSession.md) object.

#### Inherited from

`WSClientContract.reattach`

***

### registerDevice()

> **registerDevice**(`params`): `Promise`\<[`RegisterDeviceResponse`](RegisterDeviceResponse.md)\>

Defined in: [packages/client/src/unified/interfaces/httpClient.ts:44](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/httpClient.ts#L44)

Register a device to receive incoming call requests.

#### Parameters

##### params

[`RegisterDeviceParams`](RegisterDeviceParams.md)

The parameters required to register the device [RegisterDeviceParams](RegisterDeviceParams.md).

#### Returns

`Promise`\<[`RegisterDeviceResponse`](RegisterDeviceResponse.md)\>

A promise that resolves to the registration result [RegisterDeviceResult](../type-aliases/RegisterDeviceResult.md).

#### Inherited from

`Omit.registerDevice`

***

### unregisterDevice()

> **unregisterDevice**(`params`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/interfaces/httpClient.ts:51](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/httpClient.ts#L51)

Unregister a device to stop receiving incoming call requests.

#### Parameters

##### params

[`UnregisterDeviceParams`](UnregisterDeviceParams.md)

The parameters required to unregister the device [UnregisterDeviceParams](UnregisterDeviceParams.md).

#### Returns

`Promise`\<`void`\>

A promise that resolves when the device is successfully unregistered.

#### Inherited from

`Omit.unregisterDevice`

***

### updateToken()

> **updateToken**(`token`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:47](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L47)

Allow the user to update the authentication token.

#### Parameters

##### token

`string`

string: The new authentication token.

#### Returns

`Promise`\<`void`\>

A promise that resolves when the token is successfully updated.

#### Inherited from

`WSClientContract.updateToken`
