---
title: "Call"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L276)</sub>

Public interface for an active WebRTC call.

Provides access to media streams, participants, layout, signaling events,
and control actions (hangup, mute, transfer, etc.).

## Extends

- [`CallState`](CallState.md)

## Properties

| Property | Modifier | Type | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ |
| `address?` | `readonly` | [`CallAddress`](CallAddress.md) | - | - | [core/entities/types/call.types.ts:304](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L304) |
| `address$` | `readonly` | `Observable`\<[`CallAddress`](CallAddress.md) \| `undefined`\> | - | - | [core/entities/types/call.types.ts:305](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L305) |
| `bandwidthConstrained$` | `readonly` | `Observable`\<`boolean`\> | - | - | [core/entities/types/call.types.ts:320](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L320) |
| `capabilities` | `readonly` | [`Capability`](../type-aliases/Capability.md)[] | - | - | [core/entities/types/call.types.ts:278](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L278) |
| `capabilities$` | `readonly` | `Observable`\<[`Capability`](../type-aliases/Capability.md)[]\> | - | - | [core/entities/types/call.types.ts:277](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L277) |
| `direction` | `readonly` | [`CallDirection`](../type-aliases/CallDirection.md) | - | - | [core/entities/types/call.types.ts:287](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L287) |
| `errors$` | `readonly` | `Observable`\<[`CallError`](CallError.md)\> | - | - | [core/entities/types/call.types.ts:302](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L302) |
| `from?` | `readonly` | `string` | - | - | [core/entities/types/call.types.ts:285](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L285) |
| `fromName?` | `readonly` | `string` | - | - | [core/entities/types/call.types.ts:286](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L286) |
| `id` | `readonly` | `string` | - | [`CallState`](CallState.md).[`id`](CallState.md#id) | [core/entities/types/call.types.ts:247](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L247) |
| `isNetworkHealthy` | `readonly` | `boolean` | - | - | [core/entities/types/call.types.ts:313](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L313) |
| `isNetworkHealthy$` | `readonly` | `Observable`\<`boolean`\> | - | - | [core/entities/types/call.types.ts:312](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L312) |
| `layout?` | `readonly` | `string` | - | - | [core/entities/types/call.types.ts:291](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L291) |
| `layout$` | `readonly` | `Observable`\<`string`\> | - | - | [core/entities/types/call.types.ts:290](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L290) |
| `layoutLayers` | `readonly` | [`LayoutLayer`](LayoutLayer.md)[] | - | - | [core/entities/types/call.types.ts:293](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L293) |
| `layoutLayers$` | `readonly` | `Observable`\<[`LayoutLayer`](LayoutLayer.md)[]\> | - | - | [core/entities/types/call.types.ts:292](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L292) |
| `layouts` | `readonly` | `string`[] | - | - | [core/entities/types/call.types.ts:289](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L289) |
| `layouts$` | `readonly` | `Observable`\<`string`[]\> | - | - | [core/entities/types/call.types.ts:288](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L288) |
| `localStream` | `readonly` | `MediaStream` \| `null` | Sync getter — returns null before the stream is created. | - | [core/entities/types/call.types.ts:297](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L297) |
| `localStream$` | `readonly` | `Observable`\<`MediaStream`\> | Observable that emits only non-null MediaStreams (waits until the stream exists). | - | [core/entities/types/call.types.ts:295](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L295) |
| `locked` | `readonly` | `boolean` | - | [`CallState`](CallState.md).[`locked`](CallState.md#locked) | [core/entities/types/call.types.ts:257](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L257) |
| `locked$` | `readonly` | `Observable`\<`boolean`\> | - | [`CallState`](CallState.md).[`locked$`](CallState.md#locked-1) | [core/entities/types/call.types.ts:256](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L256) |
| `mediaDirections` | `readonly` | [`MediaDirections`](MediaDirections.md) | - | - | [core/entities/types/call.types.ts:280](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L280) |
| `mediaDirections$` | `readonly` | `Observable`\<[`MediaDirections`](MediaDirections.md)\> | - | - | [core/entities/types/call.types.ts:279](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L279) |
| `mediaParamsUpdated$` | `readonly` | `Observable`\<[`MediaParamsEvent`](MediaParamsEvent.md)\> | - | - | [core/entities/types/call.types.ts:321](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L321) |
| `meta` | `readonly` | `Record`\<`string`, `unknown`\> | - | [`CallState`](CallState.md).[`meta`](CallState.md#meta) | [core/entities/types/call.types.ts:259](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L259) |
| `meta$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | - | [`CallState`](CallState.md).[`meta$`](CallState.md#meta-1) | [core/entities/types/call.types.ts:258](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L258) |
| `networkIssues` | `readonly` | [`CallNetworkIssue`](CallNetworkIssue.md)[] | - | - | [core/entities/types/call.types.ts:311](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L311) |
| `networkIssues$` | `readonly` | `Observable`\<[`CallNetworkIssue`](CallNetworkIssue.md)[]\> | - | - | [core/entities/types/call.types.ts:310](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L310) |
| `networkMetrics` | `readonly` | [`CallNetworkMetrics`](CallNetworkMetrics.md)[] | - | - | [core/entities/types/call.types.ts:315](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L315) |
| `networkMetrics$` | `readonly` | `Observable`\<[`CallNetworkMetrics`](CallNetworkMetrics.md)[]\> | - | - | [core/entities/types/call.types.ts:314](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L314) |
| `participants` | `readonly` | [`CallParticipant`](CallParticipant.md)[] | - | [`CallState`](CallState.md).[`participants`](CallState.md#participants) | [core/entities/types/call.types.ts:261](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L261) |
| `participants$` | `readonly` | `Observable`\<[`CallParticipant`](CallParticipant.md)[]\> | - | [`CallState`](CallState.md).[`participants$`](CallState.md#participants-1) | [core/entities/types/call.types.ts:260](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L260) |
| `qualityLevel$` | `readonly` | `Observable`\<[`QualityLevel`](../type-aliases/QualityLevel.md)\> | - | - | [core/entities/types/call.types.ts:317](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L317) |
| `qualityScore$` | `readonly` | `Observable`\<`number`\> | - | - | [core/entities/types/call.types.ts:316](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L316) |
| `raiseHandPriority` | `readonly` | `boolean` | - | [`CallState`](CallState.md).[`raiseHandPriority`](CallState.md#raisehandpriority) | [core/entities/types/call.types.ts:255](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L255) |
| `raiseHandPriority$` | `readonly` | `Observable`\<`boolean`\> | - | [`CallState`](CallState.md).[`raiseHandPriority$`](CallState.md#raisehandpriority-1) | [core/entities/types/call.types.ts:254](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L254) |
| `recording` | `readonly` | `boolean` | - | [`CallState`](CallState.md).[`recording`](CallState.md#recording) | [core/entities/types/call.types.ts:251](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L251) |
| `recording$` | `readonly` | `Observable`\<`boolean`\> | - | [`CallState`](CallState.md).[`recording$`](CallState.md#recording-1) | [core/entities/types/call.types.ts:250](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L250) |
| `recoveryEvent$` | `readonly` | `Observable`\<[`RecoveryEvent`](RecoveryEvent.md)\> | - | - | [core/entities/types/call.types.ts:319](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L319) |
| `recoveryState$` | `readonly` | `Observable`\<[`RecoveryState`](../type-aliases/RecoveryState.md)\> | - | - | [core/entities/types/call.types.ts:318](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L318) |
| `remoteStream` | `readonly` | `MediaStream` \| `null` | - | - | [core/entities/types/call.types.ts:300](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L300) |
| `remoteStream$` | `readonly` | `Observable`\<`MediaStream`\> | Observable that emits only non-null MediaStreams (waits until the stream exists). | - | [core/entities/types/call.types.ts:299](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L299) |
| `rtcPeerConnection` | `readonly` | `RTCPeerConnection` \| `undefined` | - | - | [core/entities/types/call.types.ts:301](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L301) |
| `self` | `readonly` | [`CallSelfParticipant`](CallSelfParticipant.md) \| `null` | - | - | [core/entities/types/call.types.ts:282](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L282) |
| `self$` | `readonly` | `Observable`\<[`CallSelfParticipant`](CallSelfParticipant.md) \| `null`\> | - | - | [core/entities/types/call.types.ts:281](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L281) |
| `signalingEvent$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | - | - | [core/entities/types/call.types.ts:303](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L303) |
| `status` | `readonly` | [`CallStatus`](../type-aliases/CallStatus.md) | - | [`CallState`](CallState.md).[`status`](CallState.md#status) | [core/entities/types/call.types.ts:249](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L249) |
| `status$` | `readonly` | `Observable`\<[`CallStatus`](../type-aliases/CallStatus.md)\> | - | [`CallState`](CallState.md).[`status$`](CallState.md#status-1) | [core/entities/types/call.types.ts:248](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L248) |
| `streaming` | `readonly` | `boolean` | - | [`CallState`](CallState.md).[`streaming`](CallState.md#streaming) | [core/entities/types/call.types.ts:253](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L253) |
| `streaming$` | `readonly` | `Observable`\<`boolean`\> | - | [`CallState`](CallState.md).[`streaming$`](CallState.md#streaming-1) | [core/entities/types/call.types.ts:252](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L252) |
| `to?` | `readonly` | `string` | - | - | [core/entities/types/call.types.ts:283](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L283) |
| `toName?` | `readonly` | `string` | - | - | [core/entities/types/call.types.ts:284](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L284) |
| `userVariables?` | `public` | `Record`\<`string`, `unknown`\> | - | - | [core/entities/types/call.types.ts:306](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L306) |
| `userVariables$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | - | - | [core/entities/types/call.types.ts:307](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L307) |

## Methods

### answer()

> **answer**(`options?`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L335)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options?` | [`MediaOptions`](MediaOptions.md) |

#### Returns

`void`

***

### execute()

> **execute**\<`T`\>(`request`, `options?`): `Promise`\<`T`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L343)</sub>

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

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L338)</sub>

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

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L326)</sub>

#### Returns

`Promise`\<`void`\>

***

### reject()

> **reject**(): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L336)</sub>

#### Returns

`void`

***

### requestIceRestart()

> **requestIceRestart**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L323)</sub>

#### Returns

`Promise`\<`void`\>

***

### requestKeyframe()

> **requestKeyframe**(): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L322)</sub>

#### Returns

`void`

***

### sendDigits()

> **sendDigits**(`digits`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L337)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `digits` | `string` |

#### Returns

`Promise`\<`void`\>

***

### setLayout()

> **setLayout**(`layout`, `positions`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L329)</sub>

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

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L262)</sub>

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

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L330)</sub>

#### Returns

`Promise`\<`void`\>

***

### startStreaming()

> **startStreaming**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L331)</sub>

#### Returns

`Promise`\<`void`\>

***

### subscribe()

> **subscribe**(`eventType`): `Observable`\<`Record`\<`string`, `unknown`\>\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L325)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `eventType` | `string` |

#### Returns

`Observable`\<`Record`\<`string`, `unknown`\>\>

***

### toggleHold()

> **toggleHold**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L328)</sub>

#### Returns

`Promise`\<`void`\>

***

### toggleIncomingAudio()

> **toggleIncomingAudio**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L334)</sub>

#### Returns

`Promise`\<`void`\>

***

### toggleIncomingVideo()

> **toggleIncomingVideo**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L333)</sub>

#### Returns

`Promise`\<`void`\>

***

### toggleLock()

> **toggleLock**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L327)</sub>

#### Returns

`Promise`\<`void`\>

***

### transfer()

> **transfer**(`options`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L332)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options` | [`TransferOptions`](TransferOptions.md) |

#### Returns

`Promise`\<`void`\>

***

### updateMeta()

> **updateMeta**(`meta`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L263)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `meta` | `Record`\<`string`, `unknown`\> |

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallState`](CallState.md).[`updateMeta`](CallState.md#updatemeta)
