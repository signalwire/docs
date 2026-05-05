---
title: "inputVolume$"
---

#### Get Signature

> **get** **inputVolume$**(): `Observable`\<`number` \| `undefined`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L139)</sub>

Observable of the participant's **server-side** microphone input volume
as reported by the mix engine. This is gain applied on the bridged audio
leg (FreeSWITCH channel read volume), NOT the local browser mic. For a
local PC mic control, see Call.setLocalMicrophoneGain.

##### See

[setAudioInputVolume](../Participant/index.md#setaudioinputvolume)

##### Returns

`Observable`\<`number` \| `undefined`\>

#### Inherited from

[`Participant`](../Participant/index.md).[`inputVolume$`](../Participant/index.md#inputvolume-1)

## inputVolume

#### Get Signature

> **get** **inputVolume**(): `number` \| `undefined`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L346)</sub>

Current **server-side** microphone input volume as reported by the mix
engine, or `undefined` if not set. Not the local PC mic — see
Call.setLocalMicrophoneGain for browser-side control.

##### Returns

`number` \| `undefined`

#### Inherited from

[`Participant`](../Participant/index.md).[`inputVolume`](../Participant/index.md#inputvolume)
