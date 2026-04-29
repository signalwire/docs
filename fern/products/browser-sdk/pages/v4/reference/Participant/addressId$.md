---
title: "addressId$"
---

# addressId$

#### Get Signature

> **get** **addressId$**(): `Observable`\<`string` \| `undefined`\>

Defined in: [core/entities/Participant.ts:252](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L252)

Observable of the participant's address ID.

##### Returns

`Observable`\<`string` \| `undefined`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`addressId$`](../interfaces/CallParticipant.md#addressid-1)

## addressId

#### Get Signature

> **get** **addressId**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:402](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L402)

Address ID of this participant, or `undefined` if not available.

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`addressId`](../interfaces/CallParticipant.md#addressid)
