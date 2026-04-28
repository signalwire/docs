# localAudioLevel$

#### Get Signature

> **get** **localAudioLevel$**(): `Observable`\<`number`\>

Defined in: [core/entities/Call.ts:1370](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L1370)

Observable of the RMS audio level of the local microphone, 0..1.
Emits at ~30fps while a mic track is active. Engages the local audio
pipeline on first subscription.

##### Returns

`Observable`\<`number`\>
