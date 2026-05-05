---
title: "StoredDevicePreference"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L129)</sub>

Serializable subset of MediaDeviceInfo for persistence.

The browser's MediaDeviceInfo interface is not serializable.
This stores the fields needed for device recovery across sessions.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| `deviceId` | `readonly` | `string` | The device ID. | [core/types/resilience.types.ts:131](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L131) |
| `groupId` | `readonly` | `string` | The group ID (identifies the physical device). | [core/types/resilience.types.ts:137](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L137) |
| `kind` | `readonly` | `MediaDeviceKind` | The device kind. | [core/types/resilience.types.ts:135](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L135) |
| `label` | `readonly` | `string` | The human-readable label. | [core/types/resilience.types.ts:133](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L133) |
