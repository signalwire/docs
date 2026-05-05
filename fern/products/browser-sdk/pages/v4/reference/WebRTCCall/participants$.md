---
title: "participants$"
---

#### Get Signature

> **get** **participants$**(): `Observable`\<[`CallParticipant`](../interfaces/CallParticipant.md)[]\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L489)</sub>

Observable of the participants list, emits on join/leave/update.

##### Returns

`Observable`\<[`CallParticipant`](../interfaces/CallParticipant.md)[]\>

## participants

#### Get Signature

> **get** **participants**(): [`CallParticipant`](../interfaces/CallParticipant.md)[]

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L336)</sub>

Current snapshot of all participants in the call.

##### Returns

[`CallParticipant`](../interfaces/CallParticipant.md)[]

