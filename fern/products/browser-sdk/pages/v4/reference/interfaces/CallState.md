# Interface: CallState

Defined in: [core/entities/types/call.types.ts:246](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L246)

Observable state of a call (status, recording, participants, etc.).

## Extended by

- [`Call`](Call.md)

## Properties

| Property | Modifier | Type | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="id"></a> `id` | `readonly` | `string` | [core/entities/types/call.types.ts:247](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L247) |
| <a id="locked"></a> `locked` | `readonly` | `boolean` | [core/entities/types/call.types.ts:257](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L257) |
| <a id="locked-1"></a> `locked$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:256](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L256) |
| <a id="meta"></a> `meta` | `readonly` | `Record`\<`string`, `unknown`\> | [core/entities/types/call.types.ts:259](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L259) |
| <a id="meta-1"></a> `meta$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | [core/entities/types/call.types.ts:258](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L258) |
| <a id="participants"></a> `participants` | `readonly` | [`CallParticipant`](CallParticipant.md)[] | [core/entities/types/call.types.ts:261](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L261) |
| <a id="participants-1"></a> `participants$` | `readonly` | `Observable`\<[`CallParticipant`](CallParticipant.md)[]\> | [core/entities/types/call.types.ts:260](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L260) |
| <a id="raisehandpriority"></a> `raiseHandPriority` | `readonly` | `boolean` | [core/entities/types/call.types.ts:255](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L255) |
| <a id="raisehandpriority-1"></a> `raiseHandPriority$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:254](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L254) |
| <a id="recording"></a> `recording` | `readonly` | `boolean` | [core/entities/types/call.types.ts:251](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L251) |
| <a id="recording-1"></a> `recording$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:250](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L250) |
| <a id="status"></a> `status` | `readonly` | [`CallStatus`](../type-aliases/CallStatus.md) | [core/entities/types/call.types.ts:249](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L249) |
| <a id="status-1"></a> `status$` | `readonly` | `Observable`\<[`CallStatus`](../type-aliases/CallStatus.md)\> | [core/entities/types/call.types.ts:248](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L248) |
| <a id="streaming"></a> `streaming` | `readonly` | `boolean` | [core/entities/types/call.types.ts:253](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L253) |
| <a id="streaming-1"></a> `streaming$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:252](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L252) |

## Methods

### setMeta()

> **setMeta**(`meta`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:262](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L262)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `meta` | `Record`\<`string`, `unknown`\> |

#### Returns

`Promise`\<`void`\>

***

### updateMeta()

> **updateMeta**(`meta`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:263](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/types/call.types.ts#L263)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `meta` | `Record`\<`string`, `unknown`\> |

#### Returns

`Promise`\<`void`\>
