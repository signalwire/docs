---
title: "WebRTCMediaDevices"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L122)</sub>

Subset of the `MediaDevices` interface actually used by the SDK.

Implementations only need to provide these methods — the full browser
`MediaDevices` type is intentionally not required so that React Native
and other non-browser environments can conform without polyfilling
unused APIs.

## Methods

### addEventListener()

> **addEventListener**(`type`, `listener`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L126)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `type` | `string` |
| `listener` | `EventListenerOrEventListenerObject` |

#### Returns

`void`

***

### enumerateDevices()

> **enumerateDevices**(): `Promise`\<`MediaDeviceInfo`[]\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L125)</sub>

#### Returns

`Promise`\<`MediaDeviceInfo`[]\>

***

### getDisplayMedia()?

> `optional` **getDisplayMedia**(`options`): `Promise`\<`MediaStream`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L124)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options` | `DisplayMediaStreamOptions` |

#### Returns

`Promise`\<`MediaStream`\>

***

### getUserMedia()

> **getUserMedia**(`constraints`): `Promise`\<`MediaStream`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L123)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `constraints` | `MediaStreamConstraints` |

#### Returns

`Promise`\<`MediaStream`\>

***

### removeEventListener()

> **removeEventListener**(`type`, `listener`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L127)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `type` | `string` |
| `listener` | `EventListenerOrEventListenerObject` |

#### Returns

`void`
