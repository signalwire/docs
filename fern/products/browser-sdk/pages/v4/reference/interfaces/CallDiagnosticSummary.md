# Interface: CallDiagnosticSummary

Defined in: [core/types/resilience.types.ts:306](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L306)

Quality summary for a single call in the diagnostic bundle.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="avgqualityscore"></a> `avgQualityScore` | `readonly` | `number` | Average MOS quality score over the call. | [core/types/resilience.types.ts:318](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L318) |
| <a id="callid"></a> `callId` | `readonly` | `string` | Unique call ID. | [core/types/resilience.types.ts:308](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L308) |
| <a id="destination"></a> `destination?` | `readonly` | `string` | The destination dialed, if outbound. | [core/types/resilience.types.ts:312](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L312) |
| <a id="direction"></a> `direction` | `readonly` | `"inbound"` \| `"outbound"` | Whether the call was inbound or outbound. | [core/types/resilience.types.ts:310](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L310) |
| <a id="duration"></a> `duration` | `readonly` | `number` | Total call duration in seconds. | [core/types/resilience.types.ts:314](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L314) |
| <a id="finalmetrics"></a> `finalMetrics` | `readonly` | [`CallNetworkMetrics`](CallNetworkMetrics.md) | Final network metrics snapshot at call end. | [core/types/resilience.types.ts:326](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L326) |
| <a id="icecandidatetypes"></a> `iceCandidateTypes` | `readonly` | readonly `string`[] | ICE candidate types that were used. | [core/types/resilience.types.ts:324](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L324) |
| <a id="minqualityscore"></a> `minQualityScore` | `readonly` | `number` | Worst (minimum) MOS quality score during the call. | [core/types/resilience.types.ts:320](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L320) |
| <a id="recoveryattempts"></a> `recoveryAttempts` | `readonly` | `number` | Number of recovery attempts made during the call. | [core/types/resilience.types.ts:322](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L322) |
| <a id="status"></a> `status` | `readonly` | `string` | Final call status. | [core/types/resilience.types.ts:316](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L316) |
