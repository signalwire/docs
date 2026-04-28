# setAudioOutputVolume

> **setAudioOutputVolume**(`value`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:537](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L537)

Sets the **server-side** speaker volume on this participant's bridged call
leg (FreeSWITCH channel write volume) — what this participant hears from
the mix before it reaches their client.

For local playback volume (the `<audio>` element the consumer attaches
`remoteStream` to), set `audioElement.volume` directly in the consumer's
code.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `value` | `number` | Volume level (0-100). |

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../../interfaces/CallParticipant.md).[`setAudioOutputVolume`](../../interfaces/CallParticipant.md#setaudiooutputvolume)
