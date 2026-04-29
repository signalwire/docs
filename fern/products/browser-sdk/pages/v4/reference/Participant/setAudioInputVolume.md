---
title: "setAudioInputVolume"
---

# setAudioInputVolume

> **setAudioInputVolume**(`value`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:520](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L520)

Sets the **server-side** microphone volume on this participant's bridged
call leg. Applies a multiplier to the audio flowing through the mix
engine (FreeSWITCH channel read volume) — changes what other participants
hear, not what the local browser captures.

For local PC mic gain, use Call.setLocalMicrophoneGain instead.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `value` | `number` | Volume level (0-100). |

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`setAudioInputVolume`](../interfaces/CallParticipant.md#setaudioinputvolume)
