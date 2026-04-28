# Interface: MediaParamsEvent

Defined in: [core/types/resilience.types.ts:258](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L258)

Event emitted when server-pushed media params are applied.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="audio"></a> `audio?` | `readonly` | `MediaTrackConstraints` | Audio constraints pushed by the server, if any. | [core/types/resilience.types.ts:260](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L260) |
| <a id="timestamp"></a> `timestamp` | `readonly` | `number` | Timestamp when the event occurred (epoch ms). | [core/types/resilience.types.ts:264](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L264) |
| <a id="video"></a> `video?` | `readonly` | `MediaTrackConstraints` | Video constraints pushed by the server, if any. | [core/types/resilience.types.ts:262](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L262) |
