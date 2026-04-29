---
title: "setPosition"
---

# setPosition

> **setPosition**(`value`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:547](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L547)

Sets the participant's position in the video layout.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `value` | [`VideoPosition`](../type-aliases/VideoPosition.md) | The [VideoPosition](../type-aliases/VideoPosition.md) to assign (e.g. `'auto'`, `'reserved-0'`). |

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`setPosition`](../interfaces/CallSelfParticipant.md#setposition)

#### Inherited from

[`Participant`](../Participant/index.md).[`setPosition`](../Participant/index.md#setposition)
