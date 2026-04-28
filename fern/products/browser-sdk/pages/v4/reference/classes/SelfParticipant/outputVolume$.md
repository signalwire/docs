# outputVolume$

#### Get Signature

> **get** **outputVolume$**(): `Observable`\<`number` \| `undefined`\>

Defined in: [core/entities/Participant.ts:155](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L155)

Observable of the participant's **server-side** speaker output volume as
reported by the mix engine (FreeSWITCH channel write volume). NOT the
local HTML `<audio>` element volume — set that on your own element.

##### See

[setAudioOutputVolume](Participant.md#setaudiooutputvolume)

##### Returns

`Observable`\<`number` \| `undefined`\>

#### Implementation of

[`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md).[`outputVolume$`](../../interfaces/CallSelfParticipant.md#outputvolume-1)

#### Inherited from

[`Participant`](Participant.md).[`outputVolume$`](Participant.md#outputvolume-1)
