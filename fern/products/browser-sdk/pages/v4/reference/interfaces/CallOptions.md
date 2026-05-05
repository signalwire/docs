---
title: "CallOptions"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L207)</sub>

Configuration options for creating a call.

## Extends

- [`MediaOptions`](MediaOptions.md)

## Properties

| Property | Modifier | Type | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ |
| `audio?` | `public` | `boolean` | Enable audio input. Defaults to `true` when not specified. | [`MediaOptions`](MediaOptions.md).[`audio`](MediaOptions.md#audio) | [core/types/media.types.ts:15](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L15) |
| `callId?` | `readonly` | `string` | Pre-assigned call ID (used for reattach). | - | [core/entities/types/call.types.ts:216](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L216) |
| `displayDirection?` | `readonly` | `string` | Direction hint for display purposes. | - | [core/entities/types/call.types.ts:230](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L230) |
| `from?` | `readonly` | `string` | Address URI of the caller. | - | [core/entities/types/call.types.ts:226](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L226) |
| `fromName?` | `readonly` | `string` | Display name of the caller. | - | [core/entities/types/call.types.ts:224](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L224) |
| `initOffer?` | `readonly` | `string` | SDP offer for inbound calls. | - | [core/entities/types/call.types.ts:220](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L220) |
| `inputAudioDeviceConstraints?` | `public` | `MediaTrackConstraints` | Custom constraints for the audio input track. | [`MediaOptions`](MediaOptions.md).[`inputAudioDeviceConstraints`](MediaOptions.md#inputaudiodeviceconstraints) | [core/types/media.types.ts:19](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L19) |
| `inputAudioStream?` | `public` | `MediaStream` | Pre-existing audio stream to use instead of `getUserMedia`. | [`MediaOptions`](MediaOptions.md).[`inputAudioStream`](MediaOptions.md#inputaudiostream) | [core/types/media.types.ts:23](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L23) |
| `inputVideoDeviceConstraints?` | `public` | `MediaTrackConstraints` | Custom constraints for the video input track. | [`MediaOptions`](MediaOptions.md).[`inputVideoDeviceConstraints`](MediaOptions.md#inputvideodeviceconstraints) | [core/types/media.types.ts:21](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L21) |
| `inputVideoStream?` | `public` | `MediaStream` | Pre-existing video stream to use instead of `getUserMedia`. | [`MediaOptions`](MediaOptions.md).[`inputVideoStream`](MediaOptions.md#inputvideostream) | [core/types/media.types.ts:25](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L25) |
| `nodeId?` | `readonly` | `string` | Optional. Hint to the cluster about which node should host this call. Used by reattach to pin to the original node; on fresh dials acts as a steering preference (the server may ignore for placement reasons). Leave undefined for normal load-balanced placement. | - | [core/entities/types/call.types.ts:214](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L214) |
| `preferredAudioCodecs?` | `readonly` | `string`[] | Preferred audio codecs for this call (overrides global preferences). | - | [core/entities/types/call.types.ts:236](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L236) |
| `preferredVideoCodecs?` | `readonly` | `string`[] | Preferred video codecs for this call (overrides global preferences). | - | [core/entities/types/call.types.ts:234](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L234) |
| `reattach?` | `readonly` | `boolean` | Whether this call is being reattached after reconnect. | - | [core/entities/types/call.types.ts:222](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L222) |
| `receiveAudio?` | `public` | `boolean` | Whether to receive remote audio. | [`MediaOptions`](MediaOptions.md).[`receiveAudio`](MediaOptions.md#receiveaudio) | [core/types/media.types.ts:27](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L27) |
| `receiveVideo?` | `public` | `boolean` | Whether to receive remote video. | [`MediaOptions`](MediaOptions.md).[`receiveVideo`](MediaOptions.md#receivevideo) | [core/types/media.types.ts:29](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L29) |
| `stereo?` | `readonly` | `boolean` | Enable stereo Opus for this call (overrides global preferences). | - | [core/entities/types/call.types.ts:238](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L238) |
| `to?` | `readonly` | `string` | Destination URI. | - | [core/entities/types/call.types.ts:218](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L218) |
| `toName?` | `readonly` | `string` | Display name of the callee. | - | [core/entities/types/call.types.ts:228](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L228) |
| `userVariables?` | `readonly` | `Record`\<`string`, `unknown`\> | Custom user variables sent with the call invite. | - | [core/entities/types/call.types.ts:232](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/types/call.types.ts#L232) |
| `video?` | `public` | `boolean` | Enable video input. Defaults to `false` when not specified. | [`MediaOptions`](MediaOptions.md).[`video`](MediaOptions.md#video) | [core/types/media.types.ts:17](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L17) |
