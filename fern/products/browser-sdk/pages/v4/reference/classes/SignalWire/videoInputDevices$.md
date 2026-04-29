# videoInputDevices$

#### Get Signature

> **get** **videoInputDevices$**(): `Observable`\<`MediaDeviceInfo`[]\>

Defined in: [clients/SignalWire.ts:1136](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L1136)

Observable list of available video input (camera) devices.

##### Returns

`Observable`\<`MediaDeviceInfo`[]\>

Observable list of available video input (camera) devices.

#### Implementation of

[`DeviceController`](../../interfaces/DeviceController.md).[`videoInputDevices$`](../../interfaces/DeviceController.md#videoinputdevices-1)

## videoInputDevices

#### Get Signature

> **get** **videoInputDevices**(): `MediaDeviceInfo`[]

Defined in: [clients/SignalWire.ts:1141](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L1141)

Current snapshot of available video input devices.

##### Returns

`MediaDeviceInfo`[]

Current snapshot of available video input devices.

#### Implementation of

[`DeviceController`](../../interfaces/DeviceController.md).[`videoInputDevices`](../../interfaces/DeviceController.md#videoinputdevices)
