---
title: "CallSelfParticipant"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L121)</sub>

Self participant interface with control methods
Extends CallParticipant with methods for controlling the local participant

## Extends

- [`CallParticipant`](CallParticipant.md)

## Properties

| Property | Modifier | Type | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| `addressId` | `readonly` | `string` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`addressId`](CallParticipant.md#addressid) | [core/entities/types/call.types.ts:88](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L88) |
| `addressId$` | `readonly` | `Observable`\<`string` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`addressId$`](CallParticipant.md#addressid-1) | [core/entities/types/call.types.ts:65](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L65) |
| `audioMuted` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`audioMuted`](CallParticipant.md#audiomuted) | [core/entities/types/call.types.ts:75](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L75) |
| `audioMuted$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`audioMuted$`](CallParticipant.md#audiomuted-1) | [core/entities/types/call.types.ts:52](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L52) |
| `autoGain` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`autoGain`](CallParticipant.md#autogain) | [core/entities/types/call.types.ts:82](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L82) |
| `autoGain$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`autoGain$`](CallParticipant.md#autogain-1) | [core/entities/types/call.types.ts:59](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L59) |
| `deaf` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`deaf`](CallParticipant.md#deaf) | [core/entities/types/call.types.ts:77](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L77) |
| `deaf$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`deaf$`](CallParticipant.md#deaf-1) | [core/entities/types/call.types.ts:54](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L54) |
| `denoise` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`denoise`](CallParticipant.md#denoise) | [core/entities/types/call.types.ts:85](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L85) |
| `denoise$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`denoise$`](CallParticipant.md#denoise-1) | [core/entities/types/call.types.ts:62](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L62) |
| `echoCancellation` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`echoCancellation`](CallParticipant.md#echocancellation) | [core/entities/types/call.types.ts:81](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L81) |
| `echoCancellation$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`echoCancellation$`](CallParticipant.md#echocancellation-1) | [core/entities/types/call.types.ts:58](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L58) |
| `handraised` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`handraised`](CallParticipant.md#handraised) | [core/entities/types/call.types.ts:73](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L73) |
| `handraised$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`handraised$`](CallParticipant.md#handraised-1) | [core/entities/types/call.types.ts:50](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L50) |
| `id` | `readonly` | `string` | [`CallParticipant`](CallParticipant.md).[`id`](CallParticipant.md#id) | [core/entities/types/call.types.ts:45](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L45) |
| `inputSensitivity` | `readonly` | `number` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`inputSensitivity`](CallParticipant.md#inputsensitivity) | [core/entities/types/call.types.ts:80](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L80) |
| `inputSensitivity$` | `readonly` | `Observable`\<`number` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`inputSensitivity$`](CallParticipant.md#inputsensitivity-1) | [core/entities/types/call.types.ts:57](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L57) |
| `inputVolume` | `readonly` | `number` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`inputVolume`](CallParticipant.md#inputvolume) | [core/entities/types/call.types.ts:78](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L78) |
| `inputVolume$` | `readonly` | `Observable`\<`number` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`inputVolume$`](CallParticipant.md#inputvolume-1) | [core/entities/types/call.types.ts:55](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L55) |
| `isAudience` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`isAudience`](CallParticipant.md#isaudience) | [core/entities/types/call.types.ts:92](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L92) |
| `isTalking` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`isTalking`](CallParticipant.md#istalking) | [core/entities/types/call.types.ts:90](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L90) |
| `isTalking$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`isTalking$`](CallParticipant.md#istalking-1) | [core/entities/types/call.types.ts:67](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L67) |
| `lowbitrate` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`lowbitrate`](CallParticipant.md#lowbitrate) | [core/entities/types/call.types.ts:84](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L84) |
| `lowbitrate$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`lowbitrate$`](CallParticipant.md#lowbitrate-1) | [core/entities/types/call.types.ts:61](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L61) |
| `meta` | `readonly` | `Record`\<`string`, `unknown`\> \| `undefined` | [`CallParticipant`](CallParticipant.md).[`meta`](CallParticipant.md#meta) | [core/entities/types/call.types.ts:86](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L86) |
| `meta$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\> \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`meta$`](CallParticipant.md#meta-1) | [core/entities/types/call.types.ts:63](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L63) |
| `name` | `readonly` | `string` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`name`](CallParticipant.md#name) | [core/entities/types/call.types.ts:71](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L71) |
| `name$` | `readonly` | `Observable`\<`string` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`name$`](CallParticipant.md#name-1) | [core/entities/types/call.types.ts:48](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L48) |
| `nodeId` | `readonly` | `string` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`nodeId`](CallParticipant.md#nodeid) | [core/entities/types/call.types.ts:89](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L89) |
| `nodeId$` | `readonly` | `Observable`\<`string` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`nodeId$`](CallParticipant.md#nodeid-1) | [core/entities/types/call.types.ts:66](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L66) |
| `noiseSuppression` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`noiseSuppression`](CallParticipant.md#noisesuppression) | [core/entities/types/call.types.ts:83](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L83) |
| `noiseSuppression$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`noiseSuppression$`](CallParticipant.md#noisesuppression-1) | [core/entities/types/call.types.ts:60](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L60) |
| `outputVolume` | `readonly` | `number` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`outputVolume`](CallParticipant.md#outputvolume) | [core/entities/types/call.types.ts:79](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L79) |
| `outputVolume$` | `readonly` | `Observable`\<`number` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`outputVolume$`](CallParticipant.md#outputvolume-1) | [core/entities/types/call.types.ts:56](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L56) |
| `position` | `readonly` | [`LayoutLayer`](LayoutLayer.md) \| `undefined` | [`CallParticipant`](CallParticipant.md).[`position`](CallParticipant.md#position) | [core/entities/types/call.types.ts:91](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L91) |
| `position$` | `readonly` | `Observable`\<[`LayoutLayer`](LayoutLayer.md) \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`position$`](CallParticipant.md#position-1) | [core/entities/types/call.types.ts:68](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L68) |
| `screenShareStatus` | `readonly` | [`ScreenShareStatus`](../type-aliases/ScreenShareStatus.md) | - | [core/entities/types/call.types.ts:123](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L123) |
| `screenShareStatus$` | `readonly` | `Observable`\<[`ScreenShareStatus`](../type-aliases/ScreenShareStatus.md)\> | - | [core/entities/types/call.types.ts:122](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L122) |
| `studioAudio` | `readonly` | `boolean` | - | [core/entities/types/call.types.ts:127](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L127) |
| `studioAudio$` | `readonly` | `Observable`\<`boolean`\> | - | [core/entities/types/call.types.ts:126](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L126) |
| `subscriberId` | `readonly` | `string` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`subscriberId`](CallParticipant.md#subscriberid) | [core/entities/types/call.types.ts:87](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L87) |
| `subscriberId$` | `readonly` | `Observable`\<`string` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`subscriberId$`](CallParticipant.md#subscriberid-1) | [core/entities/types/call.types.ts:64](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L64) |
| `type` | `readonly` | `string` \| `undefined` | [`CallParticipant`](CallParticipant.md).[`type`](CallParticipant.md#type) | [core/entities/types/call.types.ts:72](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L72) |
| `type$` | `readonly` | `Observable`\<`string` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`type$`](CallParticipant.md#type-1) | [core/entities/types/call.types.ts:49](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L49) |
| `videoMuted` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`videoMuted`](CallParticipant.md#videomuted) | [core/entities/types/call.types.ts:76](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L76) |
| `videoMuted$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`videoMuted$`](CallParticipant.md#videomuted-1) | [core/entities/types/call.types.ts:53](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L53) |
| `visible` | `readonly` | `boolean` | [`CallParticipant`](CallParticipant.md).[`visible`](CallParticipant.md#visible) | [core/entities/types/call.types.ts:74](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L74) |
| `visible$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [`CallParticipant`](CallParticipant.md).[`visible$`](CallParticipant.md#visible-1) | [core/entities/types/call.types.ts:51](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L51) |

## Methods

### addAdditionalDevice()

> **addAdditionalDevice**(`options`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L139)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options` | [`MediaOptions`](MediaOptions.md) |

#### Returns

`Promise`\<`void`\>

***

### addAudioInputDevice()

> **addAudioInputDevice**(`options?`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L141)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options?` | \{ `constraints?`: `MediaTrackConstraints`; `stream?`: `MediaStream`; \} |
| `options.constraints?` | `MediaTrackConstraints` |
| `options.stream?` | `MediaStream` |

#### Returns

`Promise`\<`void`\>

***

### addInputDevices()

> **addInputDevices**(`options?`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L149)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options?` | [`MediaOptions`](MediaOptions.md) |

#### Returns

`Promise`\<`void`\>

***

### addVideoInputDevice()

> **addVideoInputDevice**(`options?`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L145)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options?` | \{ `constraints?`: `MediaTrackConstraints`; `stream?`: `MediaStream`; \} |
| `options.constraints?` | `MediaTrackConstraints` |
| `options.stream?` | `MediaStream` |

#### Returns

`Promise`\<`void`\>

***

### disableStudioAudio()

> **disableStudioAudio**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L129)</sub>

#### Returns

`Promise`\<`void`\>

***

### enableStudioAudio()

> **enableStudioAudio**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L128)</sub>

#### Returns

`Promise`\<`void`\>

***

### end()

> **end**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L112)</sub>

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`end`](CallParticipant.md#end)

***

### mute()

> **mute**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L97)</sub>

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`mute`](CallParticipant.md#mute)

***

### muteVideo()

> **muteVideo**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L100)</sub>

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`muteVideo`](CallParticipant.md#mutevideo)

***

### remove()

> **remove**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L111)</sub>

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`remove`](CallParticipant.md#remove)

***

### removeAdditionalDevice()

> **removeAdditionalDevice**(`id`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L140)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `id` | `string` |

#### Returns

`Promise`\<`void`\>

***

### selectAudioInputDevice()

> **selectAudioInputDevice**(`device`, `options?`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L134)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `device` | `MediaDeviceInfo` |
| `options?` | [`SelectDeviceOptions`](SelectDeviceOptions.md) |

#### Returns

`void`

***

### selectAudioOutputDevice()

> **selectAudioOutputDevice**(`device`, `options?`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L136)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `device` | `MediaDeviceInfo` |
| `options?` | [`SelectDeviceOptions`](SelectDeviceOptions.md) |

#### Returns

`void`

***

### selectVideoInputDevice()

> **selectVideoInputDevice**(`device`, `options?`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L135)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `device` | `MediaDeviceInfo` |
| `options?` | [`SelectDeviceOptions`](SelectDeviceOptions.md) |

#### Returns

`void`

***

### setAudioInputDeviceConstraints()

> **setAudioInputDeviceConstraints**(`constraints`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L152)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `constraints` | `MediaTrackConstraints` |

#### Returns

`Promise`\<`void`\>

***

### setAudioInputSensitivity()

> **setAudioInputSensitivity**(`value`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L107)</sub>

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

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L108)</sub>

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

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L109)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `number` |

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`setAudioOutputVolume`](CallParticipant.md#setaudiooutputvolume)

***

### setInputDevicesConstraints()

> **setInputDevicesConstraints**(`constraints`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L154)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `constraints` | \{ `audio`: `MediaTrackConstraints`; `video`: `MediaTrackConstraints`; \} |
| `constraints.audio` | `MediaTrackConstraints` |
| `constraints.video` | `MediaTrackConstraints` |

#### Returns

`Promise`\<`void`\>

***

### setMeta()

> **setMeta**(`meta`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L113)</sub>

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

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L110)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | [`VideoPosition`](../type-aliases/VideoPosition.md) |

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`setPosition`](CallParticipant.md#setposition)

***

### setVideoInputDeviceConstraints()

> **setVideoInputDeviceConstraints**(`constraints`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L153)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `constraints` | `MediaTrackConstraints` |

#### Returns

`Promise`\<`void`\>

***

### startScreenShare()

> **startScreenShare**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L132)</sub>

#### Returns

`Promise`\<`void`\>

***

### stopScreenShare()

> **stopScreenShare**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L133)</sub>

#### Returns

`Promise`\<`void`\>

***

### toggleAudioInputAutoGain()

> **toggleAudioInputAutoGain**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L104)</sub>

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleAudioInputAutoGain`](CallParticipant.md#toggleaudioinputautogain)

***

### toggleDeaf()

> **toggleDeaf**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L95)</sub>

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleDeaf`](CallParticipant.md#toggledeaf)

***

### toggleEchoCancellation()

> **toggleEchoCancellation**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L103)</sub>

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleEchoCancellation`](CallParticipant.md#toggleechocancellation)

***

### toggleHandraise()

> **toggleHandraise**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L96)</sub>

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleHandraise`](CallParticipant.md#togglehandraise)

***

### toggleLowbitrate()

> **toggleLowbitrate**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L106)</sub>

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleLowbitrate`](CallParticipant.md#togglelowbitrate)

***

### toggleMute()

> **toggleMute**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L99)</sub>

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleMute`](CallParticipant.md#togglemute)

***

### toggleMuteVideo()

> **toggleMuteVideo**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L102)</sub>

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleMuteVideo`](CallParticipant.md#togglemutevideo)

***

### toggleNoiseSuppression()

> **toggleNoiseSuppression**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L105)</sub>

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`toggleNoiseSuppression`](CallParticipant.md#togglenoisesuppression)

***

### unmute()

> **unmute**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L98)</sub>

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`unmute`](CallParticipant.md#unmute)

***

### unmuteVideo()

> **unmuteVideo**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L101)</sub>

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`unmuteVideo`](CallParticipant.md#unmutevideo)

***

### updateMeta()

> **updateMeta**(`meta`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L114)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `meta` | `Record`\<`string`, `unknown`\> |

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`CallParticipant`](CallParticipant.md).[`updateMeta`](CallParticipant.md#updatemeta)
