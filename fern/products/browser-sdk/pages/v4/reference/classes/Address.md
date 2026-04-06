# Class: Address

Defined in: [core/entities/Address.ts:31](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L31)

Represents a contact or room in the directory.

Provides identity metadata, conversation history, text messaging,
and activity state for an address entry.

## Extends

- `Destroyable`

## Constructors

### Constructor

> **new Address**(`addressId`, `conversationManager`, `addressProvider`): `Address`

Defined in: [core/entities/Address.ts:67](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L67)

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
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | `Destroyable._destroyed$` | [behaviors/Destroyable.ts:17](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L17) |
| <a id="history"></a> `history$` | `public` | `Observable`\<`EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`AddressHistory`](../interfaces/AddressHistory.md)\<`Address`\>\> \| `undefined`\> | `undefined` | Observable of call history for this address. Lazily loads conversation data. | - | [core/entities/Address.ts:49](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L49) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | `Destroyable.subjects` | [behaviors/Destroyable.ts:16](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L16) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | `Destroyable.subscriptions` | [behaviors/Destroyable.ts:15](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L15) |
| <a id="textmessages"></a> `textMessages$` | `public` | `Observable`\<`EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`TextMessage`](../interfaces/TextMessage.md)\<`Address`\>\> \| `undefined`\> | `undefined` | Observable of text messages for this address. Lazily loads conversation data. | - | [core/entities/Address.ts:43](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L43) |

## Accessors

### $

#### Get Signature

> **get** **$**(): `Observable`\<`this`\>

Defined in: [behaviors/Destroyable.ts:100](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L100)

##### Returns

`Observable`\<`this`\>

#### Inherited from

`Destroyable.$`

***

### activity

#### Get Signature

> **get** **activity**(): [`CallState`](../interfaces/CallState.md)[]

Defined in: [core/entities/Address.ts:346](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L346)

Active call states for this address.

##### Throws

Requires presence support.

##### Returns

[`CallState`](../interfaces/CallState.md)[]

***

### activity$

#### Get Signature

> **get** **activity$**(): `Observable`\<[`CallState`](../interfaces/CallState.md)[]\>

Defined in: [core/entities/Address.ts:340](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L340)

Observable of active call states for this address.

##### Throws

Requires presence support.

##### Returns

`Observable`\<[`CallState`](../interfaces/CallState.md)[]\>

***

### channels

#### Get Signature

> **get** **channels**(): `object`

Defined in: [core/entities/Address.ts:229](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L229)

Available communication channels.

##### Returns

`object`

###### audio?

> `optional` **audio?**: `string`

###### messaging?

> `optional` **messaging?**: `string`

###### video?

> `optional` **video?**: `string`

***

### channels$

#### Get Signature

> **get** **channels$**(): `Observable`\<\{ `audio?`: `string`; `messaging?`: `string`; `video?`: `string`; \}\>

Defined in: [core/entities/Address.ts:213](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L213)

Observable of available communication channels (audio, video, messaging).

##### Returns

`Observable`\<\{ `audio?`: `string`; `messaging?`: `string`; `video?`: `string`; \}\>

***

### coverUrl

#### Get Signature

> **get** **coverUrl**(): `string` \| `undefined`

Defined in: [core/entities/Address.ts:165](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L165)

Cover image URL.

##### Returns

`string` \| `undefined`

***

### coverUrl$

#### Get Signature

> **get** **coverUrl$**(): `Observable`\<`string` \| `undefined`\>

Defined in: [core/entities/Address.ts:153](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L153)

Observable of the cover image URL.

##### Returns

`Observable`\<`string` \| `undefined`\>

***

### createdAt

#### Get Signature

> **get** **createdAt**(): `string`

Defined in: [core/entities/Address.ts:102](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L102)

ISO timestamp of when the address was created.

##### Returns

`string`

***

### defaultChannel

#### Get Signature

> **get** **defaultChannel**(): `string` \| `undefined`

Defined in: [core/entities/Address.ts:110](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L110)

Default communication channel URI (video for rooms, audio otherwise).

##### Returns

`string` \| `undefined`

***

### destroyed$

#### Get Signature

> **get** **destroyed$**(): `Observable`\<`void`\>

Defined in: [behaviors/Destroyable.ts:112](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L112)

Observable that emits when the instance is destroyed

##### Returns

`Observable`\<`void`\>

#### Inherited from

`Destroyable.destroyed$`

***

### displayName

#### Get Signature

> **get** **displayName**(): `string`

Defined in: [core/entities/Address.ts:126](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L126)

Human-readable display name.

##### Returns

`string`

***

### displayName$

#### Get Signature

> **get** **displayName$**(): `Observable`\<`string`\>

Defined in: [core/entities/Address.ts:115](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L115)

Observable of the human-readable display name.

##### Returns

`Observable`\<`string`\>

***

### history

#### Get Signature

> **get** **history**(): `EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`AddressHistory`](../interfaces/AddressHistory.md)\<`Address`\>\> \| `undefined`

Defined in: [core/entities/Address.ts:314](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L314)

Collection of call history entries for this address, with pagination support.

Returns `undefined` until [history$](#history) has been subscribed to (lazy-loaded).
Filters to `'log'` subtype messages including kind, status, start/end times.

##### See

[history$](#history) to trigger lazy loading.

##### Returns

`EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`AddressHistory`](../interfaces/AddressHistory.md)\<`Address`\>\> \| `undefined`

***

### id

#### Get Signature

> **get** **id**(): `string`

Defined in: [core/entities/Address.ts:90](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L90)

Unique address identifier.

##### Returns

`string`

***

### locked

#### Get Signature

> **get** **locked**(): `boolean`

Defined in: [core/entities/Address.ts:241](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L241)

Whether the address (room) is locked.

##### Returns

`boolean`

***

### locked$

#### Get Signature

> **get** **locked$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Address.ts:249](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L249)

Observable indicating whether the address (room) is locked.

##### Returns

`Observable`\<`boolean`\>

***

### name

#### Get Signature

> **get** **name**(): `string`

Defined in: [core/entities/Address.ts:94](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L94)

Address name (resource identifier).

##### Returns

`string`

***

### previewUrl

#### Get Signature

> **get** **previewUrl**(): `string` \| `undefined`

Defined in: [core/entities/Address.ts:145](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L145)

Preview image URL.

##### Returns

`string` \| `undefined`

***

### previewUrl$

#### Get Signature

> **get** **previewUrl$**(): `Observable`\<`string` \| `undefined`\>

Defined in: [core/entities/Address.ts:134](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L134)

Observable of the preview image URL.

##### Returns

`Observable`\<`string` \| `undefined`\>

***

### resourceId

#### Get Signature

> **get** **resourceId**(): `string`

Defined in: [core/entities/Address.ts:185](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L185)

Underlying resource ID.

##### Returns

`string`

***

### resourceId$

#### Get Signature

> **get** **resourceId$**(): `Observable`\<`string`\>

Defined in: [core/entities/Address.ts:173](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L173)

Observable of the underlying resource ID.

##### Returns

`Observable`\<`string`\>

***

### textMessage

#### Get Signature

> **get** **textMessage**(): `EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`TextMessage`](../interfaces/TextMessage.md)\<`Address`\>\> \| `undefined`

Defined in: [core/entities/Address.ts:283](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L283)

Collection of text messages for this address, with pagination support.

Returns `undefined` until [textMessages$](#textmessages) has been subscribed to (lazy-loaded).
Filters to `'chat'` subtype messages from the conversation.

##### See

 - [textMessages$](#textmessages) to trigger lazy loading.
 - [sendText](#sendtext) to send a new message.

##### Returns

`EntityCollectionTransformed`\<`GetConversationMessageResponse`, [`TextMessage`](../interfaces/TextMessage.md)\<`Address`\>\> \| `undefined`

***

### type

#### Get Signature

> **get** **type**(): `ResourceType`

Defined in: [core/entities/Address.ts:205](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L205)

Resource type (e.g. `'room'`, `'subscriber'`).

##### Returns

`ResourceType`

***

### type$

#### Get Signature

> **get** **type$**(): `Observable`\<`ResourceType`\>

Defined in: [core/entities/Address.ts:193](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L193)

Observable of the resource type (e.g. `'room'`, `'subscriber'`).

##### Returns

`Observable`\<`ResourceType`\>

## Methods

### cachedObservable()

> `protected` **cachedObservable**\<`T`\>(`key`, `factory`): `Observable`\<`T`\>

Defined in: [behaviors/Destroyable.ts:28](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L28)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `key` | `string` |
| `factory` | () => `Observable`\<`T`\> |

#### Returns

`Observable`\<`T`\>

#### Inherited from

`Destroyable.cachedObservable`

***

### createBehaviorSubject()

> `protected` **createBehaviorSubject**\<`T`\>(`initialValue`): `BehaviorSubject`\<`T`\>

Defined in: [behaviors/Destroyable.ts:94](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L94)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `initialValue` | `T` |

#### Returns

`BehaviorSubject`\<`T`\>

#### Inherited from

`Destroyable.createBehaviorSubject`

***

### createReplaySubject()

> `protected` **createReplaySubject**\<`T`\>(`bufferSize?`, `windowTime?`): `ReplaySubject`\<`T`\>

Defined in: [behaviors/Destroyable.ts:88](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L88)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `bufferSize?` | `number` |
| `windowTime?` | `number` |

#### Returns

`ReplaySubject`\<`T`\>

#### Inherited from

`Destroyable.createReplaySubject`

***

### createSubject()

> `protected` **createSubject**\<`T`\>(): `Subject`\<`T`\>

Defined in: [behaviors/Destroyable.ts:82](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L82)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Returns

`Subject`\<`T`\>

#### Inherited from

`Destroyable.createSubject`

***

### deferEmission()

> `protected` **deferEmission**\<`T`\>(`observable`): `Observable`\<`T`\>

Defined in: [behaviors/Destroyable.ts:70](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L70)

Wraps an observable so emissions are deferred to the microtask queue.

Use ONLY for public-facing getters that expose a subject via
`.asObservable()` without going through `cachedObservable`.

Do NOT use for observables consumed internally by the SDK.

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `observable` | `Observable`\<`T`\> |

#### Returns

`Observable`\<`T`\>

#### Inherited from

`Destroyable.deferEmission`

***

### destroy()

> **destroy**(): `void`

Defined in: [behaviors/Destroyable.ts:20](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L20)

#### Returns

`void`

#### Inherited from

`Destroyable.destroy`

***

### publicCachedObservable()

> `protected` **publicCachedObservable**\<`T`\>(`key`, `factory`): `Observable`\<`T`\>

Defined in: [behaviors/Destroyable.ts:51](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L51)

Like `cachedObservable`, but defers emissions to the microtask queue
via `observeOn(asapScheduler)`.

Use ONLY for public-facing observable getters that external consumers
subscribe to. Prevents a class of bugs where `BehaviorSubject` or
`ReplaySubject` replays synchronously during `subscribe()`, before
the subscription variable is assigned in the caller's scope.

Do NOT use for observables consumed internally by the SDK — internal
code using `subscribeTo()`, `firstValueFrom()`, or `withLatestFrom()`
depends on synchronous emission delivery.

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `key` | `string` |
| `factory` | () => `Observable`\<`T`\> |

#### Returns

`Observable`\<`T`\>

#### Inherited from

`Destroyable.publicCachedObservable`

***

### sendText()

> **sendText**(`text`): `Promise`\<`void`\>

Defined in: [core/entities/Address.ts:270](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Address.ts#L270)

Sends a text message to this address.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `text` | `string` | The message text to send. |

#### Returns

`Promise`\<`void`\>

#### Example

```ts
await address.sendText('Hello!');
```

***

### subscribeTo()

> `protected` **subscribeTo**\<`T`\>(`observable`, `observerOrNext`): `void`

Defined in: [behaviors/Destroyable.ts:74](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L74)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `observable` | `Observable`\<`T`\> |
| `observerOrNext` | `Partial`\<`Observer`\<`T`\>\> \| ((`value`) => `void`) \| `undefined` |

#### Returns

`void`

#### Inherited from

`Destroyable.subscribeTo`
