---
title: "SessionDiagnostics"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L272)</sub>

Structured diagnostic bundle for a session.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| `calls` | `readonly` | readonly [`CallDiagnosticSummary`](CallDiagnosticSummary.md)[] | Quality summary per call. | [core/types/resilience.types.ts:282](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L282) |
| `capabilities` | `readonly` | [`PlatformCapabilities`](PlatformCapabilities.md) | Platform capabilities detected at construction time. | [core/types/resilience.types.ts:278](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L278) |
| `deviceChanges` | `readonly` | readonly [`DeviceRecoveryEvent`](DeviceRecoveryEvent.md)[] | Device changes that occurred during the session. | [core/types/resilience.types.ts:284](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L284) |
| `devices` | `readonly` | `object` | Current device list snapshot. | [core/types/resilience.types.ts:286](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L286) |
| `devices.audioInput` | `readonly` | readonly `MediaDeviceInfo`[] | - | [core/types/resilience.types.ts:287](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L287) |
| `devices.audioOutput` | `readonly` | readonly `MediaDeviceInfo`[] | - | [core/types/resilience.types.ts:288](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L288) |
| `devices.videoInput` | `readonly` | readonly `MediaDeviceInfo`[] | - | [core/types/resilience.types.ts:289](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L289) |
| `events` | `readonly` | readonly [`DiagnosticEvent`](DiagnosticEvent.md)[] | Timeline of significant events during the session. | [core/types/resilience.types.ts:280](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L280) |
| `sdkVersion` | `readonly` | `string` | SDK version. | [core/types/resilience.types.ts:274](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L274) |
| `userAgent` | `readonly` | `string` | Browser/platform user agent string. | [core/types/resilience.types.ts:276](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L276) |
