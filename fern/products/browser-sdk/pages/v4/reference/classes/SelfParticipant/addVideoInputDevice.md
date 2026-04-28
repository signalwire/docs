# addVideoInputDevice

> **addVideoInputDevice**(`__namedParameters?`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:732](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L732)

Adds or replaces the primary video input device with optional constraints or stream.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `__namedParameters` | \{ `constraints?`: `MediaTrackConstraints`; `stream?`: `MediaStream`; \} |
| `__namedParameters.constraints?` | `MediaTrackConstraints` |
| `__namedParameters.stream?` | `MediaStream` |

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md).[`addVideoInputDevice`](../../interfaces/CallSelfParticipant.md#addvideoinputdevice)
