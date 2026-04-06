# Interface: CallSelfParticipant

Defined in: [core/entities/types/call.types.ts:110](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L110)

Self participant interface with control methods
Extends CallParticipant with methods for controlling the local participant

## Extends

- [`CallParticipant`](CallParticipant.md)

## Properties

| Property | Modifier | Type | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="addressid"></a> `addressId` | `readonly` | `string` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`addressId`](CallParticipant.md#addressid) | [core/entities/types/call.types.ts:77](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L77) |
| <a id="addressid-1"></a> `addressId$` | `readonly` | `Observable`\<`string`\> | [`CallParticipant`](CallParticipant.md).[`addressId$`](CallParticipant.md#addressid-1) | [core/entities/types/call.types.ts:54](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L54) |
| <a id="audiomuted"></a> `audioMuted` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`audioMuted`](CallParticipant.md#audiomuted) | [core/entities/types/call.types.ts:64](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L64) |
| <a id="audiomuted-1"></a> `audioMuted$` | `readonly` | `Observable`\<`boolean`\> | [`CallParticipant`](CallParticipant.md).[`audioMuted$`](CallParticipant.md#audiomuted-1) | [core/entities/types/call.types.ts:41](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L41) |
| <a id="autogain"></a> `autoGain` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`autoGain`](CallParticipant.md#autogain) | [core/entities/types/call.types.ts:71](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L71) |
| <a id="autogain-1"></a> `autoGain$` | `readonly` | `Observable`\<`boolean`\> | [`CallParticipant`](CallParticipant.md).[`autoGain$`](CallParticipant.md#autogain-1) | [core/entities/types/call.types.ts:48](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L48) |
| <a id="deaf"></a> `deaf` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`deaf`](CallParticipant.md#deaf) | [core/entities/types/call.types.ts:66](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L66) |
| <a id="deaf-1"></a> `deaf$` | `readonly` | `Observable`\<`boolean`\> | [`CallParticipant`](CallParticipant.md).[`deaf$`](CallParticipant.md#deaf-1) | [core/entities/types/call.types.ts:43](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L43) |
| <a id="denoise"></a> `denoise` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`denoise`](CallParticipant.md#denoise) | [core/entities/types/call.types.ts:74](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L74) |
| <a id="denoise-1"></a> `denoise$` | `readonly` | `Observable`\<`boolean`\> | [`CallParticipant`](CallParticipant.md).[`denoise$`](CallParticipant.md#denoise-1) | [core/entities/types/call.types.ts:51](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L51) |
| <a id="echocancellation"></a> `echoCancellation` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`echoCancellation`](CallParticipant.md#echocancellation) | [core/entities/types/call.types.ts:70](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L70) |
| <a id="echocancellation-1"></a> `echoCancellation$` | `readonly` | `Observable`\<`boolean`\> | [`CallParticipant`](CallParticipant.md).[`echoCancellation$`](CallParticipant.md#echocancellation-1) | [core/entities/types/call.types.ts:47](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L47) |
| <a id="handraised"></a> `handraised` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`handraised`](CallParticipant.md#handraised) | [core/entities/types/call.types.ts:62](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L62) |
| <a id="handraised-1"></a> `handraised$` | `readonly` | `Observable`\<`boolean`\> | [`CallParticipant`](CallParticipant.md).[`handraised$`](CallParticipant.md#handraised-1) | [core/entities/types/call.types.ts:39](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L39) |
| <a id="id"></a> `id` | `readonly` | `string` | [`CallParticipant`](CallParticipant.md).[`id`](CallParticipant.md#id) | [core/entities/types/call.types.ts:34](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L34) |
| <a id="inputsensitivity"></a> `inputSensitivity` | `readonly` | `number` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`inputSensitivity`](CallParticipant.md#inputsensitivity) | [core/entities/types/call.types.ts:69](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L69) |
| <a id="inputsensitivity-1"></a> `inputSensitivity$` | `readonly` | `Observable`\<`number`\> | [`CallParticipant`](CallParticipant.md).[`inputSensitivity$`](CallParticipant.md#inputsensitivity-1) | [core/entities/types/call.types.ts:46](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L46) |
| <a id="inputvolume"></a> `inputVolume` | `readonly` | `number` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`inputVolume`](CallParticipant.md#inputvolume) | [core/entities/types/call.types.ts:67](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L67) |
| <a id="inputvolume-1"></a> `inputVolume$` | `readonly` | `Observable`\<`number`\> | [`CallParticipant`](CallParticipant.md).[`inputVolume$`](CallParticipant.md#inputvolume-1) | [core/entities/types/call.types.ts:44](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L44) |
| <a id="isaudience"></a> `isAudience` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`isAudience`](CallParticipant.md#isaudience) | [core/entities/types/call.types.ts:81](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L81) |
| <a id="istalking"></a> `isTalking` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`isTalking`](CallParticipant.md#istalking) | [core/entities/types/call.types.ts:79](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L79) |
| <a id="istalking-1"></a> `isTalking$` | `readonly` | `Observable`\<`boolean`\> | [`CallParticipant`](CallParticipant.md).[`isTalking$`](CallParticipant.md#istalking-1) | [core/entities/types/call.types.ts:56](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L56) |
| <a id="lowbitrate"></a> `lowbitrate` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`lowbitrate`](CallParticipant.md#lowbitrate) | [core/entities/types/call.types.ts:73](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L73) |
| <a id="lowbitrate-1"></a> `lowbitrate$` | `readonly` | `Observable`\<`boolean`\> | [`CallParticipant`](CallParticipant.md).[`lowbitrate$`](CallParticipant.md#lowbitrate-1) | [core/entities/types/call.types.ts:50](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L50) |
| <a id="meta"></a> `meta` | `readonly` | `Record`\<`string`, `unknown`\> \| `undefined` | [`CallParticipant`](CallParticipant.md).[`meta`](CallParticipant.md#meta) | [core/entities/types/call.types.ts:75](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L75) |
| <a id="meta-1"></a> `meta$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | [`CallParticipant`](CallParticipant.md).[`meta$`](CallParticipant.md#meta-1) | [core/entities/types/call.types.ts:52](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L52) |
| <a id="name"></a> `name` | `readonly` | `string` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`name`](CallParticipant.md#name) | [core/entities/types/call.types.ts:60](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L60) |
| <a id="name-1"></a> `name$` | `readonly` | `Observable`\<`string`\> | [`CallParticipant`](CallParticipant.md).[`name$`](CallParticipant.md#name-1) | [core/entities/types/call.types.ts:37](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L37) |
| <a id="nodeid"></a> `nodeId` | `readonly` | `string` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`nodeId`](CallParticipant.md#nodeid) | [core/entities/types/call.types.ts:78](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L78) |
| <a id="nodeid-1"></a> `nodeId$` | `readonly` | `Observable`\<`string`\> | [`CallParticipant`](CallParticipant.md).[`nodeId$`](CallParticipant.md#nodeid-1) | [core/entities/types/call.types.ts:55](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L55) |
| <a id="noisesuppression"></a> `noiseSuppression` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`noiseSuppression`](CallParticipant.md#noisesuppression) | [core/entities/types/call.types.ts:72](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L72) |
| <a id="noisesuppression-1"></a> `noiseSuppression$` | `readonly` | `Observable`\<`boolean`\> | [`CallParticipant`](CallParticipant.md).[`noiseSuppression$`](CallParticipant.md#noisesuppression-1) | [core/entities/types/call.types.ts:49](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L49) |
| <a id="outputvolume"></a> `outputVolume` | `readonly` | `number` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`outputVolume`](CallParticipant.md#outputvolume) | [core/entities/types/call.types.ts:68](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L68) |
| <a id="outputvolume-1"></a> `outputVolume$` | `readonly` | `Observable`\<`number`\> | [`CallParticipant`](CallParticipant.md).[`outputVolume$`](CallParticipant.md#outputvolume-1) | [core/entities/types/call.types.ts:45](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L45) |
| <a id="position"></a> `position` | `readonly` | [`LayoutLayer`](LayoutLayer.md) \| `undefined` | [`CallParticipant`](CallParticipant.md).[`position`](CallParticipant.md#position) | [core/entities/types/call.types.ts:80](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L80) |
| <a id="position-1"></a> `position$` | `readonly` | `Observable`\<[`LayoutLayer`](LayoutLayer.md) \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`position$`](CallParticipant.md#position-1) | [core/entities/types/call.types.ts:57](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L57) |
| <a id="screensharestatus"></a> `screenShareStatus` | `readonly` | `string` | - | [core/entities/types/call.types.ts:112](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L112) |
| <a id="screensharestatus-1"></a> `screenShareStatus$` | `readonly` | `Observable`\<`string`\> | - | [core/entities/types/call.types.ts:111](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L111) |
| <a id="subscriberid"></a> `subscriberId` | `readonly` | `string` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`subscriberId`](CallParticipant.md#subscriberid) | [core/entities/types/call.types.ts:76](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L76) |
| <a id="subscriberid-1"></a> `subscriberId$` | `readonly` | `Observable`\<`string`\> | [`CallParticipant`](CallParticipant.md).[`subscriberId$`](CallParticipant.md#subscriberid-1) | [core/entities/types/call.types.ts:53](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L53) |
| <a id="type"></a> `type` | `readonly` | `string` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`type`](CallParticipant.md#type) | [core/entities/types/call.types.ts:61](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L61) |
| <a id="type-1"></a> `type$` | `readonly` | `Observable`\<`string`\> | [`CallParticipant`](CallParticipant.md).[`type$`](CallParticipant.md#type-1) | [core/entities/types/call.types.ts:38](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L38) |
| <a id="videomuted"></a> `videoMuted` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`videoMuted`](CallParticipant.md#videomuted) | [core/entities/types/call.types.ts:65](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L65) |
| <a id="videomuted-1"></a> `videoMuted$` | `readonly` | `Observable`\<`boolean`\> | [`CallParticipant`](CallParticipant.md).[`videoMuted$`](CallParticipant.md#videomuted-1) | [core/entities/types/call.types.ts:42](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L42) |
| <a id="visible"></a> `visible` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`visible`](CallParticipant.md#visible) | [core/entities/types/call.types.ts:63](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L63) |
| <a id="visible-1"></a> `visible$` | `readonly` | `Observable`\<`boolean`\> | [`CallParticipant`](CallParticipant.md).[`visible$`](CallParticipant.md#visible-1) | [core/entities/types/call.types.ts:40](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L40) |

## Methods

### end()

> **end**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:101](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L101)

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`end`](CallParticipant.md#end)

***

### mute()

> **mute**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:86](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L86)

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`mute`](CallParticipant.md#mute)

***

### muteVideo()

> **muteVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:89](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L89)

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`muteVideo`](CallParticipant.md#mutevideo)

***

### remove()

> **remove**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:100](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L100)

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`remove`](CallParticipant.md#remove)

***

### selectAudioInputDevice()

> **selectAudioInputDevice**(`device`): `void`

Defined in: [core/entities/types/call.types.ts:117](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L117)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `device` | `MediaDeviceInfo` |

#### Returns

`void`

***

### selectAudioOutputDevice()

> **selectAudioOutputDevice**(`device`): `void`

Defined in: [core/entities/types/call.types.ts:119](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L119)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `device` | `MediaDeviceInfo` |

#### Returns

`void`

***

### selectVideoInputDevice()

> **selectVideoInputDevice**(`device`): `void`

Defined in: [core/entities/types/call.types.ts:118](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L118)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `device` | `MediaDeviceInfo` |

#### Returns

`void`

***

### setAudioInputSensitivity()

> **setAudioInputSensitivity**(`value`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:96](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L96)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `number` |

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`setAudioInputSensitivity`](CallParticipant.md#setaudioinputsensitivity)

***

### setAudioInputVolume()

> **setAudioInputVolume**(`value`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:97](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L97)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `number` |

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`setAudioInputVolume`](CallParticipant.md#setaudioinputvolume)

***

### setAudioOutputVolume()

> **setAudioOutputVolume**(`value`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:98](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L98)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `number` |

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`setAudioOutputVolume`](CallParticipant.md#setaudiooutputvolume)

***

### setMeta()

> **setMeta**(`meta`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:102](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L102)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `meta` | `Record`\<`string`, `unknown`\> |

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`setMeta`](CallParticipant.md#setmeta)

***

### setPosition()

> **setPosition**(`value`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:99](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L99)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | [`VideoPosition`](../type-aliases/VideoPosition.md) |

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`setPosition`](CallParticipant.md#setposition)

***

### startScreenShare()

> **startScreenShare**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:115](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L115)

#### Returns

`Promise`\<`void`\>

***

### stopScreenShare()

> **stopScreenShare**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:116](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L116)

#### Returns

`Promise`\<`void`\>

***

### toggleAudioInputAutoGain()

> **toggleAudioInputAutoGain**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:93](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L93)

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleAudioInputAutoGain`](CallParticipant.md#toggleaudioinputautogain)

***

### toggleDeaf()

> **toggleDeaf**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:84](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L84)

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleDeaf`](CallParticipant.md#toggledeaf)

***

### toggleEchoCancellation()

> **toggleEchoCancellation**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:92](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L92)

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleEchoCancellation`](CallParticipant.md#toggleechocancellation)

***

### toggleHandraise()

> **toggleHandraise**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:85](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L85)

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleHandraise`](CallParticipant.md#togglehandraise)

***

### toggleLowbitrate()

> **toggleLowbitrate**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:95](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L95)

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleLowbitrate`](CallParticipant.md#togglelowbitrate)

***

### toggleMute()

> **toggleMute**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:88](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L88)

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleMute`](CallParticipant.md#togglemute)

***

### toggleMuteVideo()

> **toggleMuteVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:91](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L91)

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleMuteVideo`](CallParticipant.md#togglemutevideo)

***

### toggleNoiseSuppression()

> **toggleNoiseSuppression**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:94](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L94)

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleNoiseSuppression`](CallParticipant.md#togglenoisesuppression)

***

### unmute()

> **unmute**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:87](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L87)

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`unmute`](CallParticipant.md#unmute)

***

### unmuteVideo()

> **unmuteVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:90](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L90)

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`unmuteVideo`](CallParticipant.md#unmutevideo)

***

### updateMeta()

> **updateMeta**(`meta`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:103](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L103)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `meta` | `Record`\<`string`, `unknown`\> |

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`updateMeta`](CallParticipant.md#updatemeta)
