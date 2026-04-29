---
title: "outputVolume$"
---

# outputVolume$

#### Get Signature

> **get** **outputVolume$**(): `Observable`\<`number` \| `undefined`\>

Defined in: [core/entities/Participant.ts:155](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L155)

Observable of the participant's **server-side** speaker output volume as
reported by the mix engine (FreeSWITCH channel write volume). NOT the
local HTML `<audio>` element volume — set that on your own element.

##### See

[setAudioOutputVolume](../Participant/index.md#setaudiooutputvolume)

##### Returns

`Observable`\<`number` \| `undefined`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`outputVolume$`](../interfaces/CallSelfParticipant.md#outputvolume-1)

#### Inherited from

[`Participant`](../Participant/index.md).[`outputVolume$`](../Participant/index.md#outputvolume-1)

## outputVolume

#### Get Signature

> **get** **outputVolume**(): `number` \| `undefined`

Defined in: [core/entities/Participant.ts:354](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L354)

Current **server-side** speaker output volume from the mix engine, or
`undefined` if not set. Not the local `<audio>` element volume.

##### Returns

`number` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`outputVolume`](../interfaces/CallSelfParticipant.md#outputvolume)

#### Inherited from

[`Participant`](../Participant/index.md).[`outputVolume`](../Participant/index.md#outputvolume)
