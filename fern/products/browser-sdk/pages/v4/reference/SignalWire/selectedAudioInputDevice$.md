---
title: "selectedAudioInputDevice$"
---

# selectedAudioInputDevice$

#### Get Signature

> **get** **selectedAudioInputDevice$**(): `Observable`\<`MediaDeviceInfo` \| `null`\>

Defined in: [clients/SignalWire.ts:1146](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L1146)

Observable of the currently selected audio input device.

##### Returns

`Observable`\<`MediaDeviceInfo` \| `null`\>

Observable of the currently selected audio input device, or `null` if none.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`selectedAudioInputDevice$`](../interfaces/DeviceController.md#selectedaudioinputdevice-1)

## selectedAudioInputDevice

#### Get Signature

> **get** **selectedAudioInputDevice**(): `MediaDeviceInfo` \| `null`

Defined in: [clients/SignalWire.ts:1158](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L1158)

Currently selected audio input device, or `null` if none.

##### Returns

`MediaDeviceInfo` \| `null`

Currently selected audio input device, or `null` if none.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`selectedAudioInputDevice`](../interfaces/DeviceController.md#selectedaudioinputdevice)
