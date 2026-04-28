# inputSensitivity$

#### Get Signature

> **get** **inputSensitivity$**(): `Observable`\<`number` \| `undefined`\>

Defined in: [core/entities/Participant.ts:172](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L172)

Observable of the **conference-only** microphone energy/gate sensitivity
level for this member. Routes through the conferencing mix engine and has
no effect on 1:1 WebRTC calls. Populated from `member.updated` events for
conference members.

##### See

[setAudioInputSensitivity](Participant.md#setaudioinputsensitivity)

##### Returns

`Observable`\<`number` \| `undefined`\>

#### Implementation of

[`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md).[`inputSensitivity$`](../../interfaces/CallSelfParticipant.md#inputsensitivity-1)

#### Inherited from

[`Participant`](Participant.md).[`inputSensitivity$`](Participant.md#inputsensitivity-1)
