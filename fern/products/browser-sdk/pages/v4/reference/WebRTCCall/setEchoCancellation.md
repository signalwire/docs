---
title: "setEchoCancellation"
---

# setEchoCancellation

> **setEchoCancellation**(`enabled`): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:1440](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L1440)

Toggle echo cancellation on the local mic at runtime. Applied via
`track.applyConstraints`; browsers that don't honour runtime constraints
(notably iOS Safari) fall back to re-acquiring the track with the new
constraint set and plumbing the replacement through the local audio
pipeline if one is active.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `enabled` | `boolean` |

#### Returns

`Promise`\<`void`\>
