---
title: "selfId$"
---

# selfId$

#### Get Signature

> **get** **selfId$**(): `Observable`\<`string` \| `null`\>

Defined in: [core/entities/Call.ts:972](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L972)

Observable of the local participant's member ID.

##### Returns

`Observable`\<`string` \| `null`\>

#### Implementation of

`CallManager.selfId$`

## selfId

#### Get Signature

> **get** **selfId**(): `string` \| `null`

Defined in: [core/entities/Call.ts:977](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L977)

Local participant's member ID, or `null` if not joined.

##### Returns

`string` \| `null`

#### Implementation of

`CallManager.selfId`
