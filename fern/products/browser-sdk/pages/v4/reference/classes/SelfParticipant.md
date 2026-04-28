# Class: SelfParticipant

Defined in: [core/entities/Participant.ts:605](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L605)

The local participant in a call, with additional device and media control.

Extends [Participant](Participant.md) with screen sharing, device selection,
and local media stream management.

## Extends

- [`Participant`](Participant.md)

## Implements

- [`CallSelfParticipant`](../interfaces/CallSelfParticipant.md)

## Properties

| Property | Modifier | Type | Default value | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | [`Participant`](Participant.md).[`_destroyed$`](Participant.md#_destroyed) | [behaviors/Destroyable.ts:8](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L8) |
| <a id="capabilities"></a> `capabilities` | `readonly` | [`SelfCapabilities`](SelfCapabilities.md) | `undefined` | Capabilities for this participant. Contains all capability flags as both observables and values. | - | [core/entities/Participant.ts:610](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L610) |
| <a id="devicecontroller"></a> `deviceController` | `protected` | [`DeviceController`](../interfaces/DeviceController.md) | `undefined` | - | [`Participant`](Participant.md).[`deviceController`](Participant.md#devicecontroller) | [core/entities/Participant.ts:51](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L51) |
| <a id="executemethod"></a> `executeMethod` | `protected` | [`ExecuteMethod`](../type-aliases/ExecuteMethod.md) | `undefined` | - | [`Participant`](Participant.md).[`executeMethod`](Participant.md#executemethod) | [core/entities/Participant.ts:50](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L50) |
| <a id="id"></a> `id` | `readonly` | `string` | `undefined` | Unique member ID of this participant. | [`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`id`](../interfaces/CallSelfParticipant.md#id) [`Participant`](Participant.md).[`id`](Participant.md#id) | [core/entities/Participant.ts:46](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L46) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | [`Participant`](Participant.md).[`subjects`](Participant.md#subjects) | [behaviors/Destroyable.ts:7](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L7) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | [`Participant`](Participant.md).[`subscriptions`](Participant.md#subscriptions) | [behaviors/Destroyable.ts:6](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L6) |

## Accessors

- [`addressId`](./SelfParticipant/addressId.md)
- [`addressId$`](./SelfParticipant/addressId$.md)
- [`audioMuted`](./SelfParticipant/audioMuted.md)
- [`audioMuted$`](./SelfParticipant/audioMuted$.md)
- [`autoGain`](./SelfParticipant/autoGain.md)
- [`autoGain$`](./SelfParticipant/autoGain$.md)
- [`deaf`](./SelfParticipant/deaf.md)
- [`deaf$`](./SelfParticipant/deaf$.md)
- [`denoise`](./SelfParticipant/denoise.md)
- [`denoise$`](./SelfParticipant/denoise$.md)
- [`destroyed$`](./SelfParticipant/destroyed$.md)
- [`echoCancellation`](./SelfParticipant/echoCancellation.md)
- [`echoCancellation$`](./SelfParticipant/echoCancellation$.md)
- [`handraised`](./SelfParticipant/handraised.md)
- [`handraised$`](./SelfParticipant/handraised$.md)
- [`inputSensitivity`](./SelfParticipant/inputSensitivity.md)
- [`inputSensitivity$`](./SelfParticipant/inputSensitivity$.md)
- [`inputVolume`](./SelfParticipant/inputVolume.md)
- [`inputVolume$`](./SelfParticipant/inputVolume$.md)
- [`isAudience`](./SelfParticipant/isAudience.md)
- [`isTalking`](./SelfParticipant/isTalking.md)
- [`isTalking$`](./SelfParticipant/isTalking$.md)
- [`lowbitrate`](./SelfParticipant/lowbitrate.md)
- [`lowbitrate$`](./SelfParticipant/lowbitrate$.md)
- [`meta`](./SelfParticipant/meta.md)
- [`meta$`](./SelfParticipant/meta$.md)
- [`name`](./SelfParticipant/name.md)
- [`name$`](./SelfParticipant/name$.md)
- [`nodeId`](./SelfParticipant/nodeId.md)
- [`nodeId$`](./SelfParticipant/nodeId$.md)
- [`noiseSuppression`](./SelfParticipant/noiseSuppression.md)
- [`noiseSuppression$`](./SelfParticipant/noiseSuppression$.md)
- [`outputVolume`](./SelfParticipant/outputVolume.md)
- [`outputVolume$`](./SelfParticipant/outputVolume$.md)
- [`position`](./SelfParticipant/position.md)
- [`position$`](./SelfParticipant/position$.md)
- [`screenShareStatus`](./SelfParticipant/screenShareStatus.md)
- [`screenShareStatus$`](./SelfParticipant/screenShareStatus$.md)
- [`studioAudio`](./SelfParticipant/studioAudio.md)
- [`studioAudio$`](./SelfParticipant/studioAudio$.md)
- [`subscriberId`](./SelfParticipant/subscriberId.md)
- [`subscriberId$`](./SelfParticipant/subscriberId$.md)
- [`type`](./SelfParticipant/type.md)
- [`type$`](./SelfParticipant/type$.md)
- [`videoMuted`](./SelfParticipant/videoMuted.md)
- [`videoMuted$`](./SelfParticipant/videoMuted$.md)
- [`visible`](./SelfParticipant/visible.md)
- [`visible$`](./SelfParticipant/visible$.md)

## Methods

- [`addAdditionalDevice`](./SelfParticipant/addAdditionalDevice.md)
- [`addAudioInputDevice`](./SelfParticipant/addAudioInputDevice.md)
- [`addInputDevices`](./SelfParticipant/addInputDevices.md)
- [`addVideoInputDevice`](./SelfParticipant/addVideoInputDevice.md)
- [`cachedObservable`](./SelfParticipant/cachedObservable.md)
- [`createBehaviorSubject`](./SelfParticipant/createBehaviorSubject.md)
- [`createReplaySubject`](./SelfParticipant/createReplaySubject.md)
- [`createSubject`](./SelfParticipant/createSubject.md)
- [`deferEmission`](./SelfParticipant/deferEmission.md)
- [`destroy`](./SelfParticipant/destroy.md)
- [`disableStudioAudio`](./SelfParticipant/disableStudioAudio.md)
- [`enableStudioAudio`](./SelfParticipant/enableStudioAudio.md)
- [`end`](./SelfParticipant/end.md)
- [`mute`](./SelfParticipant/mute.md)
- [`muteVideo`](./SelfParticipant/muteVideo.md)
- [`publicCachedObservable`](./SelfParticipant/publicCachedObservable.md)
- [`remove`](./SelfParticipant/remove.md)
- [`removeAdditionalDevice`](./SelfParticipant/removeAdditionalDevice.md)
- [`selectAudioInputDevice`](./SelfParticipant/selectAudioInputDevice.md)
- [`selectAudioOutputDevice`](./SelfParticipant/selectAudioOutputDevice.md)
- [`selectVideoInputDevice`](./SelfParticipant/selectVideoInputDevice.md)
- [`setAudioInputDeviceConstraints`](./SelfParticipant/setAudioInputDeviceConstraints.md)
- [`setAudioInputSensitivity`](./SelfParticipant/setAudioInputSensitivity.md)
- [`setAudioInputVolume`](./SelfParticipant/setAudioInputVolume.md)
- [`setAudioOutputVolume`](./SelfParticipant/setAudioOutputVolume.md)
- [`setInputDevicesConstraints`](./SelfParticipant/setInputDevicesConstraints.md)
- [`setMeta`](./SelfParticipant/setMeta.md)
- [`setPosition`](./SelfParticipant/setPosition.md)
- [`setVideoInputDeviceConstraints`](./SelfParticipant/setVideoInputDeviceConstraints.md)
- [`startScreenShare`](./SelfParticipant/startScreenShare.md)
- [`stopScreenShare`](./SelfParticipant/stopScreenShare.md)
- [`subscribeTo`](./SelfParticipant/subscribeTo.md)
- [`toggleAudioInputAutoGain`](./SelfParticipant/toggleAudioInputAutoGain.md)
- [`toggleDeaf`](./SelfParticipant/toggleDeaf.md)
- [`toggleEchoCancellation`](./SelfParticipant/toggleEchoCancellation.md)
- [`toggleHandraise`](./SelfParticipant/toggleHandraise.md)
- [`toggleLowbitrate`](./SelfParticipant/toggleLowbitrate.md)
- [`toggleMute`](./SelfParticipant/toggleMute.md)
- [`toggleMuteVideo`](./SelfParticipant/toggleMuteVideo.md)
- [`toggleNoiseSuppression`](./SelfParticipant/toggleNoiseSuppression.md)
- [`unmute`](./SelfParticipant/unmute.md)
- [`unmuteVideo`](./SelfParticipant/unmuteVideo.md)
- [`updateMeta`](./SelfParticipant/updateMeta.md)
