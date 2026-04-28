# Interface: StoredDevicePreference

Defined in: [core/types/resilience.types.ts:129](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L129)

Serializable subset of MediaDeviceInfo for persistence.

The browser's MediaDeviceInfo interface is not serializable.
This stores the fields needed for device recovery across sessions.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="deviceid"></a> `deviceId` | `readonly` | `string` | The device ID. | [core/types/resilience.types.ts:131](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L131) |
| <a id="groupid"></a> `groupId` | `readonly` | `string` | The group ID (identifies the physical device). | [core/types/resilience.types.ts:137](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L137) |
| <a id="kind"></a> `kind` | `readonly` | `MediaDeviceKind` | The device kind. | [core/types/resilience.types.ts:135](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L135) |
| <a id="label"></a> `label` | `readonly` | `string` | The human-readable label. | [core/types/resilience.types.ts:133](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L133) |
