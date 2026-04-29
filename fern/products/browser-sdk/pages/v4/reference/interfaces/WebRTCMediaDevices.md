---
title: "WebRTCMediaDevices"
---

# Interface: WebRTCMediaDevices

Defined in: [dependencies/interfaces.ts:122](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L122)

Subset of the `MediaDevices` interface actually used by the SDK.

Implementations only need to provide these methods — the full browser
`MediaDevices` type is intentionally not required so that React Native
and other non-browser environments can conform without polyfilling
unused APIs.

## Methods

### addEventListener()

> **addEventListener**(`type`, `listener`): `void`

Defined in: [dependencies/interfaces.ts:126](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L126)

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

Defined in: [dependencies/interfaces.ts:125](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L125)

#### Returns

`Promise`\<`MediaDeviceInfo`[]\>

***

### getDisplayMedia()?

> `optional` **getDisplayMedia**(`options`): `Promise`\<`MediaStream`\>

Defined in: [dependencies/interfaces.ts:124](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L124)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options` | `DisplayMediaStreamOptions` |

#### Returns

`Promise`\<`MediaStream`\>

***

### getUserMedia()

> **getUserMedia**(`constraints`): `Promise`\<`MediaStream`\>

Defined in: [dependencies/interfaces.ts:123](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L123)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `constraints` | `MediaStreamConstraints` |

#### Returns

`Promise`\<`MediaStream`\>

***

### removeEventListener()

> **removeEventListener**(`type`, `listener`): `void`

Defined in: [dependencies/interfaces.ts:127](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L127)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `type` | `string` |
| `listener` | `EventListenerOrEventListenerObject` |

#### Returns

`void`
