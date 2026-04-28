# remoteAudioLevel$

#### Get Signature

> **get** **remoteAudioLevel$**(): `Observable`\<`number`\>

Defined in: [core/entities/Call.ts:1463](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L1463)

Observable of the aggregate remote audio level, 0..1 RMS. The server
delivers a single mixed audio stream for all remote participants — this
meter reports that mix. Per-participant audio is not available client-side.

Engages a shared AudioContext on first subscription (cheap — one
AnalyserNode, no GainNode, no destination) so it does not affect the
caller's audio element playback.

##### Returns

`Observable`\<`number`\>
