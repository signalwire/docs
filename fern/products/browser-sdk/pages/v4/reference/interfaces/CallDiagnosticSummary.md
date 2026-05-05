---
title: "CallDiagnosticSummary"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L306)</sub>

Quality summary for a single call in the diagnostic bundle.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| `avgQualityScore` | `readonly` | `number` | Average MOS quality score over the call. | [core/types/resilience.types.ts:318](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L318) |
| `callId` | `readonly` | `string` | Unique call ID. | [core/types/resilience.types.ts:308](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L308) |
| `destination?` | `readonly` | `string` | The destination dialed, if outbound. | [core/types/resilience.types.ts:312](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L312) |
| `direction` | `readonly` | `"inbound"` \| `"outbound"` | Whether the call was inbound or outbound. | [core/types/resilience.types.ts:310](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L310) |
| `duration` | `readonly` | `number` | Total call duration in seconds. | [core/types/resilience.types.ts:314](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L314) |
| `finalMetrics` | `readonly` | [`CallNetworkMetrics`](CallNetworkMetrics.md) | Final network metrics snapshot at call end. | [core/types/resilience.types.ts:326](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L326) |
| `iceCandidateTypes` | `readonly` | readonly `string`[] | ICE candidate types that were used. | [core/types/resilience.types.ts:324](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L324) |
| `minQualityScore` | `readonly` | `number` | Worst (minimum) MOS quality score during the call. | [core/types/resilience.types.ts:320](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L320) |
| `recoveryAttempts` | `readonly` | `number` | Number of recovery attempts made during the call. | [core/types/resilience.types.ts:322](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L322) |
| `status` | `readonly` | `string` | Final call status. | [core/types/resilience.types.ts:316](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L316) |
