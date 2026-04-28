# updateMeta

> **updateMeta**(`_meta`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:585](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L585)

Merges values into custom metadata (unlike [setMeta](Participant.md#setmeta) which replaces).

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `_meta` | `Record`\<`string`, `unknown`\> | Metadata to merge. |

#### Returns

`Promise`\<`void`\>

#### Throws

Not yet implemented.

#### Implementation of

[`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md).[`updateMeta`](../../interfaces/CallSelfParticipant.md#updatemeta)

#### Inherited from

[`Participant`](Participant.md).[`updateMeta`](Participant.md#updatemeta)
