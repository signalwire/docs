# outputVolume

#### Get Signature

> **get** **outputVolume**(): `number` \| `undefined`

Defined in: [core/entities/Participant.ts:354](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L354)

Current **server-side** speaker output volume from the mix engine, or
`undefined` if not set. Not the local `<audio>` element volume.

##### Returns

`number` \| `undefined`

#### Implementation of

[`CallParticipant`](../../interfaces/CallParticipant.md).[`outputVolume`](../../interfaces/CallParticipant.md#outputvolume)
