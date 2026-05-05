---
title: "PermissionResult"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L141)</sub>

Result of a media permissions request (Section 5.10).

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| `audio` | `readonly` | `boolean` | Whether audio permission was granted. | [core/types/resilience.types.ts:143](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L143) |
| `selectedAudioDevice?` | `readonly` | `MediaDeviceInfo` | The audio device the user selected in the browser picker, if any. | [core/types/resilience.types.ts:147](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L147) |
| `selectedVideoDevice?` | `readonly` | `MediaDeviceInfo` | The video device the user selected in the browser picker, if any. | [core/types/resilience.types.ts:149](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L149) |
| `video` | `readonly` | `boolean` | Whether video permission was granted. | [core/types/resilience.types.ts:145](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L145) |
