# selectedAudioOutputDevice$

#### Get Signature

> **get** **selectedAudioOutputDevice$**(): `Observable`\<`MediaDeviceInfo` \| `null`\>

Defined in: [clients/SignalWire.ts:1150](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L1150)

Observable of the currently selected audio output device.

##### Returns

`Observable`\<`MediaDeviceInfo` \| `null`\>

Observable of the currently selected audio output device, or `null` if none.

#### Implementation of

[`DeviceController`](../../interfaces/DeviceController.md).[`selectedAudioOutputDevice$`](../../interfaces/DeviceController.md#selectedaudiooutputdevice-1)
