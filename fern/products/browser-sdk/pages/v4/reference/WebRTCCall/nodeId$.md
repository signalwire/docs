---
title: "nodeId$"
---

# nodeId$

#### Get Signature

> **get** **nodeId$**(): `Observable`\<`string` \| `null`\>

Defined in: [core/entities/Call.ts:982](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L982)

Observable of the server node ID handling this call.

##### Returns

`Observable`\<`string` \| `null`\>

#### Implementation of

`CallManager.nodeId$`

## nodeId

#### Get Signature

> **get** **nodeId**(): `string` \| `null`

Defined in: [core/entities/Call.ts:987](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L987)

Server node ID handling this call, or `null`.

##### Returns

`string` \| `null`

#### Implementation of

`CallManager.nodeId`
