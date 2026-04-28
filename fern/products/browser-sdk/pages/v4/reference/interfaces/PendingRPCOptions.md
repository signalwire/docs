# Interface: PendingRPCOptions

Defined in: [core/utils.ts:53](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/utils.ts#L53)

## Properties

| Property | Type | Description | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="signal"></a> `signal?` | `AbortSignal` | Optional AbortSignal for cancellation support. If the signal is aborted, the promise will reject with an AbortError. | [core/utils.ts:64](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/utils.ts#L64) |
| <a id="timeoutms"></a> `timeoutMs?` | `number` | Timeout in milliseconds. Defaults to 5000ms (5 seconds). If the response is not received within this time, the promise will reject with RPCTimeoutError. | [core/utils.ts:58](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/utils.ts#L58) |
