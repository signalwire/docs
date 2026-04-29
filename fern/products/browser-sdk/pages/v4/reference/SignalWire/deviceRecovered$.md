---
title: "deviceRecovered$"
---

# deviceRecovered$

#### Get Signature

> **get** **deviceRecovered$**(): `Observable`\<[`DeviceRecoveryEvent`](../interfaces/DeviceRecoveryEvent.md)\>

Defined in: [clients/SignalWire.ts:820](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L820)

Observable that emits when the SDK auto-switches a device.

##### Returns

`Observable`\<[`DeviceRecoveryEvent`](../interfaces/DeviceRecoveryEvent.md)\>

Observable that emits when the SDK auto-switches a device due to
disconnect, reconnect, or recovery.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`deviceRecovered$`](../interfaces/DeviceController.md#devicerecovered)
