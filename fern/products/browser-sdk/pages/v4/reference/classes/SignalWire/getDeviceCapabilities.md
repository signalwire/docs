# getDeviceCapabilities

> **getDeviceCapabilities**(`deviceInfo`): `Promise`\<`MediaTrackCapabilities` \| `null`\>

Defined in: [clients/SignalWire.ts:1248](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L1248)

Returns the capabilities of a media device.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `deviceInfo` | `MediaDeviceInfo` | The device to query. |

#### Returns

`Promise`\<`MediaTrackCapabilities` \| `null`\>

The device capabilities, or `null` if unavailable.

#### Implementation of

[`DeviceController`](../../interfaces/DeviceController.md).[`getDeviceCapabilities`](../../interfaces/DeviceController.md#getdevicecapabilities)
