---
title: "AudioConstraintsEvent"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L248)</sub>

Event emitted when audio constraints change on a call.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| `constraints` | `readonly` | `MediaTrackConstraints` | The new constraints applied. | [core/types/resilience.types.ts:250](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L250) |
| `method` | `readonly` | `"applyConstraints"` \| `"trackReplacement"` | How the constraints were applied. | [core/types/resilience.types.ts:252](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L252) |
| `timestamp` | `readonly` | `number` | Timestamp when the event occurred (epoch ms). | [core/types/resilience.types.ts:254](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L254) |
