---
title: "isValidDevice"
---

# isValidDevice

> **isValidDevice**(`deviceInfo`): `Promise`\<`boolean`\>

Defined in: [clients/SignalWire.ts:1259](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L1259)

Checks whether a device is still available and usable.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `deviceInfo` | `MediaDeviceInfo` \| `null` | The device to validate, or `null`. |

#### Returns

`Promise`\<`boolean`\>

`true` if the device is valid and available. Returns `false` for `null`, audio output devices, or unavailable devices.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`isValidDevice`](../interfaces/DeviceController.md#isvaliddevice)
