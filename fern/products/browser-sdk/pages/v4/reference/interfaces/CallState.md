---
title: "CallState"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L246)</sub>

Observable state of a call (status, recording, participants, etc.).

## Extended by

- [`Call`](Call.md)

## Properties

| Property | Modifier | Type | Defined in |
| ------ | ------ | ------ | ------ |
| `id` | `readonly` | `string` | [core/entities/types/call.types.ts:247](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L247) |
| `locked` | `readonly` | `boolean` | [core/entities/types/call.types.ts:257](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L257) |
| `locked$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:256](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L256) |
| `meta` | `readonly` | `Record`\<`string`, `unknown`\> | [core/entities/types/call.types.ts:259](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L259) |
| `meta$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | [core/entities/types/call.types.ts:258](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L258) |
| `participants` | `readonly` | [`CallParticipant`](CallParticipant.md)[] | [core/entities/types/call.types.ts:261](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L261) |
| `participants$` | `readonly` | `Observable`\<[`CallParticipant`](CallParticipant.md)[]\> | [core/entities/types/call.types.ts:260](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L260) |
| `raiseHandPriority` | `readonly` | `boolean` | [core/entities/types/call.types.ts:255](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L255) |
| `raiseHandPriority$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:254](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L254) |
| `recording` | `readonly` | `boolean` | [core/entities/types/call.types.ts:251](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L251) |
| `recording$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:250](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L250) |
| `status` | `readonly` | [`CallStatus`](../type-aliases/CallStatus.md) | [core/entities/types/call.types.ts:249](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L249) |
| `status$` | `readonly` | `Observable`\<[`CallStatus`](../type-aliases/CallStatus.md)\> | [core/entities/types/call.types.ts:248](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L248) |
| `streaming` | `readonly` | `boolean` | [core/entities/types/call.types.ts:253](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L253) |
| `streaming$` | `readonly` | `Observable`\<`boolean`\> | [core/entities/types/call.types.ts:252](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L252) |

## Methods

### setMeta()

> **setMeta**(`meta`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L262)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `meta` | `Record`\<`string`, `unknown`\> |

#### Returns

`Promise`\<`void`\>

***

### updateMeta()

> **updateMeta**(`meta`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L263)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `meta` | `Record`\<`string`, `unknown`\> |

#### Returns

`Promise`\<`void`\>
