---
title: "self$"
---

#### Get Signature

> **get** **self$**(): `Observable`\<[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md)\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L495)</sub>

Observable of the local (self) participant.

##### Returns

`Observable`\<[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md)\>

## self

#### Get Signature

> **get** **self**(): [`CallSelfParticipant`](../interfaces/CallSelfParticipant.md) \| `null`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L341)</sub>

The local participant, or `null` if not yet joined.

##### Returns

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md) \| `null`

