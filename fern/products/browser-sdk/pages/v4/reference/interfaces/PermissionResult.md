# Interface: PermissionResult

Defined in: [core/types/resilience.types.ts:141](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L141)

Result of a media permissions request (Section 5.10).

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="audio"></a> `audio` | `readonly` | `boolean` | Whether audio permission was granted. | [core/types/resilience.types.ts:143](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L143) |
| <a id="selectedaudiodevice"></a> `selectedAudioDevice?` | `readonly` | `MediaDeviceInfo` | The audio device the user selected in the browser picker, if any. | [core/types/resilience.types.ts:147](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L147) |
| <a id="selectedvideodevice"></a> `selectedVideoDevice?` | `readonly` | `MediaDeviceInfo` | The video device the user selected in the browser picker, if any. | [core/types/resilience.types.ts:149](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L149) |
| <a id="video"></a> `video` | `readonly` | `boolean` | Whether video permission was granted. | [core/types/resilience.types.ts:145](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/resilience.types.ts#L145) |
