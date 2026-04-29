---
title: "meta$"
---

# meta$

#### Get Signature

> **get** **meta$**(): `Observable`\<`Record`\<`string`, `unknown`\> \| `undefined`\>

Defined in: [core/entities/Participant.ts:232](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L232)

Observable of custom metadata for this participant.

##### Returns

`Observable`\<`Record`\<`string`, `unknown`\> \| `undefined`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`meta$`](../interfaces/CallSelfParticipant.md#meta-1)

#### Inherited from

[`Participant`](../Participant/index.md).[`meta$`](../Participant/index.md#meta-1)

## meta

#### Get Signature

> **get** **meta**(): `Record`\<`string`, `unknown`\> \| `undefined`

Defined in: [core/entities/Participant.ts:392](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L392)

Custom metadata for this participant, or `undefined` if not set.

##### Returns

`Record`\<`string`, `unknown`\> \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`meta`](../interfaces/CallSelfParticipant.md#meta)

#### Inherited from

[`Participant`](../Participant/index.md).[`meta`](../Participant/index.md#meta)
