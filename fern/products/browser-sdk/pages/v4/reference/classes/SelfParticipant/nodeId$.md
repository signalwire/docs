# nodeId$

#### Get Signature

> **get** **nodeId$**(): `Observable`\<`string` \| `undefined`\>

Defined in: [core/entities/Participant.ts:262](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L262)

Observable of the server node ID for this participant.

##### Returns

`Observable`\<`string` \| `undefined`\>

#### Implementation of

[`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md).[`nodeId$`](../../interfaces/CallSelfParticipant.md#nodeid-1)

#### Inherited from

[`Participant`](Participant.md).[`nodeId$`](Participant.md#nodeid-1)

## nodeId

#### Get Signature

> **get** **nodeId**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:407](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L407)

Server node ID for this participant, or `undefined` if not available.

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md).[`nodeId`](../../interfaces/CallSelfParticipant.md#nodeid)

#### Inherited from

[`Participant`](Participant.md).[`nodeId`](Participant.md#nodeid)
