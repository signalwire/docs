---
title: "setInputDevicesConstraints"
---

> **setInputDevicesConstraints**(`constraints`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L766)</sub>

Updates both audio and video input track constraints for the active call.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `constraints` | \{ `audio`: `MediaTrackConstraints`; `video`: `MediaTrackConstraints`; \} |
| `constraints.audio` | `MediaTrackConstraints` |
| `constraints.video` | `MediaTrackConstraints` |

#### Returns

`Promise`\<`void`\>

