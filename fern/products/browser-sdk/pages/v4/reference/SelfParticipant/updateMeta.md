---
title: "updateMeta"
---

# updateMeta

> **updateMeta**(`_meta`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:585](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L585)

Merges values into custom metadata (unlike [setMeta](../Participant/index.md#setmeta) which replaces).

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `_meta` | `Record`\<`string`, `unknown`\> | Metadata to merge. |

#### Returns

`Promise`\<`void`\>

#### Throws

Not yet implemented.

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`updateMeta`](../interfaces/CallSelfParticipant.md#updatemeta)

#### Inherited from

[`Participant`](../Participant/index.md).[`updateMeta`](../Participant/index.md#updatemeta)
