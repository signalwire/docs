# networkMetrics$

#### Get Signature

> **get** **networkMetrics$**(): `Observable`\<[`CallNetworkMetrics`](../../interfaces/CallNetworkMetrics.md)[]\>

Defined in: [core/entities/Call.ts:643](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L643)

Rolling history of raw network metrics (RTT, jitter, packet loss, bitrate).

##### Returns

`Observable`\<[`CallNetworkMetrics`](../../interfaces/CallNetworkMetrics.md)[]\>

#### Implementation of

`CallManager.networkMetrics$`
