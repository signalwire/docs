---
title: "Address"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Address.ts#L31)</sub>

Represents a contact or room in the directory.

Provides identity metadata, conversation history, text messaging,
and activity state for an address entry.

## Extends

- `Destroyable`

## Constructors

### Constructor

> **new Address**(`addressId`, `conversationManager`, `addressProvider`): `Address`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Address.ts#L67)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `addressId` | `string` |
| `conversationManager` | `ConversationsProvider` |
| `addressProvider` | `AddressProvider`\<`Address`\> |

#### Returns

`Address`

## Properties

| Property | Modifier | Type | Default value | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | `Destroyable._destroyed$` | [behaviors/Destroyable.ts:8](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L8) |
| `history$` | `public` | `Observable`\<`EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`AddressHistory`](../interfaces/AddressHistory.md)\<`Address`\>\> \| `undefined`\> | `undefined` | Observable of call history for this address. Lazily loads conversation data. | - | [core/entities/Address.ts:49](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Address.ts#L49) |
| `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | `Destroyable.subjects` | [behaviors/Destroyable.ts:7](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L7) |
| `subscriptions` | `protected` | `Subscription`[] | `[]` | - | `Destroyable.subscriptions` | [behaviors/Destroyable.ts:6](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L6) |
| `textMessages$` | `public` | `Observable`\<`EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`TextMessage`](../interfaces/TextMessage.md)\<`Address`\>\> \| `undefined`\> | `undefined` | Observable of text messages for this address. Lazily loads conversation data. | - | [core/entities/Address.ts:43](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Address.ts#L43) |

## Accessors

- [`activity$`](./activity$.md)
- [`channels$`](./channels$.md)
- [`coverUrl$`](./coverUrl$.md)
- [`createdAt`](./createdAt.md)
- [`defaultChannel`](./defaultChannel.md)
- [`destroyed$`](./destroyed$.md)
- [`displayName$`](./displayName$.md)
- [`history`](./history.md)
- [`id`](./id.md)
- [`locked$`](./locked$.md)
- [`name`](./name.md)
- [`previewUrl$`](./previewUrl$.md)
- [`resourceId$`](./resourceId$.md)
- [`textMessage`](./textMessage.md)
- [`type$`](./type$.md)

## Methods

- [`cachedObservable`](./cachedObservable.md)
- [`createBehaviorSubject`](./createBehaviorSubject.md)
- [`createReplaySubject`](./createReplaySubject.md)
- [`createSubject`](./createSubject.md)
- [`deferEmission`](./deferEmission.md)
- [`destroy`](./destroy.md)
- [`publicCachedObservable`](./publicCachedObservable.md)
- [`sendText`](./sendText.md)
- [`subscribeTo`](./subscribeTo.md)
