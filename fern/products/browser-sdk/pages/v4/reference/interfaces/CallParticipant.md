---
title: "CallParticipant"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L44)</sub>

Base participant interface for call participants
Defines the full public contract for participant objects exposed by Call

## Extended by

- [`CallSelfParticipant`](CallSelfParticipant.md)

## Properties

| Property | Modifier | Type | Defined in |
| ------ | ------ | ------ | ------ |
| `addressId` | `readonly` | `string` \| `undefined` | [core/entities/types/call.types.ts:88](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L88) |
| `addressId$` | `readonly` | `Observable`\<`string` \| `undefined`\> | [core/entities/types/call.types.ts:65](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L65) |
| `audioMuted` | `readonly` | `boolean` | [core/entities/types/call.types.ts:75](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L75) |
| `audioMuted$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [core/entities/types/call.types.ts:52](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L52) |
| `autoGain` | `readonly` | `boolean` | [core/entities/types/call.types.ts:82](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L82) |
| `autoGain$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [core/entities/types/call.types.ts:59](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L59) |
| `deaf` | `readonly` | `boolean` | [core/entities/types/call.types.ts:77](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L77) |
| `deaf$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [core/entities/types/call.types.ts:54](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L54) |
| `denoise` | `readonly` | `boolean` | [core/entities/types/call.types.ts:85](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L85) |
| `denoise$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [core/entities/types/call.types.ts:62](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L62) |
| `echoCancellation` | `readonly` | `boolean` | [core/entities/types/call.types.ts:81](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L81) |
| `echoCancellation$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [core/entities/types/call.types.ts:58](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L58) |
| `handraised` | `readonly` | `boolean` | [core/entities/types/call.types.ts:73](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L73) |
| `handraised$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [core/entities/types/call.types.ts:50](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L50) |
| `id` | `readonly` | `string` | [core/entities/types/call.types.ts:45](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L45) |
| `inputSensitivity` | `readonly` | `number` \| `undefined` | [core/entities/types/call.types.ts:80](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L80) |
| `inputSensitivity$` | `readonly` | `Observable`\<`number` \| `undefined`\> | [core/entities/types/call.types.ts:57](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L57) |
| `inputVolume` | `readonly` | `number` \| `undefined` | [core/entities/types/call.types.ts:78](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L78) |
| `inputVolume$` | `readonly` | `Observable`\<`number` \| `undefined`\> | [core/entities/types/call.types.ts:55](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L55) |
| `isAudience` | `readonly` | `boolean` | [core/entities/types/call.types.ts:92](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L92) |
| `isTalking` | `readonly` | `boolean` | [core/entities/types/call.types.ts:90](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L90) |
| `isTalking$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [core/entities/types/call.types.ts:67](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L67) |
| `lowbitrate` | `readonly` | `boolean` | [core/entities/types/call.types.ts:84](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L84) |
| `lowbitrate$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [core/entities/types/call.types.ts:61](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L61) |
| `meta` | `readonly` | `Record`\<`string`, `unknown`\> \| `undefined` | [core/entities/types/call.types.ts:86](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L86) |
| `meta$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\> \| `undefined`\> | [core/entities/types/call.types.ts:63](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L63) |
| `name` | `readonly` | `string` \| `undefined` | [core/entities/types/call.types.ts:71](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L71) |
| `name$` | `readonly` | `Observable`\<`string` \| `undefined`\> | [core/entities/types/call.types.ts:48](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L48) |
| `nodeId` | `readonly` | `string` \| `undefined` | [core/entities/types/call.types.ts:89](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L89) |
| `nodeId$` | `readonly` | `Observable`\<`string` \| `undefined`\> | [core/entities/types/call.types.ts:66](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L66) |
| `noiseSuppression` | `readonly` | `boolean` | [core/entities/types/call.types.ts:83](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L83) |
| `noiseSuppression$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [core/entities/types/call.types.ts:60](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L60) |
| `outputVolume` | `readonly` | `number` \| `undefined` | [core/entities/types/call.types.ts:79](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L79) |
| `outputVolume$` | `readonly` | `Observable`\<`number` \| `undefined`\> | [core/entities/types/call.types.ts:56](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L56) |
| `position` | `readonly` | [`LayoutLayer`](LayoutLayer.md) \| `undefined` | [core/entities/types/call.types.ts:91](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L91) |
| `position$` | `readonly` | `Observable`\<[`LayoutLayer`](LayoutLayer.md) \| `undefined`\> | [core/entities/types/call.types.ts:68](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L68) |
| `subscriberId` | `readonly` | `string` \| `undefined` | [core/entities/types/call.types.ts:87](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L87) |
| `subscriberId$` | `readonly` | `Observable`\<`string` \| `undefined`\> | [core/entities/types/call.types.ts:64](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L64) |
| `type` | `readonly` | `string` \| `undefined` | [core/entities/types/call.types.ts:72](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L72) |
| `type$` | `readonly` | `Observable`\<`string` \| `undefined`\> | [core/entities/types/call.types.ts:49](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L49) |
| `videoMuted` | `readonly` | `boolean` | [core/entities/types/call.types.ts:76](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L76) |
| `videoMuted$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [core/entities/types/call.types.ts:53](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L53) |
| `visible` | `readonly` | `boolean` | [core/entities/types/call.types.ts:74](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L74) |
| `visible$` | `readonly` | `Observable`\<`boolean` \| `undefined`\> | [core/entities/types/call.types.ts:51](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L51) |

## Methods

### end()

> **end**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L112)</sub>

#### Returns

`Promise`\<`void`\>

***

### mute()

> **mute**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L97)</sub>

#### Returns

`Promise`\<`void`\>

***

### muteVideo()

> **muteVideo**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L100)</sub>

#### Returns

`Promise`\<`void`\>

***

### remove()

> **remove**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L111)</sub>

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

***

### toggleAudioInputAutoGain()

> **toggleAudioInputAutoGain**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L104)</sub>

#### Returns

`Promise`\<`void`\>

***

### toggleDeaf()

> **toggleDeaf**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L95)</sub>

#### Returns

`Promise`\<`void`\>

***

### toggleEchoCancellation()

> **toggleEchoCancellation**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L103)</sub>

#### Returns

`Promise`\<`void`\>

***

### toggleHandraise()

> **toggleHandraise**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L96)</sub>

#### Returns

`Promise`\<`void`\>

***

### toggleLowbitrate()

> **toggleLowbitrate**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L106)</sub>

#### Returns

`Promise`\<`void`\>

***

### toggleMute()

> **toggleMute**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L99)</sub>

#### Returns

`Promise`\<`void`\>

***

### toggleMuteVideo()

> **toggleMuteVideo**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L102)</sub>

#### Returns

`Promise`\<`void`\>

***

### toggleNoiseSuppression()

> **toggleNoiseSuppression**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L105)</sub>

#### Returns

`Promise`\<`void`\>

***

### unmute()

> **unmute**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L98)</sub>

#### Returns

`Promise`\<`void`\>

***

### unmuteVideo()

> **unmuteVideo**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L101)</sub>

#### Returns

`Promise`\<`void`\>

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
