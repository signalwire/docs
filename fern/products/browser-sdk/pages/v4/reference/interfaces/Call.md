# Interface: Call

Defined in: [core/entities/types/call.types.ts:276](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L276)

Public interface for an active WebRTC call.

Provides access to media streams, participants, layout, signaling events,
and control actions (hangup, mute, transfer, etc.).

## Extends

- [`CallState`](CallState.md)

## Properties

| Property | Modifier | Type | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ |
| <a id="address"></a> `address?` | `readonly` | [`CallAddress`](CallAddress.md) | - | - | [core/entities/types/call.types.ts:304](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L304) |
| <a id="address-1"></a> `address$` | `readonly` | `Observable`\<[`CallAddress`](CallAddress.md) \| `undefined`\> | - | - | [core/entities/types/call.types.ts:305](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L305) |
| <a id="bandwidthconstrained"></a> `bandwidthConstrained$` | `readonly` | `Observable`\<`boolean`\> | - | - | [core/entities/types/call.types.ts:320](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L320) |
| <a id="capabilities"></a> `capabilities` | `readonly` | [`Capability`](../type-aliases/Capability.md)[] | - | - | [core/entities/types/call.types.ts:278](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L278) |
| <a id="capabilities-1"></a> `capabilities$` | `readonly` | `Observable`\<[`Capability`](../type-aliases/Capability.md)[]\> | - | - | [core/entities/types/call.types.ts:277](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L277) |
| <a id="direction"></a> `direction` | `readonly` | [`CallDirection`](../type-aliases/CallDirection.md) | - | - | [core/entities/types/call.types.ts:287](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L287) |
| <a id="errors"></a> `errors$` | `readonly` | `Observable`\<[`CallError`](CallError.md)\> | - | - | [core/entities/types/call.types.ts:302](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L302) |
| <a id="from"></a> `from?` | `readonly` | `string` | - | - | [core/entities/types/call.types.ts:285](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L285) |
| <a id="fromname"></a> `fromName?` | `readonly` | `string` | - | - | [core/entities/types/call.types.ts:286](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L286) |
| <a id="id"></a> `id` | `readonly` | `string` | - | [`CallState`](CallState.md).[`id`](CallState.md#id) | [core/entities/types/call.types.ts:247](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L247) |
| <a id="isnetworkhealthy"></a> `isNetworkHealthy` | `readonly` | `boolean` | - | - | [core/entities/types/call.types.ts:313](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L313) |
| <a id="isnetworkhealthy-1"></a> `isNetworkHealthy$` | `readonly` | `Observable`\<`boolean`\> | - | - | [core/entities/types/call.types.ts:312](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L312) |
| <a id="layout"></a> `layout?` | `readonly` | `string` | - | - | [core/entities/types/call.types.ts:291](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L291) |
| <a id="layout-1"></a> `layout$` | `readonly` | `Observable`\<`string`\> | - | - | [core/entities/types/call.types.ts:290](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L290) |
| <a id="layoutlayers"></a> `layoutLayers` | `readonly` | [`LayoutLayer`](LayoutLayer.md)[] | - | - | [core/entities/types/call.types.ts:293](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L293) |
| <a id="layoutlayers-1"></a> `layoutLayers$` | `readonly` | `Observable`\<[`LayoutLayer`](LayoutLayer.md)[]\> | - | - | [core/entities/types/call.types.ts:292](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L292) |
| <a id="layouts"></a> `layouts` | `readonly` | `string`[] | - | - | [core/entities/types/call.types.ts:289](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L289) |
| <a id="layouts-1"></a> `layouts$` | `readonly` | `Observable`\<`string`[]\> | - | - | [core/entities/types/call.types.ts:288](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L288) |
| <a id="localstream"></a> `localStream` | `readonly` | `MediaStream` \| `null` | Sync getter — returns null before the stream is created. | - | [core/entities/types/call.types.ts:297](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L297) |
| <a id="localstream-1"></a> `localStream$` | `readonly` | `Observable`\<`MediaStream`\> | Observable that emits only non-null MediaStreams (waits until the stream exists). | - | [core/entities/types/call.types.ts:295](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L295) |
| <a id="locked"></a> `locked` | `readonly` | `boolean` | - | [`CallState`](CallState.md).[`locked`](CallState.md#locked) | [core/entities/types/call.types.ts:257](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L257) |
| <a id="locked-1"></a> `locked$` | `readonly` | `Observable`\<`boolean`\> | - | [`CallState`](CallState.md).[`locked$`](CallState.md#locked-1) | [core/entities/types/call.types.ts:256](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L256) |
| <a id="mediadirections"></a> `mediaDirections` | `readonly` | [`MediaDirections`](MediaDirections.md) | - | - | [core/entities/types/call.types.ts:280](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L280) |
| <a id="mediadirections-1"></a> `mediaDirections$` | `readonly` | `Observable`\<[`MediaDirections`](MediaDirections.md)\> | - | - | [core/entities/types/call.types.ts:279](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L279) |
| <a id="mediaparamsupdated"></a> `mediaParamsUpdated$` | `readonly` | `Observable`\<[`MediaParamsEvent`](MediaParamsEvent.md)\> | - | - | [core/entities/types/call.types.ts:321](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L321) |
| <a id="meta"></a> `meta` | `readonly` | `Record`\<`string`, `unknown`\> | - | [`CallState`](CallState.md).[`meta`](CallState.md#meta) | [core/entities/types/call.types.ts:259](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L259) |
| <a id="meta-1"></a> `meta$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | - | [`CallState`](CallState.md).[`meta$`](CallState.md#meta-1) | [core/entities/types/call.types.ts:258](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L258) |
| <a id="networkissues"></a> `networkIssues` | `readonly` | [`CallNetworkIssue`](CallNetworkIssue.md)[] | - | - | [core/entities/types/call.types.ts:311](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L311) |
| <a id="networkissues-1"></a> `networkIssues$` | `readonly` | `Observable`\<[`CallNetworkIssue`](CallNetworkIssue.md)[]\> | - | - | [core/entities/types/call.types.ts:310](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L310) |
| <a id="networkmetrics"></a> `networkMetrics` | `readonly` | [`CallNetworkMetrics`](CallNetworkMetrics.md)[] | - | - | [core/entities/types/call.types.ts:315](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L315) |
| <a id="networkmetrics-1"></a> `networkMetrics$` | `readonly` | `Observable`\<[`CallNetworkMetrics`](CallNetworkMetrics.md)[]\> | - | - | [core/entities/types/call.types.ts:314](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L314) |
| <a id="participants"></a> `participants` | `readonly` | [`CallParticipant`](CallParticipant.md)[] | - | [`CallState`](CallState.md).[`participants`](CallState.md#participants) | [core/entities/types/call.types.ts:261](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L261) |
| <a id="participants-1"></a> `participants$` | `readonly` | `Observable`\<[`CallParticipant`](CallParticipant.md)[]\> | - | [`CallState`](CallState.md).[`participants$`](CallState.md#participants-1) | [core/entities/types/call.types.ts:260](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L260) |
| <a id="qualitylevel"></a> `qualityLevel$` | `readonly` | `Observable`\<[`QualityLevel`](../type-aliases/QualityLevel.md)\> | - | - | [core/entities/types/call.types.ts:317](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L317) |
| <a id="qualityscore"></a> `qualityScore$` | `readonly` | `Observable`\<`number`\> | - | - | [core/entities/types/call.types.ts:316](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L316) |
| <a id="raisehandpriority"></a> `raiseHandPriority` | `readonly` | `boolean` | - | [`CallState`](CallState.md).[`raiseHandPriority`](CallState.md#raisehandpriority) | [core/entities/types/call.types.ts:255](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L255) |
| <a id="raisehandpriority-1"></a> `raiseHandPriority$` | `readonly` | `Observable`\<`boolean`\> | - | [`CallState`](CallState.md).[`raiseHandPriority$`](CallState.md#raisehandpriority-1) | [core/entities/types/call.types.ts:254](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L254) |
| <a id="recording"></a> `recording` | `readonly` | `boolean` | - | [`CallState`](CallState.md).[`recording`](CallState.md#recording) | [core/entities/types/call.types.ts:251](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L251) |
| <a id="recording-1"></a> `recording$` | `readonly` | `Observable`\<`boolean`\> | - | [`CallState`](CallState.md).[`recording$`](CallState.md#recording-1) | [core/entities/types/call.types.ts:250](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L250) |
| <a id="recoveryevent"></a> `recoveryEvent$` | `readonly` | `Observable`\<[`RecoveryEvent`](RecoveryEvent.md)\> | - | - | [core/entities/types/call.types.ts:319](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L319) |
| <a id="recoverystate"></a> `recoveryState$` | `readonly` | `Observable`\<[`RecoveryState`](../type-aliases/RecoveryState.md)\> | - | - | [core/entities/types/call.types.ts:318](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L318) |
| <a id="remotestream"></a> `remoteStream` | `readonly` | `MediaStream` \| `null` | - | - | [core/entities/types/call.types.ts:300](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L300) |
| <a id="remotestream-1"></a> `remoteStream$` | `readonly` | `Observable`\<`MediaStream`\> | Observable that emits only non-null MediaStreams (waits until the stream exists). | - | [core/entities/types/call.types.ts:299](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L299) |
| <a id="rtcpeerconnection"></a> `rtcPeerConnection` | `readonly` | `RTCPeerConnection` \| `undefined` | - | - | [core/entities/types/call.types.ts:301](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L301) |
| <a id="self"></a> `self` | `readonly` | [`CallSelfParticipant`](CallSelfParticipant.md) \| `null` | - | - | [core/entities/types/call.types.ts:282](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L282) |
| <a id="self-1"></a> `self$` | `readonly` | `Observable`\<[`CallSelfParticipant`](CallSelfParticipant.md) \| `null`\> | - | - | [core/entities/types/call.types.ts:281](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L281) |
| <a id="signalingevent"></a> `signalingEvent$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | - | - | [core/entities/types/call.types.ts:303](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L303) |
| <a id="status"></a> `status` | `readonly` | [`CallStatus`](../type-aliases/CallStatus.md) | - | [`CallState`](CallState.md).[`status`](CallState.md#status) | [core/entities/types/call.types.ts:249](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L249) |
| <a id="status-1"></a> `status$` | `readonly` | `Observable`\<[`CallStatus`](../type-aliases/CallStatus.md)\> | - | [`CallState`](CallState.md).[`status$`](CallState.md#status-1) | [core/entities/types/call.types.ts:248](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L248) |
| <a id="streaming"></a> `streaming` | `readonly` | `boolean` | - | [`CallState`](CallState.md).[`streaming`](CallState.md#streaming) | [core/entities/types/call.types.ts:253](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L253) |
| <a id="streaming-1"></a> `streaming$` | `readonly` | `Observable`\<`boolean`\> | - | [`CallState`](CallState.md).[`streaming$`](CallState.md#streaming-1) | [core/entities/types/call.types.ts:252](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L252) |
| <a id="to"></a> `to?` | `readonly` | `string` | - | - | [core/entities/types/call.types.ts:283](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L283) |
| <a id="toname"></a> `toName?` | `readonly` | `string` | - | - | [core/entities/types/call.types.ts:284](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L284) |
| <a id="uservariables"></a> `userVariables?` | `public` | `Record`\<`string`, `unknown`\> | - | - | [core/entities/types/call.types.ts:306](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L306) |
| <a id="uservariables-1"></a> `userVariables$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | - | - | [core/entities/types/call.types.ts:307](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L307) |

## Methods

### answer()

> **answer**(`options?`): `void`

Defined in: [core/entities/types/call.types.ts:335](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L335)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options?` | [`MediaOptions`](MediaOptions.md) |

#### Returns

`void`

***

### execute()

> **execute**\<`T`\>(`request`, `options?`): `Promise`\<`T`\>

Defined in: [core/entities/types/call.types.ts:343](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L343)

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

Defined in: [core/entities/types/call.types.ts:338](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L338)

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

Defined in: [core/entities/types/call.types.ts:326](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L326)

#### Returns

`Promise`\<`void`\>

***

### reject()

> **reject**(): `void`

Defined in: [core/entities/types/call.types.ts:336](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L336)

#### Returns

`void`

***

### requestIceRestart()

> **requestIceRestart**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:323](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L323)

#### Returns

`Promise`\<`void`\>

***

### requestKeyframe()

> **requestKeyframe**(): `void`

Defined in: [core/entities/types/call.types.ts:322](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L322)

#### Returns

`void`

***

### sendDigits()

> **sendDigits**(`digits`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:337](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L337)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `digits` | `string` |

#### Returns

`Promise`\<`void`\>

***

### setLayout()

> **setLayout**(`layout`, `positions`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:329](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L329)

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

Defined in: [core/entities/types/call.types.ts:262](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L262)

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

Defined in: [core/entities/types/call.types.ts:330](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L330)

#### Returns

`Promise`\<`void`\>

***

### startStreaming()

> **startStreaming**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:331](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L331)

#### Returns

`Promise`\<`void`\>

***

### subscribe()

> **subscribe**(`eventType`): `Observable`\<`Record`\<`string`, `unknown`\>\>

Defined in: [core/entities/types/call.types.ts:325](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L325)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `eventType` | `string` |

#### Returns

`Observable`\<`Record`\<`string`, `unknown`\>\>

***

### toggleHold()

> **toggleHold**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:328](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L328)

#### Returns

`Promise`\<`void`\>

***

### toggleIncomingAudio()

> **toggleIncomingAudio**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:334](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L334)

#### Returns

`Promise`\<`void`\>

***

### toggleIncomingVideo()

> **toggleIncomingVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:333](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L333)

#### Returns

`Promise`\<`void`\>

***

### toggleLock()

> **toggleLock**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:327](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L327)

#### Returns

`Promise`\<`void`\>

***

### transfer()

> **transfer**(`options`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:332](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L332)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options` | [`TransferOptions`](TransferOptions.md) |

#### Returns

`Promise`\<`void`\>

***

### updateMeta()

> **updateMeta**(`meta`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:263](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L263)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `meta` | `Record`\<`string`, `unknown`\> |

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallState`](CallState.md).[`updateMeta`](CallState.md#updatemeta)
