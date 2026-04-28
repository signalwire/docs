# Interface: PlatformCapabilities

Defined in: [core/types/resilience.types.ts:169](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L169)

Browser/platform WebRTC capability flags.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="audiocodecs"></a> `audioCodecs` | `readonly` | readonly `string`[] | List of supported audio codecs. | [core/types/resilience.types.ts:183](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L183) |
| <a id="audiooutputselection"></a> `audioOutputSelection` | `readonly` | `boolean` | Whether setSinkId (audio output selection) is supported. | [core/types/resilience.types.ts:179](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L179) |
| <a id="getdisplaymedia"></a> `getDisplayMedia` | `readonly` | `boolean` | Whether getDisplayMedia is available. | [core/types/resilience.types.ts:189](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L189) |
| <a id="getusermedia"></a> `getUserMedia` | `readonly` | `boolean` | Whether getUserMedia is available. | [core/types/resilience.types.ts:187](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L187) |
| <a id="insertablestreams"></a> `insertableStreams` | `readonly` | `boolean` | Whether insertable streams / encoded transforms are available. | [core/types/resilience.types.ts:177](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L177) |
| <a id="screenshare"></a> `screenShare` | `readonly` | `boolean` | Whether screen sharing is supported. | [core/types/resilience.types.ts:171](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L171) |
| <a id="screenshareaudio"></a> `screenShareAudio` | `readonly` | `boolean` | Whether screen share can include system audio (Chrome-only). | [core/types/resilience.types.ts:173](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L173) |
| <a id="simulcast"></a> `simulcast` | `readonly` | `boolean` | Whether simulcast is supported. | [core/types/resilience.types.ts:175](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L175) |
| <a id="videocodecs"></a> `videoCodecs` | `readonly` | readonly `string`[] | List of supported video codecs. | [core/types/resilience.types.ts:181](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L181) |
| <a id="webrtc"></a> `webrtc` | `readonly` | `boolean` | Whether the browser supports WebRTC at all. | [core/types/resilience.types.ts:185](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L185) |
