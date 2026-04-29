---
title: "self$"
---

# self$

#### Get Signature

> **get** **self$**(): `Observable`\<[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md)\>

Defined in: [core/entities/Call.ts:495](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L495)

Observable of the local (self) participant.

##### Returns

`Observable`\<[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md)\>

#### Implementation of

`CallManager.self$`

## self

#### Get Signature

> **get** **self**(): [`CallSelfParticipant`](../interfaces/CallSelfParticipant.md) \| `null`

Defined in: [core/entities/Call.ts:341](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L341)

The local participant, or `null` if not yet joined.

##### Returns

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md) \| `null`

#### Implementation of

`CallManager.self`
