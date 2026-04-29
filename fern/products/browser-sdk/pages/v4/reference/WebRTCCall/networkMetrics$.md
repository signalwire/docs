---
title: "networkMetrics$"
---

# networkMetrics$

#### Get Signature

> **get** **networkMetrics$**(): `Observable`\<[`CallNetworkMetrics`](../interfaces/CallNetworkMetrics.md)[]\>

Defined in: [core/entities/Call.ts:643](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L643)

Rolling history of raw network metrics (RTT, jitter, packet loss, bitrate).

##### Returns

`Observable`\<[`CallNetworkMetrics`](../interfaces/CallNetworkMetrics.md)[]\>

#### Implementation of

`CallManager.networkMetrics$`

## networkMetrics

#### Get Signature

> **get** **networkMetrics**(): [`CallNetworkMetrics`](../interfaces/CallNetworkMetrics.md)[]

Defined in: [core/entities/Call.ts:648](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L648)

Current snapshot of the metrics rolling window.

##### Returns

[`CallNetworkMetrics`](../interfaces/CallNetworkMetrics.md)[]

#### Implementation of

`CallManager.networkMetrics`
