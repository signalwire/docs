---
title: "ConstraintFallbackEvent"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L153)</sub>

Event emitted when getUserMedia falls back to looser constraints.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| `actualDevice` | `readonly` | `MediaDeviceInfo` \| `null` | The device that the browser actually provided. | [core/types/resilience.types.ts:159](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L159) |
| `fallbackLevel` | `readonly` | `"exact"` \| `"preferred"` \| `"default"` | The constraint level that succeeded. | [core/types/resilience.types.ts:161](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L161) |
| `kind` | `readonly` | `"audioinput"` \| `"videoinput"` | The kind of input device. | [core/types/resilience.types.ts:155](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L155) |
| `requestedDevice` | `readonly` | `MediaDeviceInfo` \| `null` | The device that was originally requested. | [core/types/resilience.types.ts:157](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L157) |
