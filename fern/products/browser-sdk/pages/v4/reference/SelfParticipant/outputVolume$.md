---
title: "outputVolume$"
---

#### Get Signature

> **get** **outputVolume$**(): `Observable`\<`number` \| `undefined`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L155)</sub>

Observable of the participant's **server-side** speaker output volume as
reported by the mix engine (FreeSWITCH channel write volume). NOT the
local HTML `<audio>` element volume — set that on your own element.

##### See

[setAudioOutputVolume](../Participant/index.md#setaudiooutputvolume)

##### Returns

`Observable`\<`number` \| `undefined`\>

#### Inherited from

[`Participant`](../Participant/index.md).[`outputVolume$`](../Participant/index.md#outputvolume-1)

## outputVolume

#### Get Signature

> **get** **outputVolume**(): `number` \| `undefined`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L354)</sub>

Current **server-side** speaker output volume from the mix engine, or
`undefined` if not set. Not the local `<audio>` element volume.

##### Returns

`number` \| `undefined`

#### Inherited from

[`Participant`](../Participant/index.md).[`outputVolume`](../Participant/index.md#outputvolume)
