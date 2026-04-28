# selectedAudioInputDevice$

#### Get Signature

> **get** **selectedAudioInputDevice$**(): `Observable`\<`MediaDeviceInfo` \| `null`\>

Defined in: [clients/SignalWire.ts:1146](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L1146)

Observable of the currently selected audio input device.

##### Returns

`Observable`\<`MediaDeviceInfo` \| `null`\>

Observable of the currently selected audio input device, or `null` if none.

#### Implementation of

[`DeviceController`](../../interfaces/DeviceController.md).[`selectedAudioInputDevice$`](../../interfaces/DeviceController.md#selectedaudioinputdevice-1)
