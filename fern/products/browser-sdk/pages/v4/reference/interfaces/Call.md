# Interface: Call

Defined in: [core/entities/types/call.types.ts:226](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L226)

Public interface for an active WebRTC call.

Provides access to media streams, participants, layout, signaling events,
and control actions (hangup, mute, transfer, etc.).

## Extends

- [`CallState`](CallState.md)

## Properties

| Property | Modifier | Type | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="address"></a> `address?` | `readonly` | [`CallAddress`](CallAddress.md) | - | [core/entities/types/call.types.ts:248](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L248) |
| <a id="address-1"></a> `address$` | `readonly` | `Observable`\<[`CallAddress`](CallAddress.md) \| `undefined`\> | - | [core/entities/types/call.types.ts:249](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L249) |
| <a id="capabilities"></a> `capabilities` | `readonly` | `string`[] | - | [core/entities/types/call.types.ts:228](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L228) |
| <a id="capabilities-1"></a> `capabilities$` | `readonly` | `Observable`\<`string`[]\> | - | [core/entities/types/call.types.ts:227](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L227) |
| <a id="direction"></a> `direction` | `readonly` | `"inbound"` \| `"outbound"` | - | [core/entities/types/call.types.ts:234](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L234) |
| <a id="errors"></a> `errors$` | `readonly` | `Observable`\<[`CallError`](CallError.md)\> | - | [core/entities/types/call.types.ts:246](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L246) |
| <a id="id"></a> `id` | `readonly` | `string` | [`CallState`](CallState.md).[`id`](CallState.md#id) | [core/entities/types/call.types.ts:197](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L197) |
| <a id="layout"></a> `layout?` | `readonly` | `string` | - | [core/entities/types/call.types.ts:238](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L238) |
| <a id="layout-1"></a> `layout$` | `readonly` | `Observable`\<`string`\> | - | [core/entities/types/call.types.ts:237](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L237) |
| <a id="layoutlayers"></a> `layoutLayers` | `readonly` | [`LayoutLayer`](LayoutLayer.md)[] | - | [core/entities/types/call.types.ts:240](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L240) |
| <a id="layoutlayers-1"></a> `layoutLayers$` | `readonly` | `Observable`\<[`LayoutLayer`](LayoutLayer.md)[]\> | - | [core/entities/types/call.types.ts:239](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L239) |
| <a id="layouts"></a> `layouts` | `readonly` | `string`[] | - | [core/entities/types/call.types.ts:236](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L236) |
| <a id="layouts-1"></a> `layouts$` | `readonly` | `Observable`\<`string`[]\> | - | [core/entities/types/call.types.ts:235](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L235) |
| <a id="localstream"></a> `localStream` | `readonly` | `MediaStream` \| `null` | - | [core/entities/types/call.types.ts:242](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L242) |
| <a id="localstream-1"></a> `localStream$` | `readonly` | `Observable`\<`MediaStream` \| `null`\> | - | [core/entities/types/call.types.ts:241](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L241) |
| <a id="locked"></a> `locked` | `readonly` | `boolean` | [`CallState`](CallState.md).[`locked`](CallState.md#locked) | [core/entities/types/call.types.ts:207](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L207) |
| <a id="locked-1"></a> `locked$` | `readonly` | `Observable`\<`boolean`\> | [`CallState`](CallState.md).[`locked$`](CallState.md#locked-1) | [core/entities/types/call.types.ts:206](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L206) |
| <a id="mediadirections"></a> `mediaDirections` | `readonly` | [`MediaDirections`](MediaDirections.md) | - | [core/entities/types/call.types.ts:230](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L230) |
| <a id="mediadirections-1"></a> `mediaDirections$` | `readonly` | `Observable`\<[`MediaDirections`](MediaDirections.md)\> | - | [core/entities/types/call.types.ts:229](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L229) |
| <a id="meta"></a> `meta` | `readonly` | `Record`\<`string`, `unknown`\> | [`CallState`](CallState.md).[`meta`](CallState.md#meta) | [core/entities/types/call.types.ts:209](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L209) |
| <a id="meta-1"></a> `meta$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | [`CallState`](CallState.md).[`meta$`](CallState.md#meta-1) | [core/entities/types/call.types.ts:208](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L208) |
| <a id="participants"></a> `participants` | `readonly` | [`CallParticipant`](CallParticipant.md)[] | [`CallState`](CallState.md).[`participants`](CallState.md#participants) | [core/entities/types/call.types.ts:211](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L211) |
| <a id="participants-1"></a> `participants$` | `readonly` | `Observable`\<[`CallParticipant`](CallParticipant.md)[]\> | [`CallState`](CallState.md).[`participants$`](CallState.md#participants-1) | [core/entities/types/call.types.ts:210](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L210) |
| <a id="raisehandpriority"></a> `raiseHandPriority` | `readonly` | `boolean` | [`CallState`](CallState.md).[`raiseHandPriority`](CallState.md#raisehandpriority) | [core/entities/types/call.types.ts:205](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L205) |
| <a id="raisehandpriority-1"></a> `raiseHandPriority$` | `readonly` | `Observable`\<`boolean`\> | [`CallState`](CallState.md).[`raiseHandPriority$`](CallState.md#raisehandpriority-1) | [core/entities/types/call.types.ts:204](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L204) |
| <a id="recording"></a> `recording` | `readonly` | `boolean` | [`CallState`](CallState.md).[`recording`](CallState.md#recording) | [core/entities/types/call.types.ts:201](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L201) |
| <a id="recording-1"></a> `recording$` | `readonly` | `Observable`\<`boolean`\> | [`CallState`](CallState.md).[`recording$`](CallState.md#recording-1) | [core/entities/types/call.types.ts:200](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L200) |
| <a id="remotestream"></a> `remoteStream` | `readonly` | `MediaStream` \| `null` | - | [core/entities/types/call.types.ts:244](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L244) |
| <a id="remotestream-1"></a> `remoteStream$` | `readonly` | `Observable`\<`MediaStream` \| `null`\> | - | [core/entities/types/call.types.ts:243](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L243) |
| <a id="rtcpeerconnection"></a> `rtcPeerConnection` | `readonly` | `RTCPeerConnection` \| `undefined` | - | [core/entities/types/call.types.ts:245](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L245) |
| <a id="self"></a> `self` | `readonly` | [`CallSelfParticipant`](CallSelfParticipant.md) \| `null` | - | [core/entities/types/call.types.ts:232](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L232) |
| <a id="self-1"></a> `self$` | `readonly` | `Observable`\<[`CallSelfParticipant`](CallSelfParticipant.md) \| `null`\> | - | [core/entities/types/call.types.ts:231](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L231) |
| <a id="signalingevent"></a> `signalingEvent$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | - | [core/entities/types/call.types.ts:247](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L247) |
| <a id="status"></a> `status` | `readonly` | [`CallStatus`](../type-aliases/CallStatus.md) | [`CallState`](CallState.md).[`status`](CallState.md#status) | [core/entities/types/call.types.ts:199](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L199) |
| <a id="status-1"></a> `status$` | `readonly` | `Observable`\<[`CallStatus`](../type-aliases/CallStatus.md)\> | [`CallState`](CallState.md).[`status$`](CallState.md#status-1) | [core/entities/types/call.types.ts:198](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L198) |
| <a id="streaming"></a> `streaming` | `readonly` | `boolean` | [`CallState`](CallState.md).[`streaming`](CallState.md#streaming) | [core/entities/types/call.types.ts:203](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L203) |
| <a id="streaming-1"></a> `streaming$` | `readonly` | `Observable`\<`boolean`\> | [`CallState`](CallState.md).[`streaming$`](CallState.md#streaming-1) | [core/entities/types/call.types.ts:202](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L202) |
| <a id="to"></a> `to?` | `readonly` | `string` | - | [core/entities/types/call.types.ts:233](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L233) |
| <a id="uservariables"></a> `userVariables?` | `public` | `Record`\<`string`, `unknown`\> | - | [core/entities/types/call.types.ts:250](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L250) |
| <a id="uservariables-1"></a> `userVariables$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | - | [core/entities/types/call.types.ts:251](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L251) |

## Methods

### answer()

> **answer**(`options?`): `void`

Defined in: [core/entities/types/call.types.ts:262](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L262)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options?` | [`MediaOptions`](MediaOptions.md) |

#### Returns

`void`

***

### execute()

> **execute**\<`T`\>(`request`, `options?`): `Promise`\<`T`\>

Defined in: [core/entities/types/call.types.ts:270](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L270)

#### Type Parameters

| Type Parameter | Default type |
| ------ | ------ |
| `T` *extends* [`JSONRPCResponse`](../type-aliases/JSONRPCResponse.md) | [`JSONRPCResponse`](../type-aliases/JSONRPCResponse.md) |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `request` | [`JSONRPCRequest`](JSONRPCRequest.md) |
| `options?` | [`PendingRPCOptions`](PendingRPCOptions.md) |

#### Returns

`Promise`\<`T`\>

***

### executeMethod()

> **executeMethod**\<`T`\>(`target`, `method`, `args`): `Promise`\<`T`\>

Defined in: [core/entities/types/call.types.ts:265](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L265)

#### Type Parameters

| Type Parameter | Default type |
| ------ | ------ |
| `T` *extends* [`JSONRPCResponse`](../type-aliases/JSONRPCResponse.md) | [`JSONRPCResponse`](../type-aliases/JSONRPCResponse.md) |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `target` | `string` |
| `method` | `string` |
| `args` | `Record`\<`string`, `unknown`\> |

#### Returns

`Promise`\<`T`\>

***

### hangup()

> **hangup**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:253](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L253)

#### Returns

`Promise`\<`void`\>

***

### reject()

> **reject**(): `void`

Defined in: [core/entities/types/call.types.ts:263](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L263)

#### Returns

`void`

***

### sendDigits()

> **sendDigits**(`digits`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:264](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L264)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `digits` | `string` |

#### Returns

`Promise`\<`void`\>

***

### setLayout()

> **setLayout**(`layout`, `positions`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:256](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L256)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `layout` | `string` |
| `positions` | `Record`\<`string`, [`VideoPosition`](../type-aliases/VideoPosition.md)\> |

#### Returns

`Promise`\<`void`\>

***

### setMeta()

> **setMeta**(`meta`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:212](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L212)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `meta` | `Record`\<`string`, `unknown`\> |

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallState`](CallState.md).[`setMeta`](CallState.md#setmeta)

***

### startRecording()

> **startRecording**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:257](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L257)

#### Returns

`Promise`\<`void`\>

***

### startStreaming()

> **startStreaming**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:258](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L258)

#### Returns

`Promise`\<`void`\>

***

### toggleHold()

> **toggleHold**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:255](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L255)

#### Returns

`Promise`\<`void`\>

***

### toggleIncomingAudio()

> **toggleIncomingAudio**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:261](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L261)

#### Returns

`Promise`\<`void`\>

***

### toggleIncomingVideo()

> **toggleIncomingVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:260](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L260)

#### Returns

`Promise`\<`void`\>

***

### toggleLock()

> **toggleLock**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:254](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L254)

#### Returns

`Promise`\<`void`\>

***

### transfer()

> **transfer**(`options`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:259](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L259)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options` | [`TransferOptions`](TransferOptions.md) |

#### Returns

`Promise`\<`void`\>

***

### updateMeta()

> **updateMeta**(`meta`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:213](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L213)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `meta` | `Record`\<`string`, `unknown`\> |

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallState`](CallState.md).[`updateMeta`](CallState.md#updatemeta)
