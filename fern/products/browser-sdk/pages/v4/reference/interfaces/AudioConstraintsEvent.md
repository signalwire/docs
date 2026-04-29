---
title: "AudioConstraintsEvent"
---

# Interface: AudioConstraintsEvent

Defined in: [core/types/resilience.types.ts:248](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L248)

Event emitted when audio constraints change on a call.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="constraints"></a> `constraints` | `readonly` | `MediaTrackConstraints` | The new constraints applied. | [core/types/resilience.types.ts:250](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L250) |
| <a id="method"></a> `method` | `readonly` | `"applyConstraints"` \| `"trackReplacement"` | How the constraints were applied. | [core/types/resilience.types.ts:252](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L252) |
| <a id="timestamp"></a> `timestamp` | `readonly` | `number` | Timestamp when the event occurred (epoch ms). | [core/types/resilience.types.ts:254](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L254) |
