# selectedVideoInputDevice$

#### Get Signature

> **get** **selectedVideoInputDevice$**(): `Observable`\<`MediaDeviceInfo` \| `null`\>

Defined in: [clients/SignalWire.ts:1154](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L1154)

Observable of the currently selected video input device.

##### Returns

`Observable`\<`MediaDeviceInfo` \| `null`\>

Observable of the currently selected video input device, or `null` if none.

#### Implementation of

[`DeviceController`](../../interfaces/DeviceController.md).[`selectedVideoInputDevice$`](../../interfaces/DeviceController.md#selectedvideoinputdevice-1)
