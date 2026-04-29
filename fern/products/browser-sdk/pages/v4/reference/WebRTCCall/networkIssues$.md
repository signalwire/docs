---
title: "networkIssues$"
---

# networkIssues$

#### Get Signature

> **get** **networkIssues$**(): `Observable`\<[`CallNetworkIssue`](../interfaces/CallNetworkIssue.md)[]\>

Defined in: [core/entities/Call.ts:623](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L623)

Observable of current network health issues (empty array = healthy).

##### Returns

`Observable`\<[`CallNetworkIssue`](../interfaces/CallNetworkIssue.md)[]\>

#### Implementation of

`CallManager.networkIssues$`

## networkIssues

#### Get Signature

> **get** **networkIssues**(): [`CallNetworkIssue`](../interfaces/CallNetworkIssue.md)[]

Defined in: [core/entities/Call.ts:628](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L628)

Current snapshot of network issues.

##### Returns

[`CallNetworkIssue`](../interfaces/CallNetworkIssue.md)[]

#### Implementation of

`CallManager.networkIssues`
