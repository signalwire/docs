---
title: "PlatformCapabilities"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L169)</sub>

Browser/platform WebRTC capability flags.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| `audioCodecs` | `readonly` | readonly `string`[] | List of supported audio codecs. | [core/types/resilience.types.ts:183](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L183) |
| `audioOutputSelection` | `readonly` | `boolean` | Whether setSinkId (audio output selection) is supported. | [core/types/resilience.types.ts:179](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L179) |
| `getDisplayMedia` | `readonly` | `boolean` | Whether getDisplayMedia is available. | [core/types/resilience.types.ts:189](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L189) |
| `getUserMedia` | `readonly` | `boolean` | Whether getUserMedia is available. | [core/types/resilience.types.ts:187](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L187) |
| `insertableStreams` | `readonly` | `boolean` | Whether insertable streams / encoded transforms are available. | [core/types/resilience.types.ts:177](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L177) |
| `screenShare` | `readonly` | `boolean` | Whether screen sharing is supported. | [core/types/resilience.types.ts:171](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L171) |
| `screenShareAudio` | `readonly` | `boolean` | Whether screen share can include system audio (Chrome-only). | [core/types/resilience.types.ts:173](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L173) |
| `simulcast` | `readonly` | `boolean` | Whether simulcast is supported. | [core/types/resilience.types.ts:175](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L175) |
| `videoCodecs` | `readonly` | readonly `string`[] | List of supported video codecs. | [core/types/resilience.types.ts:181](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L181) |
| `webrtc` | `readonly` | `boolean` | Whether the browser supports WebRTC at all. | [core/types/resilience.types.ts:185](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L185) |
