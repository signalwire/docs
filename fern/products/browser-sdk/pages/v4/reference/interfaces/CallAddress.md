---
title: "CallAddress"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L177)</sub>

Minimal address interface for call context
Avoids circular dependency with full Address class

## Properties

| Property | Modifier | Type | Defined in |
| ------ | ------ | ------ | ------ |
| `displayName?` | `readonly` | `string` | [core/entities/types/call.types.ts:179](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L179) |
| `id` | `readonly` | `string` | [core/entities/types/call.types.ts:178](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L178) |
| `textMessages$` | `readonly` | `Observable`\<`CallTextMessageCollection` \| `undefined`\> | [core/entities/types/call.types.ts:182](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L182) |
| `type?` | `readonly` | `string` | [core/entities/types/call.types.ts:180](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L180) |

## Methods

### sendText()

> **sendText**(`text`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L181)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `text` | `string` |

#### Returns

`Promise`\<`void`\>
