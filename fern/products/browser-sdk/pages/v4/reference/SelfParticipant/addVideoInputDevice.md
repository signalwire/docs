---
title: "addVideoInputDevice"
---

# addVideoInputDevice

> **addVideoInputDevice**(`__namedParameters?`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:732](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L732)

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

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`addVideoInputDevice`](../interfaces/CallSelfParticipant.md#addvideoinputdevice)
