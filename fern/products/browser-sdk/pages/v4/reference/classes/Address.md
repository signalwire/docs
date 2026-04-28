# Class: Address

Defined in: [core/entities/Address.ts:31](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Address.ts#L31)

Represents a contact or room in the directory.

Provides identity metadata, conversation history, text messaging,
and activity state for an address entry.

## Extends

- `Destroyable`

## Constructors

### Constructor

> **new Address**(`addressId`, `conversationManager`, `addressProvider`): `Address`

Defined in: [core/entities/Address.ts:67](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Address.ts#L67)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `addressId` | `string` |
| `conversationManager` | `ConversationsProvider` |
| `addressProvider` | `AddressProvider`\<`Address`\> |

#### Returns

`Address`

#### Overrides

`Destroyable.constructor`

## Properties

| Property | Modifier | Type | Default value | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | `Destroyable._destroyed$` | [behaviors/Destroyable.ts:8](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L8) |
| <a id="history"></a> `history$` | `public` | `Observable`\<`EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`AddressHistory`](../interfaces/AddressHistory.md)\<`Address`\>\> \| `undefined`\> | `undefined` | Observable of call history for this address. Lazily loads conversation data. | - | [core/entities/Address.ts:49](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Address.ts#L49) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | `Destroyable.subjects` | [behaviors/Destroyable.ts:7](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L7) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | `Destroyable.subscriptions` | [behaviors/Destroyable.ts:6](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L6) |
| <a id="textmessages"></a> `textMessages$` | `public` | `Observable`\<`EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`TextMessage`](../interfaces/TextMessage.md)\<`Address`\>\> \| `undefined`\> | `undefined` | Observable of text messages for this address. Lazily loads conversation data. | - | [core/entities/Address.ts:43](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Address.ts#L43) |

## Accessors

- [`activity`](./Address/activity.md)
- [`activity$`](./Address/activity$.md)
- [`channels`](./Address/channels.md)
- [`channels$`](./Address/channels$.md)
- [`coverUrl`](./Address/coverUrl.md)
- [`coverUrl$`](./Address/coverUrl$.md)
- [`createdAt`](./Address/createdAt.md)
- [`defaultChannel`](./Address/defaultChannel.md)
- [`destroyed$`](./Address/destroyed$.md)
- [`displayName`](./Address/displayName.md)
- [`displayName$`](./Address/displayName$.md)
- [`history`](./Address/history.md)
- [`id`](./Address/id.md)
- [`locked`](./Address/locked.md)
- [`locked$`](./Address/locked$.md)
- [`name`](./Address/name.md)
- [`previewUrl`](./Address/previewUrl.md)
- [`previewUrl$`](./Address/previewUrl$.md)
- [`resourceId`](./Address/resourceId.md)
- [`resourceId$`](./Address/resourceId$.md)
- [`textMessage`](./Address/textMessage.md)
- [`type`](./Address/type.md)
- [`type$`](./Address/type$.md)

## Methods

- [`cachedObservable`](./Address/cachedObservable.md)
- [`createBehaviorSubject`](./Address/createBehaviorSubject.md)
- [`createReplaySubject`](./Address/createReplaySubject.md)
- [`createSubject`](./Address/createSubject.md)
- [`deferEmission`](./Address/deferEmission.md)
- [`destroy`](./Address/destroy.md)
- [`publicCachedObservable`](./Address/publicCachedObservable.md)
- [`sendText`](./Address/sendText.md)
- [`subscribeTo`](./Address/subscribeTo.md)
