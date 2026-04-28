# Class: Participant

Defined in: [core/entities/Participant.ts:44](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L44)

Represents a participant in a call.

Provides observable state (audio/video mute, hand raise, volume, etc.)
and control methods for the participant. See [SelfParticipant](SelfParticipant.md) for
the local participant with additional device control.

## Extends

- `Destroyable`

## Extended by

- [`SelfParticipant`](SelfParticipant.md)

## Implements

- [`CallParticipant`](../interfaces/CallParticipant.md)

## Constructors

### Constructor

> **new Participant**(`id`, `executeMethod`, `deviceController`): `Participant`

Defined in: [core/entities/Participant.ts:48](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L48)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `id` | `string` |
| `executeMethod` | [`ExecuteMethod`](../type-aliases/ExecuteMethod.md) |
| `deviceController` | [`DeviceController`](../interfaces/DeviceController.md) |

#### Returns

`Participant`

#### Overrides

`Destroyable.constructor`

## Properties

| Property | Modifier | Type | Default value | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | `Destroyable._destroyed$` | [behaviors/Destroyable.ts:8](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L8) |
| <a id="devicecontroller"></a> `deviceController` | `protected` | [`DeviceController`](../interfaces/DeviceController.md) | `undefined` | - | - | [core/entities/Participant.ts:51](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L51) |
| <a id="executemethod"></a> `executeMethod` | `protected` | [`ExecuteMethod`](../type-aliases/ExecuteMethod.md) | `undefined` | - | - | [core/entities/Participant.ts:50](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L50) |
| <a id="id"></a> `id` | `readonly` | `string` | `undefined` | Unique member ID of this participant. | - | [core/entities/Participant.ts:46](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Participant.ts#L46) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | `Destroyable.subjects` | [behaviors/Destroyable.ts:7](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L7) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | `Destroyable.subscriptions` | [behaviors/Destroyable.ts:6](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L6) |

## Accessors

- [`addressId`](./Participant/addressId.md)
- [`addressId$`](./Participant/addressId$.md)
- [`audioMuted`](./Participant/audioMuted.md)
- [`audioMuted$`](./Participant/audioMuted$.md)
- [`autoGain`](./Participant/autoGain.md)
- [`autoGain$`](./Participant/autoGain$.md)
- [`deaf`](./Participant/deaf.md)
- [`deaf$`](./Participant/deaf$.md)
- [`denoise`](./Participant/denoise.md)
- [`denoise$`](./Participant/denoise$.md)
- [`destroyed$`](./Participant/destroyed$.md)
- [`echoCancellation`](./Participant/echoCancellation.md)
- [`echoCancellation$`](./Participant/echoCancellation$.md)
- [`handraised`](./Participant/handraised.md)
- [`handraised$`](./Participant/handraised$.md)
- [`inputSensitivity`](./Participant/inputSensitivity.md)
- [`inputSensitivity$`](./Participant/inputSensitivity$.md)
- [`inputVolume`](./Participant/inputVolume.md)
- [`inputVolume$`](./Participant/inputVolume$.md)
- [`isAudience`](./Participant/isAudience.md)
- [`isTalking`](./Participant/isTalking.md)
- [`isTalking$`](./Participant/isTalking$.md)
- [`lowbitrate`](./Participant/lowbitrate.md)
- [`lowbitrate$`](./Participant/lowbitrate$.md)
- [`meta`](./Participant/meta.md)
- [`meta$`](./Participant/meta$.md)
- [`name`](./Participant/name.md)
- [`name$`](./Participant/name$.md)
- [`nodeId`](./Participant/nodeId.md)
- [`nodeId$`](./Participant/nodeId$.md)
- [`noiseSuppression`](./Participant/noiseSuppression.md)
- [`noiseSuppression$`](./Participant/noiseSuppression$.md)
- [`outputVolume`](./Participant/outputVolume.md)
- [`outputVolume$`](./Participant/outputVolume$.md)
- [`position`](./Participant/position.md)
- [`position$`](./Participant/position$.md)
- [`subscriberId`](./Participant/subscriberId.md)
- [`subscriberId$`](./Participant/subscriberId$.md)
- [`type`](./Participant/type.md)
- [`type$`](./Participant/type$.md)
- [`videoMuted`](./Participant/videoMuted.md)
- [`videoMuted$`](./Participant/videoMuted$.md)
- [`visible`](./Participant/visible.md)
- [`visible$`](./Participant/visible$.md)

## Methods

- [`cachedObservable`](./Participant/cachedObservable.md)
- [`createBehaviorSubject`](./Participant/createBehaviorSubject.md)
- [`createReplaySubject`](./Participant/createReplaySubject.md)
- [`createSubject`](./Participant/createSubject.md)
- [`deferEmission`](./Participant/deferEmission.md)
- [`destroy`](./Participant/destroy.md)
- [`end`](./Participant/end.md)
- [`mute`](./Participant/mute.md)
- [`muteVideo`](./Participant/muteVideo.md)
- [`publicCachedObservable`](./Participant/publicCachedObservable.md)
- [`remove`](./Participant/remove.md)
- [`setAudioInputSensitivity`](./Participant/setAudioInputSensitivity.md)
- [`setAudioInputVolume`](./Participant/setAudioInputVolume.md)
- [`setAudioOutputVolume`](./Participant/setAudioOutputVolume.md)
- [`setMeta`](./Participant/setMeta.md)
- [`setPosition`](./Participant/setPosition.md)
- [`subscribeTo`](./Participant/subscribeTo.md)
- [`toggleAudioInputAutoGain`](./Participant/toggleAudioInputAutoGain.md)
- [`toggleDeaf`](./Participant/toggleDeaf.md)
- [`toggleEchoCancellation`](./Participant/toggleEchoCancellation.md)
- [`toggleHandraise`](./Participant/toggleHandraise.md)
- [`toggleLowbitrate`](./Participant/toggleLowbitrate.md)
- [`toggleMute`](./Participant/toggleMute.md)
- [`toggleMuteVideo`](./Participant/toggleMuteVideo.md)
- [`toggleNoiseSuppression`](./Participant/toggleNoiseSuppression.md)
- [`unmute`](./Participant/unmute.md)
- [`unmuteVideo`](./Participant/unmuteVideo.md)
- [`updateMeta`](./Participant/updateMeta.md)
