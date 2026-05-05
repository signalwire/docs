---
title: "PendingRPCOptions"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/utils.ts#L53)</sub>

## Properties

| Property | Type | Description | Defined in |
| ------ | ------ | ------ | ------ |
| `signal?` | `AbortSignal` | Optional AbortSignal for cancellation support. If the signal is aborted, the promise will reject with an AbortError. | [core/utils.ts:64](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/utils.ts#L64) |
| `timeoutMs?` | `number` | Timeout in milliseconds. Defaults to 5000ms (5 seconds). If the response is not received within this time, the promise will reject with RPCTimeoutError. | [core/utils.ts:58](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/utils.ts#L58) |
