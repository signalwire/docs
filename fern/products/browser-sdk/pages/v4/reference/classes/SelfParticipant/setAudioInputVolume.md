# setAudioInputVolume

> **setAudioInputVolume**(`value`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:520](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L520)

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

[`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md).[`setAudioInputVolume`](../../interfaces/CallSelfParticipant.md#setaudioinputvolume)

#### Inherited from

[`Participant`](Participant.md).[`setAudioInputVolume`](Participant.md#setaudioinputvolume)
