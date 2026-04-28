# inputVolume

#### Get Signature

> **get** **inputVolume**(): `number` \| `undefined`

Defined in: [core/entities/Participant.ts:346](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L346)

Current **server-side** microphone input volume as reported by the mix
engine, or `undefined` if not set. Not the local PC mic — see
Call.setLocalMicrophoneGain for browser-side control.

##### Returns

`number` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md).[`inputVolume`](../../interfaces/CallSelfParticipant.md#inputvolume)

#### Inherited from

[`Participant`](Participant.md).[`inputVolume`](Participant.md#inputvolume)
