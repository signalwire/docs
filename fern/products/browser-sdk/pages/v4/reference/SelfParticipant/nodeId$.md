---
title: "nodeId$"
---

# nodeId$

#### Get Signature

> **get** **nodeId$**(): `Observable`\<`string` \| `undefined`\>

Defined in: [core/entities/Participant.ts:262](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L262)

Observable of the server node ID for this participant.

##### Returns

`Observable`\<`string` \| `undefined`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`nodeId$`](../interfaces/CallSelfParticipant.md#nodeid-1)

#### Inherited from

[`Participant`](../Participant/index.md).[`nodeId$`](../Participant/index.md#nodeid-1)

## nodeId

#### Get Signature

> **get** **nodeId**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:407](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L407)

Server node ID for this participant, or `undefined` if not available.

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`nodeId`](../interfaces/CallSelfParticipant.md#nodeid)

#### Inherited from

[`Participant`](../Participant/index.md).[`nodeId`](../Participant/index.md#nodeid)
