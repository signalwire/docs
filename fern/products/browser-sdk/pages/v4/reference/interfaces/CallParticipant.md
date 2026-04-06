# Interface: CallParticipant

Defined in: [core/entities/types/call.types.ts:33](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L33)

Base participant interface for call participants
Defines the full public contract for participant objects exposed by Call

## Extended by

- [`CallSelfParticipant`](CallSelfParticipant.md)

## Properties

| Property | Modifier | Type | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="addressid"></a> `addressId` | `readonly` | `string` \| `undefined` | [core/entities/types/call.types.ts:77](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L77) |
| <a id="addressid-1"></a> `addressId$` | `readonly` | `Observable`\<`string`\> | [core/entities/types/call.types.ts:54](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L54) |
| <a id="audiomuted"></a> `audioMuted` | `readonly` | `boolean` | [core/entities/types/call.types.ts:64](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L64) |
| <a id="audiomuted-1"></a> `audioMuted$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:41](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L41) |
| <a id="autogain"></a> `autoGain` | `readonly` | `boolean` | [core/entities/types/call.types.ts:71](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L71) |
| <a id="autogain-1"></a> `autoGain$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:48](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L48) |
| <a id="deaf"></a> `deaf` | `readonly` | `boolean` | [core/entities/types/call.types.ts:66](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L66) |
| <a id="deaf-1"></a> `deaf$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:43](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L43) |
| <a id="denoise"></a> `denoise` | `readonly` | `boolean` | [core/entities/types/call.types.ts:74](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L74) |
| <a id="denoise-1"></a> `denoise$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:51](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L51) |
| <a id="echocancellation"></a> `echoCancellation` | `readonly` | `boolean` | [core/entities/types/call.types.ts:70](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L70) |
| <a id="echocancellation-1"></a> `echoCancellation$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:47](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L47) |
| <a id="handraised"></a> `handraised` | `readonly` | `boolean` | [core/entities/types/call.types.ts:62](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L62) |
| <a id="handraised-1"></a> `handraised$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:39](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L39) |
| <a id="id"></a> `id` | `readonly` | `string` | [core/entities/types/call.types.ts:34](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L34) |
| <a id="inputsensitivity"></a> `inputSensitivity` | `readonly` | `number` \| `undefined` | [core/entities/types/call.types.ts:69](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L69) |
| <a id="inputsensitivity-1"></a> `inputSensitivity$` | `readonly` | `Observable`\<`number`\> | [core/entities/types/call.types.ts:46](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L46) |
| <a id="inputvolume"></a> `inputVolume` | `readonly` | `number` \| `undefined` | [core/entities/types/call.types.ts:67](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L67) |
| <a id="inputvolume-1"></a> `inputVolume$` | `readonly` | `Observable`\<`number`\> | [core/entities/types/call.types.ts:44](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L44) |
| <a id="isaudience"></a> `isAudience` | `readonly` | `boolean` | [core/entities/types/call.types.ts:81](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L81) |
| <a id="istalking"></a> `isTalking` | `readonly` | `boolean` | [core/entities/types/call.types.ts:79](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L79) |
| <a id="istalking-1"></a> `isTalking$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:56](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L56) |
| <a id="lowbitrate"></a> `lowbitrate` | `readonly` | `boolean` | [core/entities/types/call.types.ts:73](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L73) |
| <a id="lowbitrate-1"></a> `lowbitrate$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:50](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L50) |
| <a id="meta"></a> `meta` | `readonly` | `Record`\<`string`, `unknown`\> \| `undefined` | [core/entities/types/call.types.ts:75](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L75) |
| <a id="meta-1"></a> `meta$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | [core/entities/types/call.types.ts:52](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L52) |
| <a id="name"></a> `name` | `readonly` | `string` \| `undefined` | [core/entities/types/call.types.ts:60](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L60) |
| <a id="name-1"></a> `name$` | `readonly` | `Observable`\<`string`\> | [core/entities/types/call.types.ts:37](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L37) |
| <a id="nodeid"></a> `nodeId` | `readonly` | `string` \| `undefined` | [core/entities/types/call.types.ts:78](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L78) |
| <a id="nodeid-1"></a> `nodeId$` | `readonly` | `Observable`\<`string`\> | [core/entities/types/call.types.ts:55](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L55) |
| <a id="noisesuppression"></a> `noiseSuppression` | `readonly` | `boolean` | [core/entities/types/call.types.ts:72](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L72) |
| <a id="noisesuppression-1"></a> `noiseSuppression$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:49](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L49) |
| <a id="outputvolume"></a> `outputVolume` | `readonly` | `number` \| `undefined` | [core/entities/types/call.types.ts:68](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L68) |
| <a id="outputvolume-1"></a> `outputVolume$` | `readonly` | `Observable`\<`number`\> | [core/entities/types/call.types.ts:45](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L45) |
| <a id="position"></a> `position` | `readonly` | [`LayoutLayer`](LayoutLayer.md) \| `undefined` | [core/entities/types/call.types.ts:80](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L80) |
| <a id="position-1"></a> `position$` | `readonly` | `Observable`\<[`LayoutLayer`](LayoutLayer.md) \| `undefined`\> | [core/entities/types/call.types.ts:57](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L57) |
| <a id="subscriberid"></a> `subscriberId` | `readonly` | `string` \| `undefined` | [core/entities/types/call.types.ts:76](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L76) |
| <a id="subscriberid-1"></a> `subscriberId$` | `readonly` | `Observable`\<`string`\> | [core/entities/types/call.types.ts:53](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L53) |
| <a id="type"></a> `type` | `readonly` | `string` \| `undefined` | [core/entities/types/call.types.ts:61](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L61) |
| <a id="type-1"></a> `type$` | `readonly` | `Observable`\<`string`\> | [core/entities/types/call.types.ts:38](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L38) |
| <a id="videomuted"></a> `videoMuted` | `readonly` | `boolean` | [core/entities/types/call.types.ts:65](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L65) |
| <a id="videomuted-1"></a> `videoMuted$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:42](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L42) |
| <a id="visible"></a> `visible` | `readonly` | `boolean` | [core/entities/types/call.types.ts:63](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L63) |
| <a id="visible-1"></a> `visible$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:40](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L40) |

## Methods

### end()

> **end**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:101](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L101)

#### Returns

`Promise`\<`void`\>

***

### mute()

> **mute**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:86](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L86)

#### Returns

`Promise`\<`void`\>

***

### muteVideo()

> **muteVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:89](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L89)

#### Returns

`Promise`\<`void`\>

***

### remove()

> **remove**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:100](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L100)

#### Returns

`Promise`\<`void`\>

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

***

### toggleAudioInputAutoGain()

> **toggleAudioInputAutoGain**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:93](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L93)

#### Returns

`Promise`\<`void`\>

***

### toggleDeaf()

> **toggleDeaf**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:84](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L84)

#### Returns

`Promise`\<`void`\>

***

### toggleEchoCancellation()

> **toggleEchoCancellation**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:92](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L92)

#### Returns

`Promise`\<`void`\>

***

### toggleHandraise()

> **toggleHandraise**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:85](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L85)

#### Returns

`Promise`\<`void`\>

***

### toggleLowbitrate()

> **toggleLowbitrate**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:95](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L95)

#### Returns

`Promise`\<`void`\>

***

### toggleMute()

> **toggleMute**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:88](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L88)

#### Returns

`Promise`\<`void`\>

***

### toggleMuteVideo()

> **toggleMuteVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:91](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L91)

#### Returns

`Promise`\<`void`\>

***

### toggleNoiseSuppression()

> **toggleNoiseSuppression**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:94](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L94)

#### Returns

`Promise`\<`void`\>

***

### unmute()

> **unmute**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:87](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L87)

#### Returns

`Promise`\<`void`\>

***

### unmuteVideo()

> **unmuteVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:90](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L90)

#### Returns

`Promise`\<`void`\>

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
