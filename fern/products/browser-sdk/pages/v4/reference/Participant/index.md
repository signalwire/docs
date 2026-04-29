---
title: "Participant"
---

# Class: Participant

Defined in: [core/entities/Participant.ts:44](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L44)

Represents a participant in a call.

Provides observable state (audio/video mute, hand raise, volume, etc.)
and control methods for the participant. See [SelfParticipant](../SelfParticipant/index.md) for
the local participant with additional device control.

## Extends

- `Destroyable`

## Extended by

- [`SelfParticipant`](../SelfParticipant/index.md)

## Implements

- [`CallParticipant`](../interfaces/CallParticipant.md)

## Constructors

### Constructor

> **new Participant**(`id`, `executeMethod`, `deviceController`): `Participant`

Defined in: [core/entities/Participant.ts:48](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L48)

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
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | `Destroyable._destroyed$` | [behaviors/Destroyable.ts:8](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L8) |
| <a id="devicecontroller"></a> `deviceController` | `protected` | [`DeviceController`](../interfaces/DeviceController.md) | `undefined` | - | - | [core/entities/Participant.ts:51](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L51) |
| <a id="executemethod"></a> `executeMethod` | `protected` | [`ExecuteMethod`](../type-aliases/ExecuteMethod.md) | `undefined` | - | - | [core/entities/Participant.ts:50](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L50) |
| <a id="id"></a> `id` | `readonly` | `string` | `undefined` | Unique member ID of this participant. | - | [core/entities/Participant.ts:46](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L46) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | `Destroyable.subjects` | [behaviors/Destroyable.ts:7](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L7) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | `Destroyable.subscriptions` | [behaviors/Destroyable.ts:6](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L6) |

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
- [`subscriberId$`](./subscriberId$.md)
- [`type$`](./type$.md)
- [`videoMuted$`](./videoMuted$.md)
- [`visible$`](./visible$.md)

## Methods

- [`cachedObservable`](./cachedObservable.md)
- [`createBehaviorSubject`](./createBehaviorSubject.md)
- [`createReplaySubject`](./createReplaySubject.md)
- [`createSubject`](./createSubject.md)
- [`deferEmission`](./deferEmission.md)
- [`destroy`](./destroy.md)
- [`end`](./end.md)
- [`mute`](./mute.md)
- [`muteVideo`](./muteVideo.md)
- [`publicCachedObservable`](./publicCachedObservable.md)
- [`remove`](./remove.md)
- [`setAudioInputSensitivity`](./setAudioInputSensitivity.md)
- [`setAudioInputVolume`](./setAudioInputVolume.md)
- [`setAudioOutputVolume`](./setAudioOutputVolume.md)
- [`setMeta`](./setMeta.md)
- [`setPosition`](./setPosition.md)
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
