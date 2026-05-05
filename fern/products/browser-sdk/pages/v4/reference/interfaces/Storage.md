---
title: "Storage"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L4)</sub>

Key-value storage interface for persisting SDK preferences and state.

## Methods

### clear()

> **clear**(`scope`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L9)</sub>

Clears all keys in the given scope. Implementations may scope the clear to SDK keys only.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `scope` | `StorageScope` |

#### Returns

`Promise`\<`void`\>

***

### getItem()

> **getItem**(`key`, `scope`): `Promise`\<`string` \| `null`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L6)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `key` | `string` |
| `scope` | `StorageScope` |

#### Returns

`Promise`\<`string` \| `null`\>

***

### removeItem()

> **removeItem**(`key`, `scope`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L7)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `key` | `string` |
| `scope` | `StorageScope` |

#### Returns

`Promise`\<`void`\>

***

### setItem()

> **setItem**(`key`, `value`, `scope`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L5)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `key` | `string` |
| `value` | `string` \| `null` |
| `scope` | `StorageScope` |

#### Returns

`Promise`\<`void`\>
