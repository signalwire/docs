# Interface: WebRTCMediaDevices

Defined in: [dependencies/interfaces.ts:120](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L120)

Subset of the `MediaDevices` interface actually used by the SDK.

Implementations only need to provide these methods — the full browser
`MediaDevices` type is intentionally not required so that React Native
and other non-browser environments can conform without polyfilling
unused APIs.

## Methods

### addEventListener()

> **addEventListener**(`type`, `listener`): `void`

Defined in: [dependencies/interfaces.ts:124](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L124)

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

Defined in: [dependencies/interfaces.ts:123](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L123)

#### Returns

`Promise`\<`MediaDeviceInfo`[]\>

***

### getDisplayMedia()?

> `optional` **getDisplayMedia**(`options`): `Promise`\<`MediaStream`\>

Defined in: [dependencies/interfaces.ts:122](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L122)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options` | `DisplayMediaStreamOptions` |

#### Returns

`Promise`\<`MediaStream`\>

***

### getUserMedia()

> **getUserMedia**(`constraints`): `Promise`\<`MediaStream`\>

Defined in: [dependencies/interfaces.ts:121](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L121)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `constraints` | `MediaStreamConstraints` |

#### Returns

`Promise`\<`MediaStream`\>

***

### removeEventListener()

> **removeEventListener**(`type`, `listener`): `void`

Defined in: [dependencies/interfaces.ts:125](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L125)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `type` | `string` |
| `listener` | `EventListenerOrEventListenerObject` |

#### Returns

`void`
