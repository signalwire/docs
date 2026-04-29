---
title: "status$"
---

# status$

#### Get Signature

> **get** **status$**(): `Observable`\<[`CallStatus`](../type-aliases/CallStatus.md)\>

Defined in: [core/entities/Call.ts:478](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L478)

Observable of the current call status (e.g. `'ringing'`, `'connected'`).

##### Returns

`Observable`\<[`CallStatus`](../type-aliases/CallStatus.md)\>

#### Implementation of

`CallManager.status$`

## status

#### Get Signature

> **get** **status**(): [`CallStatus`](../type-aliases/CallStatus.md)

Defined in: [core/entities/Call.ts:538](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L538)

Current call status.

##### Returns

[`CallStatus`](../type-aliases/CallStatus.md)

#### Implementation of

`CallManager.status`
