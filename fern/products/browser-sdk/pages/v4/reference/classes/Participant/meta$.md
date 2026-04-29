# meta$

#### Get Signature

> **get** **meta$**(): `Observable`\<`Record`\<`string`, `unknown`\> \| `undefined`\>

Defined in: [core/entities/Participant.ts:232](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L232)

Observable of custom metadata for this participant.

##### Returns

`Observable`\<`Record`\<`string`, `unknown`\> \| `undefined`\>

#### Implementation of

[`CallParticipant`](../../interfaces/CallParticipant.md).[`meta$`](../../interfaces/CallParticipant.md#meta-1)

## meta

#### Get Signature

> **get** **meta**(): `Record`\<`string`, `unknown`\> \| `undefined`

Defined in: [core/entities/Participant.ts:392](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L392)

Custom metadata for this participant, or `undefined` if not set.

##### Returns

`Record`\<`string`, `unknown`\> \| `undefined`

#### Implementation of

[`CallParticipant`](../../interfaces/CallParticipant.md).[`meta`](../../interfaces/CallParticipant.md#meta)
