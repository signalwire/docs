# deviceRecovered$

#### Get Signature

> **get** **deviceRecovered$**(): `Observable`\<[`DeviceRecoveryEvent`](../../interfaces/DeviceRecoveryEvent.md)\>

Defined in: [clients/SignalWire.ts:820](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L820)

Observable that emits when the SDK auto-switches a device.

##### Returns

`Observable`\<[`DeviceRecoveryEvent`](../../interfaces/DeviceRecoveryEvent.md)\>

Observable that emits when the SDK auto-switches a device due to
disconnect, reconnect, or recovery.

#### Implementation of

[`DeviceController`](../../interfaces/DeviceController.md).[`deviceRecovered$`](../../interfaces/DeviceController.md#devicerecovered)
