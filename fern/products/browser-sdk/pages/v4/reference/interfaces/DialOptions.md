# Interface: DialOptions

Defined in: [clients/SignalWire.ts:59](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L59)

Options for [SignalWire.dial](../classes/SignalWire.md#dial). Extends [MediaOptions](MediaOptions.md) with dial-specific settings.

## Extends

- [`MediaOptions`](MediaOptions.md)

## Properties

| Property | Type | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="audio"></a> `audio?` | `boolean` | Enable audio input. Defaults to `true` when not specified. | [`MediaOptions`](MediaOptions.md).[`audio`](MediaOptions.md#audio) | [core/types/media.types.ts:15](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/types/media.types.ts#L15) |
| <a id="inputaudiodeviceconstraints"></a> `inputAudioDeviceConstraints?` | `MediaTrackConstraints` | Custom constraints for the audio input track. | [`MediaOptions`](MediaOptions.md).[`inputAudioDeviceConstraints`](MediaOptions.md#inputaudiodeviceconstraints) | [core/types/media.types.ts:19](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/types/media.types.ts#L19) |
| <a id="inputaudiostream"></a> `inputAudioStream?` | `MediaStream` | Pre-existing audio stream to use instead of `getUserMedia`. | [`MediaOptions`](MediaOptions.md).[`inputAudioStream`](MediaOptions.md#inputaudiostream) | [core/types/media.types.ts:23](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/types/media.types.ts#L23) |
| <a id="inputvideodeviceconstraints"></a> `inputVideoDeviceConstraints?` | `MediaTrackConstraints` | Custom constraints for the video input track. | [`MediaOptions`](MediaOptions.md).[`inputVideoDeviceConstraints`](MediaOptions.md#inputvideodeviceconstraints) | [core/types/media.types.ts:21](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/types/media.types.ts#L21) |
| <a id="inputvideostream"></a> `inputVideoStream?` | `MediaStream` | Pre-existing video stream to use instead of `getUserMedia`. | [`MediaOptions`](MediaOptions.md).[`inputVideoStream`](MediaOptions.md#inputvideostream) | [core/types/media.types.ts:25](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/types/media.types.ts#L25) |
| <a id="receiveaudio"></a> `receiveAudio?` | `boolean` | Whether to receive remote audio. | [`MediaOptions`](MediaOptions.md).[`receiveAudio`](MediaOptions.md#receiveaudio) | [core/types/media.types.ts:27](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/types/media.types.ts#L27) |
| <a id="receivevideo"></a> `receiveVideo?` | `boolean` | Whether to receive remote video. | [`MediaOptions`](MediaOptions.md).[`receiveVideo`](MediaOptions.md#receivevideo) | [core/types/media.types.ts:29](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/types/media.types.ts#L29) |
| <a id="video"></a> `video?` | `boolean` | Enable video input. Defaults to `false` when not specified. | [`MediaOptions`](MediaOptions.md).[`video`](MediaOptions.md#video) | [core/types/media.types.ts:17](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/types/media.types.ts#L17) |
