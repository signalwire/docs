---
title: "RecoveryEvent"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L72)</sub>

Event emitted when a recovery action is taken on a call.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| `action` | `readonly` | `"keyframe_requested"` \| `"reinvite_started"` \| `"reinvite_succeeded"` \| `"reinvite_failed"` \| `"reinvite_timeout"` \| `"max_attempts_reached"` \| `"call_recovering"` \| `"call_recovered"` \| `"call_recovery_failed"` \| `"signal_reconnect"` \| `"full_reconnect"` \| `"video_disabled"` \| `"video_restored"` | The recovery action that was taken. | [core/types/resilience.types.ts:74](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L74) |
| `attempt?` | `readonly` | `number` | Current attempt number (for multi-attempt recoveries). | [core/types/resilience.types.ts:91](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L91) |
| `maxAttempts?` | `readonly` | `number` | Maximum number of attempts allowed. | [core/types/resilience.types.ts:93](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L93) |
| `reason` | `readonly` | `string` | Human-readable description of why recovery was triggered. | [core/types/resilience.types.ts:89](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L89) |
| `timestamp` | `readonly` | `number` | Timestamp when the event occurred (epoch ms). | [core/types/resilience.types.ts:95](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L95) |
