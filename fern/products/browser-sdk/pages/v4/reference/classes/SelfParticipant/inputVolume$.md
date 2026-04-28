# inputVolume$

#### Get Signature

> **get** **inputVolume$**(): `Observable`\<`number` \| `undefined`\>

Defined in: [core/entities/Participant.ts:139](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L139)

Observable of the participant's **server-side** microphone input volume
as reported by the mix engine. This is gain applied on the bridged audio
leg (FreeSWITCH channel read volume), NOT the local browser mic. For a
local PC mic control, see Call.setLocalMicrophoneGain.

##### See

[setAudioInputVolume](Participant.md#setaudioinputvolume)

##### Returns

`Observable`\<`number` \| `undefined`\>

#### Implementation of

[`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md).[`inputVolume$`](../../interfaces/CallSelfParticipant.md#inputvolume-1)

#### Inherited from

[`Participant`](Participant.md).[`inputVolume$`](Participant.md#inputvolume-1)
