---
title: "DeviceRecoveryEvent"
---

# Interface: DeviceRecoveryEvent

Defined in: [core/types/resilience.types.ts:106](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L106)

Event emitted when the SDK auto-switches a device.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="kind"></a> `kind` | `readonly` | `"audioinput"` \| `"audiooutput"` \| `"videoinput"` | The kind of device that was switched. | [core/types/resilience.types.ts:108](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L108) |
| <a id="newdevice"></a> `newDevice` | `readonly` | `MediaDeviceInfo` \| `null` | The device that was selected as a replacement (null if none available). | [core/types/resilience.types.ts:112](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L112) |
| <a id="previousdevice"></a> `previousDevice` | `readonly` | `MediaDeviceInfo` \| `null` | The device that was previously selected (null if none). | [core/types/resilience.types.ts:110](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L110) |
| <a id="reason"></a> `reason` | `readonly` | `"device_disconnected"` \| `"device_reconnected"` \| `"session_restored"` \| `"fallback_to_default"` \| `"default_changed"` \| `"ambiguous_match"` | The reason for the device switch. | [core/types/resilience.types.ts:114](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L114) |
