---
title: "deviceRecovered$"
---

#### Get Signature

> **get** **deviceRecovered$**(): `Observable`\<[`DeviceRecoveryEvent`](../interfaces/DeviceRecoveryEvent.md)\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L820)</sub>

Observable that emits when the SDK auto-switches a device.

##### Returns

`Observable`\<[`DeviceRecoveryEvent`](../interfaces/DeviceRecoveryEvent.md)\>

Observable that emits when the SDK auto-switches a device due to
disconnect, reconnect, or recovery.

