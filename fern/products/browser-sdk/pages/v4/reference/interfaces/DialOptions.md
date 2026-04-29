---
title: "DialOptions"
---

# Interface: DialOptions

Defined in: [clients/SignalWire.ts:110](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L110)

Options for [SignalWire.dial](../SignalWire/index.md). Extends [MediaOptions](MediaOptions.md) with dial-specific settings.

## Extends

- [`MediaOptions`](MediaOptions.md)

## Properties

| Property | Type | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="audio"></a> `audio?` | `boolean` | Enable audio input. Defaults to `true` when not specified. | [`MediaOptions`](MediaOptions.md).[`audio`](MediaOptions.md#audio) | [core/types/media.types.ts:15](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L15) |
| <a id="inputaudiodeviceconstraints"></a> `inputAudioDeviceConstraints?` | `MediaTrackConstraints` | Custom constraints for the audio input track. | [`MediaOptions`](MediaOptions.md).[`inputAudioDeviceConstraints`](MediaOptions.md#inputaudiodeviceconstraints) | [core/types/media.types.ts:19](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L19) |
| <a id="inputaudiostream"></a> `inputAudioStream?` | `MediaStream` | Pre-existing audio stream to use instead of `getUserMedia`. | [`MediaOptions`](MediaOptions.md).[`inputAudioStream`](MediaOptions.md#inputaudiostream) | [core/types/media.types.ts:23](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L23) |
| <a id="inputvideodeviceconstraints"></a> `inputVideoDeviceConstraints?` | `MediaTrackConstraints` | Custom constraints for the video input track. | [`MediaOptions`](MediaOptions.md).[`inputVideoDeviceConstraints`](MediaOptions.md#inputvideodeviceconstraints) | [core/types/media.types.ts:21](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L21) |
| <a id="inputvideostream"></a> `inputVideoStream?` | `MediaStream` | Pre-existing video stream to use instead of `getUserMedia`. | [`MediaOptions`](MediaOptions.md).[`inputVideoStream`](MediaOptions.md#inputvideostream) | [core/types/media.types.ts:25](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L25) |
| <a id="nodeid"></a> `nodeId?` | `string` | Optional node ID for routing the call | - | [clients/SignalWire.ts:118](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L118) |
| <a id="preferredaudiocodecs"></a> `preferredAudioCodecs?` | `string`[] | Preferred audio codecs for this call (overrides global preferences). | - | [clients/SignalWire.ts:114](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L114) |
| <a id="preferredvideocodecs"></a> `preferredVideoCodecs?` | `string`[] | Preferred video codecs for this call (overrides global preferences). | - | [clients/SignalWire.ts:112](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L112) |
| <a id="receiveaudio"></a> `receiveAudio?` | `boolean` | Whether to receive remote audio. | [`MediaOptions`](MediaOptions.md).[`receiveAudio`](MediaOptions.md#receiveaudio) | [core/types/media.types.ts:27](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L27) |
| <a id="receivevideo"></a> `receiveVideo?` | `boolean` | Whether to receive remote video. | [`MediaOptions`](MediaOptions.md).[`receiveVideo`](MediaOptions.md#receivevideo) | [core/types/media.types.ts:29](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L29) |
| <a id="stereo"></a> `stereo?` | `boolean` | Enable stereo Opus for this call (overrides global preferences). | - | [clients/SignalWire.ts:116](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L116) |
| <a id="uservariables"></a> `userVariables?` | `Record`\<`string`, `unknown`\> | Custom variables sent with the Verto invite. Merged with `client.preferences.userVariables` and any query-string variables on the destination URI; values here take precedence. | - | [clients/SignalWire.ts:124](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L124) |
| <a id="video"></a> `video?` | `boolean` | Enable video input. Defaults to `false` when not specified. | [`MediaOptions`](MediaOptions.md).[`video`](MediaOptions.md#video) | [core/types/media.types.ts:17](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/media.types.ts#L17) |
