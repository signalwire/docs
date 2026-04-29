---
title: "CallAddress"
---

# Interface: CallAddress

Defined in: [core/entities/types/call.types.ts:177](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L177)

Minimal address interface for call context
Avoids circular dependency with full Address class

## Properties

| Property | Modifier | Type | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="displayname"></a> `displayName?` | `readonly` | `string` | [core/entities/types/call.types.ts:179](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L179) |
| <a id="id"></a> `id` | `readonly` | `string` | [core/entities/types/call.types.ts:178](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L178) |
| <a id="textmessages"></a> `textMessages$` | `readonly` | `Observable`\<`CallTextMessageCollection` \| `undefined`\> | [core/entities/types/call.types.ts:182](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L182) |
| <a id="type"></a> `type?` | `readonly` | `string` | [core/entities/types/call.types.ts:180](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L180) |

## Methods

### sendText()

> **sendText**(`text`): `Promise`\<`void`\>

Defined in: [core/entities/types/call.types.ts:181](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L181)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `text` | `string` |

#### Returns

`Promise`\<`void`\>
