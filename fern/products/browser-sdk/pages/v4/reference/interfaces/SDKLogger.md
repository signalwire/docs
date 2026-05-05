---
title: "SDKLogger"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/utils/logger.ts#L14)</sub>

Logger interface that consumers can implement to replace the built-in logger.
All methods accept variadic arguments matching the browser console API.

## Methods

### debug()

> **debug**(...`args`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/utils/logger.ts#L18)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| ...`args` | `unknown`[] |

#### Returns

`void`

***

### error()

> **error**(...`args`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/utils/logger.ts#L15)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| ...`args` | `unknown`[] |

#### Returns

`void`

***

### info()

> **info**(...`args`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/utils/logger.ts#L17)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| ...`args` | `unknown`[] |

#### Returns

`void`

***

### trace()

> **trace**(...`args`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/utils/logger.ts#L19)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| ...`args` | `unknown`[] |

#### Returns

`void`

***

### warn()

> **warn**(...`args`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/utils/logger.ts#L16)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| ...`args` | `unknown`[] |

#### Returns

`void`
