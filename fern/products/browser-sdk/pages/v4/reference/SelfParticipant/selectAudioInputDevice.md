---
title: "selectAudioInputDevice"
---

# selectAudioInputDevice

> **selectAudioInputDevice**(`device`, `options?`): `void`

Defined in: [core/entities/Participant.ts:753](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L753)

Selects the audio input device for future calls. Optionally saves as a preference.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `device` | `MediaDeviceInfo` |
| `options` | [`SelectDeviceOptions`](../interfaces/SelectDeviceOptions.md) |

#### Returns

`void`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`selectAudioInputDevice`](../interfaces/CallSelfParticipant.md#selectaudioinputdevice)
