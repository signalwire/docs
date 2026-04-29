---
title: "audioInputDevices$"
---

# audioInputDevices$

#### Get Signature

> **get** **audioInputDevices$**(): `Observable`\<`MediaDeviceInfo`[]\>

Defined in: [clients/SignalWire.ts:1116](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L1116)

Observable list of available audio input (microphone) devices.

##### Returns

`Observable`\<`MediaDeviceInfo`[]\>

Observable list of available audio input (microphone) devices.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`audioInputDevices$`](../interfaces/DeviceController.md#audioinputdevices-1)

## audioInputDevices

#### Get Signature

> **get** **audioInputDevices**(): `MediaDeviceInfo`[]

Defined in: [clients/SignalWire.ts:1121](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L1121)

Current snapshot of available audio input devices.

##### Returns

`MediaDeviceInfo`[]

Current snapshot of available audio input devices.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`audioInputDevices`](../interfaces/DeviceController.md#audioinputdevices)
