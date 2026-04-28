# Interface: ConstraintFallbackEvent

Defined in: [core/types/resilience.types.ts:153](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L153)

Event emitted when getUserMedia falls back to looser constraints.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="actualdevice"></a> `actualDevice` | `readonly` | `MediaDeviceInfo` \| `null` | The device that the browser actually provided. | [core/types/resilience.types.ts:159](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L159) |
| <a id="fallbacklevel"></a> `fallbackLevel` | `readonly` | `"exact"` \| `"preferred"` \| `"default"` | The constraint level that succeeded. | [core/types/resilience.types.ts:161](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L161) |
| <a id="kind"></a> `kind` | `readonly` | `"audioinput"` \| `"videoinput"` | The kind of input device. | [core/types/resilience.types.ts:155](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L155) |
| <a id="requesteddevice"></a> `requestedDevice` | `readonly` | `MediaDeviceInfo` \| `null` | The device that was originally requested. | [core/types/resilience.types.ts:157](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L157) |
