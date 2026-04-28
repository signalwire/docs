# Interface: SDKLogger

Defined in: [utils/logger.ts:14](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/utils/logger.ts#L14)

Logger interface that consumers can implement to replace the built-in logger.
All methods accept variadic arguments matching the browser console API.

## Methods

### debug()

> **debug**(...`args`): `void`

Defined in: [utils/logger.ts:18](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/utils/logger.ts#L18)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| ...`args` | `unknown`[] |

#### Returns

`void`

***

### error()

> **error**(...`args`): `void`

Defined in: [utils/logger.ts:15](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/utils/logger.ts#L15)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| ...`args` | `unknown`[] |

#### Returns

`void`

***

### info()

> **info**(...`args`): `void`

Defined in: [utils/logger.ts:17](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/utils/logger.ts#L17)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| ...`args` | `unknown`[] |

#### Returns

`void`

***

### trace()

> **trace**(...`args`): `void`

Defined in: [utils/logger.ts:19](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/utils/logger.ts#L19)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| ...`args` | `unknown`[] |

#### Returns

`void`

***

### warn()

> **warn**(...`args`): `void`

Defined in: [utils/logger.ts:16](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/utils/logger.ts#L16)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| ...`args` | `unknown`[] |

#### Returns

`void`
