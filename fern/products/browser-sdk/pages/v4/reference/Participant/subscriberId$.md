---
title: "subscriberId$"
---

# subscriberId$

#### Get Signature

> **get** **subscriberId$**(): `Observable`\<`string` \| `undefined`\>

Defined in: [core/entities/Participant.ts:242](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L242)

Observable of the participant's subscriber ID.

##### Returns

`Observable`\<`string` \| `undefined`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`subscriberId$`](../interfaces/CallParticipant.md#subscriberid-1)

## subscriberId

#### Get Signature

> **get** **subscriberId**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:397](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L397)

Subscriber ID of this participant, or `undefined` if not available.

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`subscriberId`](../interfaces/CallParticipant.md#subscriberid)
