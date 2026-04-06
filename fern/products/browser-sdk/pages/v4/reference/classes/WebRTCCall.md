# Class: WebRTCCall

Defined in: [core/entities/Call.ts:121](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L121)

Concrete WebRTC call implementation.

Manages the full lifecycle of a call including signaling, media streams,
participants, layout, and event routing. Created via [SignalWire.dial](SignalWire.md#dial)
or received as an inbound call.

## Extends

- `Destroyable`

## Implements

- `CallManager`

## Constructors

### Constructor

> **new WebRTCCall**(`clientSession`, `options`, `initialization`, `address?`): `WebRTCCall`

Defined in: [core/entities/Call.ts:139](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L139)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `clientSession` | `ClientSession` |
| `options` | [`CallOptions`](../interfaces/CallOptions.md) |
| `initialization` | `CallInitialization` |
| `address?` | [`Address`](Address.md) |

#### Returns

`WebRTCCall`

#### Overrides

`Destroyable.constructor`

## Properties

| Property | Modifier | Type | Default value | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | `Destroyable._destroyed$` | [behaviors/Destroyable.ts:17](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L17) |
| <a id="address"></a> `address?` | `public` | [`Address`](Address.md) | `undefined` | - | - | [core/entities/Call.ts:143](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L143) |
| <a id="clientsession"></a> `clientSession` | `public` | `ClientSession` | `undefined` | - | - | [core/entities/Call.ts:140](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L140) |
| <a id="id"></a> `id` | `readonly` | `string` | `undefined` | Unique identifier for this call. | - | [core/entities/Call.ts:123](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L123) |
| <a id="options"></a> `options` | `public` | [`CallOptions`](../interfaces/CallOptions.md) | `undefined` | - | - | [core/entities/Call.ts:141](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L141) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | `Destroyable.subjects` | [behaviors/Destroyable.ts:16](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L16) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | `Destroyable.subscriptions` | [behaviors/Destroyable.ts:15](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L15) |
| <a id="to"></a> `to?` | `public` | `string` | `undefined` | Destination URI this call was placed to. | - | [core/entities/Call.ts:125](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L125) |

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

### address$

#### Get Signature

> **get** **address$**(): `Observable`\<[`Address`](Address.md) \| `undefined`\>

Defined in: [core/entities/Call.ts:209](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L209)

Observable of the address associated with this call.

##### Returns

`Observable`\<[`Address`](Address.md) \| `undefined`\>

#### Implementation of

`CallManager.address$`

***

### answered$

#### Get Signature

> **get** **answered$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Call.ts:818](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L818)

Observable that emits `true` when answered, `false` when rejected.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

`CallManager.answered$`

***

### answerMediaOptions

#### Get Signature

> **get** **answerMediaOptions**(): [`MediaOptions`](../interfaces/MediaOptions.md) \| `undefined`

Defined in: [core/entities/Call.ts:803](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L803)

Media options provided when answering. Used internally by the VertoManager.

##### Returns

[`MediaOptions`](../interfaces/MediaOptions.md) \| `undefined`

#### Implementation of

`CallManager.answerMediaOptions`

***

### callEvent$

#### Get Signature

> **get** **callEvent$**(): `Observable`\<`WebrtcMessagePayload` \| `CallJoinedPayload` \| `CallLeftPayload` \| `MemberUpdatedPayload` \| `MemberJoinedPayload` \| `MemberLeftPayload` \| `MemberTalkingPayload` \| `LayoutChangedPayload` \| `CallUpdatedPayload` \| `RoomUpdatedPayload` \| `CallStatePayload` \| `CallPlayPayload` \| `CallConnectPayload` \| `ConversationMessagePayload`\>

Defined in: [core/entities/Call.ts:728](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L728)

Observable of call-level signaling events.

##### Returns

`Observable`\<`WebrtcMessagePayload` \| `CallJoinedPayload` \| `CallLeftPayload` \| `MemberUpdatedPayload` \| `MemberJoinedPayload` \| `MemberLeftPayload` \| `MemberTalkingPayload` \| `LayoutChangedPayload` \| `CallUpdatedPayload` \| `RoomUpdatedPayload` \| `CallStatePayload` \| `CallPlayPayload` \| `CallConnectPayload` \| `ConversationMessagePayload`\>

#### Implementation of

`CallManager.callEvent$`

***

### callStates$

#### Get Signature

> **get** **callStates$**(): `Observable`\<`CallStatePayload`\>

Defined in: [core/entities/Call.ts:681](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L681)

Observable of call state-change events.

##### Returns

`Observable`\<`CallStatePayload`\>

#### Implementation of

`CallManager.callStates$`

***

### callUpdated$

#### Get Signature

> **get** **callUpdated$**(): `Observable`\<`CallUpdatedPayload`\>

Defined in: [core/entities/Call.ts:632](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L632)

Observable of call-updated events.

##### Returns

`Observable`\<`CallUpdatedPayload`\>

#### Implementation of

`CallManager.callUpdated$`

***

### capabilities

#### Get Signature

> **get** **capabilities**(): `string`[]

Defined in: [core/entities/Call.ts:246](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L246)

List of capabilities available in the current call.

##### Returns

`string`[]

#### Implementation of

`CallManager.capabilities`

***

### capabilities$

#### Get Signature

> **get** **capabilities$**(): `Observable`\<`string`[]\>

Defined in: [core/entities/Call.ts:441](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L441)

Observable of the call's capability flags.

##### Returns

`Observable`\<`string`[]\>

#### Implementation of

`CallManager.capabilities$`

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

### direction

#### Get Signature

> **get** **direction**(): `CallDirection`

Defined in: [core/entities/Call.ts:204](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L204)

Whether this call is `'inbound'` or `'outbound'`.

##### Returns

`CallDirection`

#### Implementation of

`CallManager.direction`

***

### errors$

#### Get Signature

> **get** **errors$**(): `Observable`\<[`CallError`](../interfaces/CallError.md)\>

Defined in: [core/entities/Call.ts:186](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L186)

Observable stream of errors from media, signaling, and peer connection layers.

##### Returns

`Observable`\<[`CallError`](../interfaces/CallError.md)\>

#### Implementation of

`CallManager.errors$`

***

### from

#### Get Signature

> **get** **from**(): `string` \| `undefined`

Defined in: [core/entities/Call.ts:219](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L219)

Address URI of the caller.

##### Returns

`string` \| `undefined`

#### Implementation of

`CallManager.from`

***

### fromName

#### Get Signature

> **get** **fromName**(): `string` \| `undefined`

Defined in: [core/entities/Call.ts:214](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L214)

Display name of the caller.

##### Returns

`string` \| `undefined`

#### Implementation of

`CallManager.fromName`

***

### layout

#### Get Signature

> **get** **layout**(): `string` \| `undefined`

Defined in: [core/entities/Call.ts:483](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L483)

Current layout name, or `undefined` if not set.

##### Returns

`string` \| `undefined`

#### Implementation of

`CallManager.layout`

***

### layout$

#### Get Signature

> **get** **layout$**(): `Observable`\<`string`\>

Defined in: [core/entities/Call.ts:448](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L448)

Observable of the current layout name.

##### Returns

`Observable`\<`string`\>

#### Implementation of

`CallManager.layout$`

***

### layoutEvent$

#### Get Signature

> **get** **layoutEvent$**(): `Observable`\<`LayoutChangedPayload`\>

Defined in: [core/entities/Call.ts:741](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L741)

Observable of layout-changed signaling events.

##### Returns

`Observable`\<`LayoutChangedPayload`\>

***

### layoutLayers

#### Get Signature

> **get** **layoutLayers**(): [`LayoutLayer`](../interfaces/LayoutLayer.md)[]

Defined in: [core/entities/Call.ts:324](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L324)

Current snapshot of layout layers.

##### Returns

[`LayoutLayer`](../interfaces/LayoutLayer.md)[]

#### Implementation of

`CallManager.layoutLayers`

***

### layoutLayers$

#### Get Signature

> **get** **layoutLayers$**(): `Observable`\<[`LayoutLayer`](../interfaces/LayoutLayer.md)[]\>

Defined in: [core/entities/Call.ts:317](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L317)

Observable of layout layer positions for all participants.

##### Returns

`Observable`\<[`LayoutLayer`](../interfaces/LayoutLayer.md)[]\>

#### Implementation of

`CallManager.layoutLayers$`

***

### layouts

#### Get Signature

> **get** **layouts**(): `string`[]

Defined in: [core/entities/Call.ts:493](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L493)

Current snapshot of available layout names.

##### Returns

`string`[]

#### Implementation of

`CallManager.layouts`

***

### layouts$

#### Get Signature

> **get** **layouts$**(): `Observable`\<`string`[]\>

Defined in: [core/entities/Call.ts:488](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L488)

Observable of available layout names.

##### Returns

`Observable`\<`string`[]\>

#### Implementation of

`CallManager.layouts$`

***

### layoutUpdates$

#### Get Signature

> **get** **layoutUpdates$**(): `Observable`\<`LayoutChangedPayload`\>

Defined in: [core/entities/Call.ts:691](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L691)

Observable of layout-changed events.

##### Returns

`Observable`\<`LayoutChangedPayload`\>

#### Implementation of

`CallManager.layoutUpdates$`

***

### localStream

#### Get Signature

> **get** **localStream**(): `MediaStream` \| `null`

Defined in: [core/entities/Call.ts:502](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L502)

Current local media stream, or `null` if not available.

##### Returns

`MediaStream` \| `null`

#### Implementation of

`CallManager.localStream`

***

### localStream$

#### Get Signature

> **get** **localStream$**(): `Observable`\<`MediaStream`\>

Defined in: [core/entities/Call.ts:498](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L498)

Observable of the local media stream (camera/microphone).

##### Returns

`Observable`\<`MediaStream`\>

#### Implementation of

`CallManager.localStream$`

***

### locked

#### Get Signature

> **get** **locked**(): `boolean`

Defined in: [core/entities/Call.ts:473](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L473)

Whether the call room is locked.

##### Returns

`boolean`

#### Implementation of

`CallManager.locked`

***

### locked$

#### Get Signature

> **get** **locked$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Call.ts:431](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L431)

Observable indicating whether the call room is locked.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

`CallManager.locked$`

***

### mediaDirections

#### Get Signature

> **get** **mediaDirections**(): [`MediaDirections`](../interfaces/MediaDirections.md)

Defined in: [core/entities/Call.ts:548](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L548)

Current audio/video send/receive directions.

##### Returns

[`MediaDirections`](../interfaces/MediaDirections.md)

#### Implementation of

`CallManager.mediaDirections`

***

### mediaDirections$

#### Get Signature

> **get** **mediaDirections$**(): `Observable`\<[`MediaDirections`](../interfaces/MediaDirections.md)\>

Defined in: [core/entities/Call.ts:543](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L543)

Observable of the current audio/video send/receive directions.

##### Returns

`Observable`\<[`MediaDirections`](../interfaces/MediaDirections.md)\>

#### Implementation of

`CallManager.mediaDirections$`

***

### memberJoined$

#### Get Signature

> **get** **memberJoined$**(): `Observable`\<`MemberJoinedPayload`\>

Defined in: [core/entities/Call.ts:642](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L642)

Observable of member-joined events, emitted when a remote participant joins the call.

##### Returns

`Observable`\<`MemberJoinedPayload`\>

#### Implementation of

`CallManager.memberJoined$`

***

### memberLeft$

#### Get Signature

> **get** **memberLeft$**(): `Observable`\<`MemberLeftPayload`\>

Defined in: [core/entities/Call.ts:652](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L652)

Observable of member-left events, emitted when a participant leaves the call.

##### Returns

`Observable`\<`MemberLeftPayload`\>

#### Implementation of

`CallManager.memberLeft$`

***

### memberTalking$

#### Get Signature

> **get** **memberTalking$**(): `Observable`\<`MemberTalkingPayload`\>

Defined in: [core/entities/Call.ts:671](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L671)

Observable of member-talking events (speech start/stop).

##### Returns

`Observable`\<`MemberTalkingPayload`\>

#### Implementation of

`CallManager.memberTalking$`

***

### memberUpdated$

#### Get Signature

> **get** **memberUpdated$**(): `Observable`\<`MemberUpdatedPayload`\>

Defined in: [core/entities/Call.ts:661](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L661)

Observable of member-updated events (mute, volume, etc.).

##### Returns

`Observable`\<`MemberUpdatedPayload`\>

#### Implementation of

`CallManager.memberUpdated$`

***

### meta

#### Get Signature

> **get** **meta**(): `Record`\<`string`, `unknown`\>

Defined in: [core/entities/Call.ts:478](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L478)

Current custom metadata of the call.

##### Returns

`Record`\<`string`, `unknown`\>

#### Implementation of

`CallManager.meta`

***

### meta$

#### Get Signature

> **get** **meta$**(): `Observable`\<`Record`\<`string`, `unknown`\>\>

Defined in: [core/entities/Call.ts:436](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L436)

Observable of custom metadata associated with the call.

##### Returns

`Observable`\<`Record`\<`string`, `unknown`\>\>

#### Implementation of

`CallManager.meta$`

***

### nodeId

#### Get Signature

> **get** **nodeId**(): `string` \| `null`

Defined in: [core/entities/Call.ts:593](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L593)

Server node ID handling this call, or `null`.

##### Returns

`string` \| `null`

#### Implementation of

`CallManager.nodeId`

***

### nodeId$

#### Get Signature

> **get** **nodeId$**(): `Observable`\<`string` \| `null`\>

Defined in: [core/entities/Call.ts:588](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L588)

Observable of the server node ID handling this call.

##### Returns

`Observable`\<`string` \| `null`\>

#### Implementation of

`CallManager.nodeId$`

***

### participants

#### Get Signature

> **get** **participants**(): [`CallParticipant`](../interfaces/CallParticipant.md)[]

Defined in: [core/entities/Call.ts:251](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L251)

Current snapshot of all participants in the call.

##### Returns

[`CallParticipant`](../interfaces/CallParticipant.md)[]

#### Implementation of

`CallManager.participants`

***

### participants$

#### Get Signature

> **get** **participants$**(): `Observable`\<[`CallParticipant`](../interfaces/CallParticipant.md)[]\>

Defined in: [core/entities/Call.ts:404](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L404)

Observable of the participants list, emits on join/leave/update.

##### Returns

`Observable`\<[`CallParticipant`](../interfaces/CallParticipant.md)[]\>

#### Implementation of

`CallManager.participants$`

***

### participantsId$

#### Get Signature

> **get** `protected` **participantsId$**(): `Observable`\<`string`[]\>

Defined in: [core/entities/Call.ts:552](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L552)

##### Returns

`Observable`\<`string`[]\>

***

### raiseHandPriority

#### Get Signature

> **get** **raiseHandPriority**(): `boolean`

Defined in: [core/entities/Call.ts:468](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L468)

Whether raise-hand priority is active.

##### Returns

`boolean`

#### Implementation of

`CallManager.raiseHandPriority`

***

### raiseHandPriority$

#### Get Signature

> **get** **raiseHandPriority$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Call.ts:424](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L424)

Observable indicating whether raise-hand priority is active.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

`CallManager.raiseHandPriority$`

***

### recording

#### Get Signature

> **get** **recording**(): `boolean`

Defined in: [core/entities/Call.ts:458](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L458)

Whether the call is currently being recorded.

##### Returns

`boolean`

#### Implementation of

`CallManager.recording`

***

### recording$

#### Get Signature

> **get** **recording$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Call.ts:414](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L414)

Observable indicating whether the call is being recorded.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

`CallManager.recording$`

***

### remoteStream

#### Get Signature

> **get** **remoteStream**(): `MediaStream` \| `null`

Defined in: [core/entities/Call.ts:510](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L510)

Current remote media stream, or `null` if not available.

##### Returns

`MediaStream` \| `null`

#### Implementation of

`CallManager.remoteStream`

***

### remoteStream$

#### Get Signature

> **get** **remoteStream$**(): `Observable`\<`MediaStream`\>

Defined in: [core/entities/Call.ts:506](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L506)

Observable of the remote media stream from the far end.

##### Returns

`Observable`\<`MediaStream`\>

#### Implementation of

`CallManager.remoteStream$`

***

### rtcPeerConnection

#### Get Signature

> **get** **rtcPeerConnection**(): `RTCPeerConnection` \| `undefined`

Defined in: [core/entities/Call.ts:701](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L701)

Underlying `RTCPeerConnection`, for advanced use cases.

##### Returns

`RTCPeerConnection` \| `undefined`

#### Implementation of

`CallManager.rtcPeerConnection`

***

### self

#### Get Signature

> **get** **self**(): [`CallSelfParticipant`](../interfaces/CallSelfParticipant.md) \| `null`

Defined in: [core/entities/Call.ts:256](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L256)

The local participant, or `null` if not yet joined.

##### Returns

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md) \| `null`

#### Implementation of

`CallManager.self`

***

### self$

#### Get Signature

> **get** **self$**(): `Observable`\<[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md)\>

Defined in: [core/entities/Call.ts:410](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L410)

Observable of the local (self) participant.

##### Returns

`Observable`\<[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md)\>

#### Implementation of

`CallManager.self$`

***

### selfId

#### Get Signature

> **get** **selfId**(): `string` \| `null`

Defined in: [core/entities/Call.ts:583](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L583)

Local participant's member ID, or `null` if not joined.

##### Returns

`string` \| `null`

#### Implementation of

`CallManager.selfId`

***

### selfId$

#### Get Signature

> **get** **selfId$**(): `Observable`\<`string` \| `null`\>

Defined in: [core/entities/Call.ts:578](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L578)

Observable of the local participant's member ID.

##### Returns

`Observable`\<`string` \| `null`\>

#### Implementation of

`CallManager.selfId$`

***

### signalingEvent$

#### Get Signature

> **get** **signalingEvent$**(): `Observable`\<`Record`\<`string`, `unknown`\>\>

Defined in: [core/entities/Call.ts:705](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L705)

Observable of raw signaling events as plain objects.

##### Returns

`Observable`\<`Record`\<`string`, `unknown`\>\>

#### Implementation of

`CallManager.signalingEvent$`

***

### status

#### Get Signature

> **get** **status**(): [`CallStatus`](../type-aliases/CallStatus.md)

Defined in: [core/entities/Call.ts:453](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L453)

Current call status.

##### Returns

[`CallStatus`](../type-aliases/CallStatus.md)

#### Implementation of

`CallManager.status`

***

### status$

#### Get Signature

> **get** **status$**(): `Observable`\<[`CallStatus`](../type-aliases/CallStatus.md)\>

Defined in: [core/entities/Call.ts:393](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L393)

Observable of the current call status (e.g. `'ringing'`, `'connected'`).

##### Returns

`Observable`\<[`CallStatus`](../type-aliases/CallStatus.md)\>

#### Implementation of

`CallManager.status$`

***

### streaming

#### Get Signature

> **get** **streaming**(): `boolean`

Defined in: [core/entities/Call.ts:463](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L463)

Whether the call is currently being streamed.

##### Returns

`boolean`

#### Implementation of

`CallManager.streaming`

***

### streaming$

#### Get Signature

> **get** **streaming$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Call.ts:419](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L419)

Observable indicating whether the call is being streamed.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

`CallManager.streaming$`

***

### toName

#### Get Signature

> **get** **toName**(): `string` \| `undefined`

Defined in: [core/entities/Call.ts:224](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L224)

Display name of the callee.

##### Returns

`string` \| `undefined`

#### Implementation of

`CallManager.toName`

***

### userVariables

#### Get Signature

> **get** **userVariables**(): `Record`\<`string`, `unknown`\>

Defined in: [core/entities/Call.ts:520](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L520)

a copy of the current custom user variables of the call.

##### Returns

`Record`\<`string`, `unknown`\>

#### Set Signature

> **set** **userVariables**(`variables`): `void`

Defined in: [core/entities/Call.ts:525](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L525)

Merge current custom user variables of the call.

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `variables` | `Record`\<`string`, `unknown`\> |

##### Returns

`void`

#### Implementation of

`CallManager.userVariables`

***

### userVariables$

#### Get Signature

> **get** **userVariables$**(): `Observable`\<`Record`\<`string`, `unknown`\>\>

Defined in: [core/entities/Call.ts:515](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L515)

Observable of custom user variables associated with the call.

##### Returns

`Observable`\<`Record`\<`string`, `unknown`\>\>

#### Implementation of

`CallManager.userVariables$`

***

### webrtcMessages$

#### Get Signature

> **get** **webrtcMessages$**(): `Observable`\<`WebrtcMessagePayload`\>

Defined in: [core/entities/Call.ts:715](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L715)

Observable of WebRTC-specific signaling messages.

##### Returns

`Observable`\<`WebrtcMessagePayload`\>

## Methods

### answer()

> **answer**(`options?`): `void`

Defined in: [core/entities/Call.ts:797](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L797)

Accepts an inbound call, optionally overriding media options for the answer.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `options?` | [`MediaOptions`](../interfaces/MediaOptions.md) | Optional media constraints for the answer (audio/video). |

#### Returns

`void`

#### Example

```ts
// Accept with defaults
call.answer();

// Accept audio-only
call.answer({ audio: true, video: false });
```

#### See

 - [reject](#reject) to decline the call instead.
 - [answered$](#answered) to observe the acceptance state.

#### Implementation of

`CallManager.answer`

***

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

Defined in: [core/entities/Call.ts:864](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L864)

Destroys the call, releasing all resources and subscriptions.

#### Returns

`void`

#### Implementation of

`CallManager.destroy`

#### Overrides

`Destroyable.destroy`

***

### execute()

> **execute**\<`T`\>(`request`, `options?`): `Promise`\<`T`\>

Defined in: [core/entities/Call.ts:570](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L570)

Executes a raw JSON-RPC request on the client session.

Lower-level than [executeMethod](#executemethod) — allows full control over the RPC request structure.

#### Type Parameters

| Type Parameter | Default type |
| ------ | ------ |
| `T` *extends* [`JSONRPCResponse`](../type-aliases/JSONRPCResponse.md) | [`JSONRPCResponse`](../type-aliases/JSONRPCResponse.md) |

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `request` | [`JSONRPCRequest`](../interfaces/JSONRPCRequest.md) | Complete JSON-RPC request object. |
| `options?` | [`PendingRPCOptions`](../interfaces/PendingRPCOptions.md) | Optional RPC execution options (timeout, etc.). |

#### Returns

`Promise`\<`T`\>

The RPC response.

#### Throws

If the RPC call returns an error response.

#### Implementation of

`CallManager.execute`

***

### executeMethod()

> **executeMethod**\<`T`\>(`target`, `method`, `args`): `Promise`\<`T`\>

Defined in: [core/entities/Call.ts:339](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L339)

Executes a Verto RPC method targeting a specific participant.

Constructs call context (node_id, call_id, member_id) and sends the RPC request.

#### Type Parameters

| Type Parameter | Default type |
| ------ | ------ |
| `T` *extends* [`JSONRPCResponse`](../type-aliases/JSONRPCResponse.md) | [`JSONRPCResponse`](../type-aliases/JSONRPCResponse.md) |

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

***

### hangup()

> **hangup**(): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:758](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L758)

Hangs up the call and releases all resources.

Sends a Verto `bye` to the server, transitions status to `'disconnecting'`,
then destroys the call. After this, the call instance is no longer usable.

#### Returns

`Promise`\<`void`\>

#### Example

```ts
await call.hangup();
```

#### Implementation of

`CallManager.hangup`

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

### reject()

> **reject**(): `void`

Defined in: [core/entities/Call.ts:813](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L813)

Rejects an inbound call, preventing media negotiation.

#### Returns

`void`

#### See

 - [answer](#answer) to accept the call instead.
 - [answered$](#answered) to observe the rejection state.

#### Implementation of

`CallManager.reject`

***

### sendDigits()

> **sendDigits**(`dtmf`): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:777](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L777)

Sends DTMF digits on the call.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `dtmf` | `string` | The digit string to send (e.g. `'1234#'`). |

#### Returns

`Promise`\<`void`\>

#### Example

```ts
await call.sendDigits('1234#');
```

#### Implementation of

`CallManager.sendDigits`

***

### setLayout()

> **setLayout**(`layout`, `positions`): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:836](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L836)

Sets the call layout and participant positions.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `layout` | `string` | Layout name (must be one of [layouts](#layouts)). |
| `positions` | `Record`\<`string`, [`VideoPosition`](../type-aliases/VideoPosition.md)\> | Map of member IDs to [VideoPosition](../type-aliases/VideoPosition.md) values. |

#### Returns

`Promise`\<`void`\>

#### Throws

If the layout is not in the available [layouts](#layouts).

#### Example

```ts
await call.setLayout('grid-responsive', {
  [participantId]: 'reserved-0',
});
```

#### Implementation of

`CallManager.setLayout`

***

### setMeta()

> **setMeta**(`_meta`): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:301](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L301)

Replaces the call's custom metadata.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `_meta` | `Record`\<`string`, `unknown`\> | Metadata object to set. |

#### Returns

`Promise`\<`void`\>

#### Throws

Not yet implemented.

#### Implementation of

`CallManager.setMeta`

***

### startRecording()

> **startRecording**(): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:282](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L282)

#### Returns

`Promise`\<`void`\>

#### Throws

Not yet implemented. Status tracked via [recording$](#recording-1).

#### Implementation of

`CallManager.startRecording`

***

### startStreaming()

> **startStreaming**(): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:289](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L289)

#### Returns

`Promise`\<`void`\>

#### Throws

Not yet implemented. Status tracked via [streaming$](#streaming-1).

#### Implementation of

`CallManager.startStreaming`

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

***

### toggleHold()

> **toggleHold**(): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:271](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L271)

Toggles the hold state of the call (pauses/resumes local media transmission).

Distinct from [Participant.toggleMute](Participant.md#togglemute) which mutes individual tracks.

#### Returns

`Promise`\<`void`\>

#### Implementation of

`CallManager.toggleHold`

***

### toggleIncomingAudio()

> **toggleIncomingAudio**(): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:236](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L236)

Toggles whether incoming audio is received.

#### Returns

`Promise`\<`void`\>

#### Throws

Not yet implemented.

#### Implementation of

`CallManager.toggleIncomingAudio`

***

### toggleIncomingVideo()

> **toggleIncomingVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:230](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L230)

Toggles whether incoming video is received.

#### Returns

`Promise`\<`void`\>

#### Throws

Not yet implemented.

#### Implementation of

`CallManager.toggleIncomingVideo`

***

### toggleLock()

> **toggleLock**(): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:261](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L261)

Toggles the call lock state, preventing or allowing new participants from joining.

#### Returns

`Promise`\<`void`\>

#### Implementation of

`CallManager.toggleLock`

***

### transfer()

> **transfer**(`options`): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:859](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L859)

Transfers the call to another destination.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `options` | [`TransferOptions`](../interfaces/TransferOptions.md) | Transfer configuration including the target destination. |

#### Returns

`Promise`\<`void`\>

#### See

[status$](#status-1) to observe the transfer progress.

#### Implementation of

`CallManager.transfer`

***

### updateMeta()

> **updateMeta**(`_meta`): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:311](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Call.ts#L311)

Merges values into the call's custom metadata (unlike [setMeta](#setmeta) which replaces).

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `_meta` | `Record`\<`string`, `unknown`\> | Metadata to merge. |

#### Returns

`Promise`\<`void`\>

#### Throws

Not yet implemented.

#### Implementation of

`CallManager.updateMeta`
