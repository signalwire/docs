---
title: "networkMetrics$"
---

#### Get Signature

> **get** **networkMetrics$**(): `Observable`\<[`CallNetworkMetrics`](../interfaces/CallNetworkMetrics.md)[]\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L643)</sub>

Rolling history of raw network metrics (RTT, jitter, packet loss, bitrate).

##### Returns

`Observable`\<[`CallNetworkMetrics`](../interfaces/CallNetworkMetrics.md)[]\>

## networkMetrics

#### Get Signature

> **get** **networkMetrics**(): [`CallNetworkMetrics`](../interfaces/CallNetworkMetrics.md)[]

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L648)</sub>

Current snapshot of the metrics rolling window.

##### Returns

[`CallNetworkMetrics`](../interfaces/CallNetworkMetrics.md)[]

