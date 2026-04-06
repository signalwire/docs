# Interface: Storage

Defined in: [dependencies/interfaces.ts:4](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L4)

Key-value storage interface for persisting SDK preferences and state.

## Methods

### getItem()

> **getItem**(`key`, `scope`): `Promise`\<`string` \| `null`\>

Defined in: [dependencies/interfaces.ts:6](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L6)

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

Defined in: [dependencies/interfaces.ts:7](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L7)

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

Defined in: [dependencies/interfaces.ts:5](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L5)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `key` | `string` |
| `value` | `string` \| `null` |
| `scope` | `StorageScope` |

#### Returns

`Promise`\<`void`\>
