# setPosition

> **setPosition**(`value`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:547](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L547)

Sets the participant's position in the video layout.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `value` | [`VideoPosition`](../../type-aliases/VideoPosition.md) | The [VideoPosition](../../type-aliases/VideoPosition.md) to assign (e.g. `'auto'`, `'reserved-0'`). |

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md).[`setPosition`](../../interfaces/CallSelfParticipant.md#setposition)

#### Inherited from

[`Participant`](Participant.md).[`setPosition`](Participant.md#setposition)
