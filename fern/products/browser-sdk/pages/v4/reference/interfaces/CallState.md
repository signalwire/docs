# Interface: CallState

Defined in: [core/entities/types/call.types.ts:196](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L196)

Observable state of a call (status, recording, participants, etc.).

## Extended by

- [`Call`](Call.md)

## Properties

| Property | Modifier | Type | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="id"></a> `id` | `readonly` | `string` | [core/entities/types/call.types.ts:197](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L197) |
| <a id="locked"></a> `locked` | `readonly` | `boolean` | [core/entities/types/call.types.ts:207](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L207) |
| <a id="locked-1"></a> `locked$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:206](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L206) |
| <a id="meta"></a> `meta` | `readonly` | `Record`\<`string`, `unknown`\> | [core/entities/types/call.types.ts:209](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L209) |
| <a id="meta-1"></a> `meta$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | [core/entities/types/call.types.ts:208](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L208) |
| <a id="participants"></a> `participants` | `readonly` | [`CallParticipant`](CallParticipant.md)[] | [core/entities/types/call.types.ts:211](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L211) |
| <a id="participants-1"></a> `participants$` | `readonly` | `Observable`\<[`CallParticipant`](CallParticipant.md)[]\> | [core/entities/types/call.types.ts:210](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L210) |
| <a id="raisehandpriority"></a> `raiseHandPriority` | `readonly` | `boolean` | [core/entities/types/call.types.ts:205](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L205) |
| <a id="raisehandpriority-1"></a> `raiseHandPriority$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:204](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L204) |
| <a id="recording"></a> `recording` | `readonly` | `boolean` | [core/entities/types/call.types.ts:201](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L201) |
| <a id="recording-1"></a> `recording$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:200](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L200) |
| <a id="status"></a> `status` | `readonly` | [`CallStatus`](../type-aliases/CallStatus.md) | [core/entities/types/call.types.ts:199](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L199) |
| <a id="status-1"></a> `status$` | `readonly` | `Observable`\<[`CallStatus`](../type-aliases/CallStatus.md)\> | [core/entities/types/call.types.ts:198](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L198) |
| <a id="streaming"></a> `streaming` | `readonly` | `boolean` | [core/entities/types/call.types.ts:203](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L203) |
| <a id="streaming-1"></a> `streaming$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:202](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L202) |

## Methods

### setMeta()

> **setMeta**(`meta`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:212](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L212)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `meta` | `Record`\<`string`, `unknown`\> |

#### Returns

`Promise`\<`void`\>

***

### updateMeta()

> **updateMeta**(`meta`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:213](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/types/call.types.ts#L213)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `meta` | `Record`\<`string`, `unknown`\> |

#### Returns

`Promise`\<`void`\>
