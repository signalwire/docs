---
title: "inputSensitivity$"
---

# inputSensitivity$

#### Get Signature

> **get** **inputSensitivity$**(): `Observable`\<`number` \| `undefined`\>

Defined in: [core/entities/Participant.ts:172](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L172)

Observable of the **conference-only** microphone energy/gate sensitivity
level for this member. Routes through the conferencing mix engine and has
no effect on 1:1 WebRTC calls. Populated from `member.updated` events for
conference members.

##### See

[setAudioInputSensitivity](../Participant/index.md#setaudioinputsensitivity)

##### Returns

`Observable`\<`number` \| `undefined`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`inputSensitivity$`](../interfaces/CallSelfParticipant.md#inputsensitivity-1)

#### Inherited from

[`Participant`](../Participant/index.md).[`inputSensitivity$`](../Participant/index.md#inputsensitivity-1)

## inputSensitivity

#### Get Signature

> **get** **inputSensitivity**(): `number` \| `undefined`

Defined in: [core/entities/Participant.ts:362](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L362)

Current **conference-only** microphone sensitivity/gate level, or
`undefined` if not set. Applies only to conference members.

##### Returns

`number` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`inputSensitivity`](../interfaces/CallSelfParticipant.md#inputsensitivity)

#### Inherited from

[`Participant`](../Participant/index.md).[`inputSensitivity`](../Participant/index.md#inputsensitivity)
