---
title: "MediaOptions"
---

# Interface: MediaOptions

Defined in: [core/types/media.types.ts:13](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L13)

Options controlling which media tracks to send and receive.

## Extended by

- [`DialOptions`](DialOptions.md)
- [`CallOptions`](CallOptions.md)

## Properties

| Property | Type | Description | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="audio"></a> `audio?` | `boolean` | Enable audio input. Defaults to `true` when not specified. | [core/types/media.types.ts:15](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L15) |
| <a id="inputaudiodeviceconstraints"></a> `inputAudioDeviceConstraints?` | `MediaTrackConstraints` | Custom constraints for the audio input track. | [core/types/media.types.ts:19](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L19) |
| <a id="inputaudiostream"></a> `inputAudioStream?` | `MediaStream` | Pre-existing audio stream to use instead of `getUserMedia`. | [core/types/media.types.ts:23](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L23) |
| <a id="inputvideodeviceconstraints"></a> `inputVideoDeviceConstraints?` | `MediaTrackConstraints` | Custom constraints for the video input track. | [core/types/media.types.ts:21](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L21) |
| <a id="inputvideostream"></a> `inputVideoStream?` | `MediaStream` | Pre-existing video stream to use instead of `getUserMedia`. | [core/types/media.types.ts:25](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L25) |
| <a id="receiveaudio"></a> `receiveAudio?` | `boolean` | Whether to receive remote audio. | [core/types/media.types.ts:27](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L27) |
| <a id="receivevideo"></a> `receiveVideo?` | `boolean` | Whether to receive remote video. | [core/types/media.types.ts:29](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L29) |
| <a id="video"></a> `video?` | `boolean` | Enable video input. Defaults to `false` when not specified. | [core/types/media.types.ts:17](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L17) |
