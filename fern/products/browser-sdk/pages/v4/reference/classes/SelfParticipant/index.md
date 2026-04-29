# Class: SelfParticipant

Defined in: [core/entities/Participant.ts:605](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L605)

The local participant in a call, with additional device and media control.

Extends [Participant](Participant.md) with screen sharing, device selection,
and local media stream management.

## Extends

- [`Participant`](Participant.md)

## Implements

- [`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md)

## Properties

| Property | Modifier | Type | Default value | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | [`Participant`](Participant.md).[`_destroyed$`](Participant.md#_destroyed) | [behaviors/Destroyable.ts:8](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L8) |
| <a id="capabilities"></a> `capabilities` | `readonly` | [`SelfCapabilities`](SelfCapabilities.md) | `undefined` | Capabilities for this participant. Contains all capability flags as both observables and values. | - | [core/entities/Participant.ts:610](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L610) |
| <a id="devicecontroller"></a> `deviceController` | `protected` | [`DeviceController`](../../interfaces/DeviceController.md) | `undefined` | - | [`Participant`](Participant.md).[`deviceController`](Participant.md#devicecontroller) | [core/entities/Participant.ts:51](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L51) |
| <a id="executemethod"></a> `executeMethod` | `protected` | [`ExecuteMethod`](../../type-aliases/ExecuteMethod.md) | `undefined` | - | [`Participant`](Participant.md).[`executeMethod`](Participant.md#executemethod) | [core/entities/Participant.ts:50](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L50) |
| <a id="id"></a> `id` | `readonly` | `string` | `undefined` | Unique member ID of this participant. | [`CallSelfParticipant`](../../interfaces/CallSelfParticipant.md).[`id`](../../interfaces/CallSelfParticipant.md#id) [`Participant`](Participant.md).[`id`](Participant.md#id) | [core/entities/Participant.ts:46](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L46) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | [`Participant`](Participant.md).[`subjects`](Participant.md#subjects) | [behaviors/Destroyable.ts:7](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L7) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | [`Participant`](Participant.md).[`subscriptions`](Participant.md#subscriptions) | [behaviors/Destroyable.ts:6](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L6) |

## Accessors

- [`addressId$`](./addressId$.md)
- [`audioMuted$`](./audioMuted$.md)
- [`autoGain$`](./autoGain$.md)
- [`deaf$`](./deaf$.md)
- [`denoise$`](./denoise$.md)
- [`destroyed$`](./destroyed$.md)
- [`echoCancellation$`](./echoCancellation$.md)
- [`handraised$`](./handraised$.md)
- [`inputSensitivity$`](./inputSensitivity$.md)
- [`inputVolume$`](./inputVolume$.md)
- [`isAudience`](./isAudience.md)
- [`isTalking$`](./isTalking$.md)
- [`lowbitrate$`](./lowbitrate$.md)
- [`meta$`](./meta$.md)
- [`name$`](./name$.md)
- [`nodeId$`](./nodeId$.md)
- [`noiseSuppression$`](./noiseSuppression$.md)
- [`outputVolume$`](./outputVolume$.md)
- [`position$`](./position$.md)
- [`screenShareStatus$`](./screenShareStatus$.md)
- [`studioAudio$`](./studioAudio$.md)
- [`subscriberId$`](./subscriberId$.md)
- [`type$`](./type$.md)
- [`videoMuted$`](./videoMuted$.md)
- [`visible$`](./visible$.md)

## Methods

- [`addAdditionalDevice`](./addAdditionalDevice.md)
- [`addAudioInputDevice`](./addAudioInputDevice.md)
- [`addInputDevices`](./addInputDevices.md)
- [`addVideoInputDevice`](./addVideoInputDevice.md)
- [`cachedObservable`](./cachedObservable.md)
- [`createBehaviorSubject`](./createBehaviorSubject.md)
- [`createReplaySubject`](./createReplaySubject.md)
- [`createSubject`](./createSubject.md)
- [`deferEmission`](./deferEmission.md)
- [`destroy`](./destroy.md)
- [`disableStudioAudio`](./disableStudioAudio.md)
- [`enableStudioAudio`](./enableStudioAudio.md)
- [`end`](./end.md)
- [`mute`](./mute.md)
- [`muteVideo`](./muteVideo.md)
- [`publicCachedObservable`](./publicCachedObservable.md)
- [`remove`](./remove.md)
- [`removeAdditionalDevice`](./removeAdditionalDevice.md)
- [`selectAudioInputDevice`](./selectAudioInputDevice.md)
- [`selectAudioOutputDevice`](./selectAudioOutputDevice.md)
- [`selectVideoInputDevice`](./selectVideoInputDevice.md)
- [`setAudioInputDeviceConstraints`](./setAudioInputDeviceConstraints.md)
- [`setAudioInputSensitivity`](./setAudioInputSensitivity.md)
- [`setAudioInputVolume`](./setAudioInputVolume.md)
- [`setAudioOutputVolume`](./setAudioOutputVolume.md)
- [`setInputDevicesConstraints`](./setInputDevicesConstraints.md)
- [`setMeta`](./setMeta.md)
- [`setPosition`](./setPosition.md)
- [`setVideoInputDeviceConstraints`](./setVideoInputDeviceConstraints.md)
- [`startScreenShare`](./startScreenShare.md)
- [`stopScreenShare`](./stopScreenShare.md)
- [`subscribeTo`](./subscribeTo.md)
- [`toggleAudioInputAutoGain`](./toggleAudioInputAutoGain.md)
- [`toggleDeaf`](./toggleDeaf.md)
- [`toggleEchoCancellation`](./toggleEchoCancellation.md)
- [`toggleHandraise`](./toggleHandraise.md)
- [`toggleLowbitrate`](./toggleLowbitrate.md)
- [`toggleMute`](./toggleMute.md)
- [`toggleMuteVideo`](./toggleMuteVideo.md)
- [`toggleNoiseSuppression`](./toggleNoiseSuppression.md)
- [`unmute`](./unmute.md)
- [`unmuteVideo`](./unmuteVideo.md)
- [`updateMeta`](./updateMeta.md)
