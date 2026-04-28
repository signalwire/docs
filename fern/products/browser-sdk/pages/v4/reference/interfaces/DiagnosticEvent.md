# Interface: DiagnosticEvent

Defined in: [core/types/resilience.types.ts:294](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L294)

A single diagnostic event in the session timeline.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="category"></a> `category` | `readonly` | `"error"` \| `"call"` \| `"connection"` \| `"device"` \| `"recovery"` | Category of the event. | [core/types/resilience.types.ts:298](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L298) |
| <a id="details"></a> `details?` | `readonly` | `Readonly`\<`Record`\<`string`, `unknown`\>\> | Additional details about the event. | [core/types/resilience.types.ts:302](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L302) |
| <a id="event"></a> `event` | `readonly` | `string` | Event description string. | [core/types/resilience.types.ts:300](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L300) |
| <a id="timestamp"></a> `timestamp` | `readonly` | `number` | Timestamp when the event occurred (epoch ms). | [core/types/resilience.types.ts:296](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L296) |
