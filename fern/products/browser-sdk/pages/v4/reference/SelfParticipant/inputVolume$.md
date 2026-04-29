---
title: "inputVolume$"
---

# inputVolume$

#### Get Signature

> **get** **inputVolume$**(): `Observable`\<`number` \| `undefined`\>

Defined in: [core/entities/Participant.ts:139](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L139)

Observable of the participant's **server-side** microphone input volume
as reported by the mix engine. This is gain applied on the bridged audio
leg (FreeSWITCH channel read volume), NOT the local browser mic. For a
local PC mic control, see Call.setLocalMicrophoneGain.

##### See

[setAudioInputVolume](../Participant/index.md#setaudioinputvolume)

##### Returns

`Observable`\<`number` \| `undefined`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`inputVolume$`](../interfaces/CallSelfParticipant.md#inputvolume-1)

#### Inherited from

[`Participant`](../Participant/index.md).[`inputVolume$`](../Participant/index.md#inputvolume-1)

## inputVolume

#### Get Signature

> **get** **inputVolume**(): `number` \| `undefined`

Defined in: [core/entities/Participant.ts:346](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L346)

Current **server-side** microphone input volume as reported by the mix
engine, or `undefined` if not set. Not the local PC mic — see
Call.setLocalMicrophoneGain for browser-side control.

##### Returns

`number` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`inputVolume`](../interfaces/CallSelfParticipant.md#inputvolume)

#### Inherited from

[`Participant`](../Participant/index.md).[`inputVolume`](../Participant/index.md#inputvolume)
