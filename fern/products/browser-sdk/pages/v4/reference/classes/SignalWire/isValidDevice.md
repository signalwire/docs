# isValidDevice

> **isValidDevice**(`deviceInfo`): `Promise`\<`boolean`\>

Defined in: [clients/SignalWire.ts:1259](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L1259)

Checks whether a device is still available and usable.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `deviceInfo` | `MediaDeviceInfo` \| `null` | The device to validate, or `null`. |

#### Returns

`Promise`\<`boolean`\>

`true` if the device is valid and available. Returns `false` for `null`, audio output devices, or unavailable devices.

#### Implementation of

[`DeviceController`](../../interfaces/DeviceController.md).[`isValidDevice`](../../interfaces/DeviceController.md#isvaliddevice)
