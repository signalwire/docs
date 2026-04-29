# subscriberId$

#### Get Signature

> **get** **subscriberId$**(): `Observable`\<`string` \| `undefined`\>

Defined in: [core/entities/Participant.ts:242](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L242)

Observable of the participant's subscriber ID.

##### Returns

`Observable`\<`string` \| `undefined`\>

#### Implementation of

[`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md).[`subscriberId$`](../../interfaces/CallSelfParticipant.md#subscriberid-1)

#### Inherited from

[`Participant`](Participant.md).[`subscriberId$`](Participant.md#subscriberid-1)

## subscriberId

#### Get Signature

> **get** **subscriberId**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:397](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L397)

Subscriber ID of this participant, or `undefined` if not available.

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md).[`subscriberId`](../../interfaces/CallSelfParticipant.md#subscriberid)

#### Inherited from

[`Participant`](Participant.md).[`subscriberId`](Participant.md#subscriberid)
