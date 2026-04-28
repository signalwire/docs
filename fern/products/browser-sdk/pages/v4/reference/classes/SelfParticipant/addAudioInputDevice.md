# addAudioInputDevice

> **addAudioInputDevice**(`__namedParameters?`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:716](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L716)

Adds or replaces the primary audio input device with optional constraints or stream.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `__namedParameters` | \{ `constraints?`: `MediaTrackConstraints`; `stream?`: `MediaStream`; \} |
| `__namedParameters.constraints?` | `MediaTrackConstraints` |
| `__namedParameters.stream?` | `MediaStream` |

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md).[`addAudioInputDevice`](../../interfaces/CallSelfParticipant.md#addaudioinputdevice)
