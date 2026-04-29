---
title: "PreflightResult"
---

# Interface: PreflightResult

Defined in: [core/types/resilience.types.ts:209](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L209)

Results of a preflight connectivity test.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="bandwidth"></a> `bandwidth` | `readonly` | \{ `downloadKbps`: `number`; `uploadKbps`: `number`; \} \| `null` | Bandwidth estimation (null if skipMediaTest). | [core/types/resilience.types.ts:229](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L229) |
| <a id="connectivity"></a> `connectivity` | `readonly` | `object` | ICE/TURN connectivity. | [core/types/resilience.types.ts:218](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L218) |
| `connectivity.rttMs` | `readonly` | `number` | RTT to media server in ms. | [core/types/resilience.types.ts:226](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L226) |
| `connectivity.stunReachable` | `readonly` | `boolean` | Whether STUN servers are reachable. | [core/types/resilience.types.ts:224](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L224) |
| `connectivity.turnReachable` | `readonly` | `boolean` | Whether TURN servers are reachable. | [core/types/resilience.types.ts:222](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L222) |
| `connectivity.type` | `readonly` | `"failed"` \| `"direct"` \| `"relay"` | 'direct' = host/srflx worked, 'relay' = only TURN relay, 'failed' = nothing. | [core/types/resilience.types.ts:220](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L220) |
| <a id="devices"></a> `devices` | `readonly` | `object` | Device test results. | [core/types/resilience.types.ts:234](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L234) |
| `devices.audioInput` | `readonly` | `object` | - | [core/types/resilience.types.ts:235](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L235) |
| `devices.audioInput.device` | `readonly` | `MediaDeviceInfo` \| `null` | - | [core/types/resilience.types.ts:235](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L235) |
| `devices.audioInput.working` | `readonly` | `boolean` | - | [core/types/resilience.types.ts:235](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L235) |
| `devices.audioOutput` | `readonly` | `object` | - | [core/types/resilience.types.ts:237](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L237) |
| `devices.audioOutput.available` | `readonly` | `boolean` | - | [core/types/resilience.types.ts:237](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L237) |
| `devices.audioOutput.device` | `readonly` | `MediaDeviceInfo` \| `null` | - | [core/types/resilience.types.ts:237](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L237) |
| `devices.videoInput` | `readonly` | `object` | - | [core/types/resilience.types.ts:236](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L236) |
| `devices.videoInput.device` | `readonly` | `MediaDeviceInfo` \| `null` | - | [core/types/resilience.types.ts:236](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L236) |
| `devices.videoInput.working` | `readonly` | `boolean` | - | [core/types/resilience.types.ts:236](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L236) |
| <a id="ok"></a> `ok` | `readonly` | `boolean` | Overall pass/fail. | [core/types/resilience.types.ts:211](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L211) |
| <a id="signaling"></a> `signaling` | `readonly` | `object` | Signaling server reachability. | [core/types/resilience.types.ts:213](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L213) |
| `signaling.reachable` | `readonly` | `boolean` | - | [core/types/resilience.types.ts:214](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L214) |
| `signaling.rttMs` | `readonly` | `number` | - | [core/types/resilience.types.ts:215](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L215) |
| <a id="warnings"></a> `warnings` | `readonly` | readonly `string`[] | Human-readable warnings. | [core/types/resilience.types.ts:240](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L240) |
