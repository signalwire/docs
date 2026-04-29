---
title: "setInputDevicesConstraints"
---

# setInputDevicesConstraints

> **setInputDevicesConstraints**(`constraints`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:766](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L766)

Updates both audio and video input track constraints for the active call.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `constraints` | \{ `audio`: `MediaTrackConstraints`; `video`: `MediaTrackConstraints`; \} |
| `constraints.audio` | `MediaTrackConstraints` |
| `constraints.video` | `MediaTrackConstraints` |

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`setInputDevicesConstraints`](../interfaces/CallSelfParticipant.md#setinputdevicesconstraints)
