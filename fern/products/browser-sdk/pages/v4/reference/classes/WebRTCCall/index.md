# Class: WebRTCCall

Defined in: [core/entities/Call.ts:152](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L152)

Concrete WebRTC call implementation.

Manages the full lifecycle of a call including signaling, media streams,
participants, layout, and event routing. Created via [SignalWire.dial](SignalWire.md#dial)
or received as an inbound call.

## Extends

- `Destroyable`

## Implements

- `CallManager`

## Constructors

### Constructor

> **new WebRTCCall**(`clientSession`, `options`, `initialization`, `address?`): `WebRTCCall`

Defined in: [core/entities/Call.ts:191](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L191)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `clientSession` | `ClientSession` |
| `options` | [`CallOptions`](../../interfaces/CallOptions.md) |
| `initialization` | `CallInitialization` |
| `address?` | [`Address`](Address.md) |

#### Returns

`WebRTCCall`

#### Overrides

`Destroyable.constructor`

## Properties

| Property | Modifier | Type | Default value | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | `Destroyable._destroyed$` | [behaviors/Destroyable.ts:8](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L8) |
| <a id="address"></a> `address?` | `public` | [`Address`](Address.md) | `undefined` | - | - | [core/entities/Call.ts:195](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L195) |
| <a id="clientsession"></a> `clientSession` | `public` | `ClientSession` | `undefined` | - | - | [core/entities/Call.ts:192](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L192) |
| <a id="id"></a> `id` | `readonly` | `string` | `undefined` | Unique identifier for this call. | - | [core/entities/Call.ts:154](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L154) |
| <a id="options"></a> `options` | `public` | [`CallOptions`](../../interfaces/CallOptions.md) | `undefined` | - | - | [core/entities/Call.ts:193](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L193) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | `Destroyable.subjects` | [behaviors/Destroyable.ts:7](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L7) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | `Destroyable.subscriptions` | [behaviors/Destroyable.ts:6](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L6) |
| <a id="to"></a> `to?` | `public` | `string` | `undefined` | Destination URI this call was placed to. | - | [core/entities/Call.ts:156](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L156) |

## Accessors

- [`address$`](./address$.md)
- [`answered$`](./answered$.md)
- [`answerMediaOptions`](./answerMediaOptions.md)
- [`bandwidthConstrained$`](./bandwidthConstrained$.md)
- [`callEvent$`](./callEvent$.md)
- [`callStates$`](./callStates$.md)
- [`callUpdated$`](./callUpdated$.md)
- [`capabilities$`](./capabilities$.md)
- [`destroyed$`](./destroyed$.md)
- [`direction`](./direction.md)
- [`errors$`](./errors$.md)
- [`from`](./from.md)
- [`fromName`](./fromName.md)
- [`isNetworkHealthy$`](./isNetworkHealthy$.md)
- [`layout$`](./layout$.md)
- [`layoutEvent$`](./layoutEvent$.md)
- [`layoutLayers$`](./layoutLayers$.md)
- [`layouts$`](./layouts$.md)
- [`layoutUpdates$`](./layoutUpdates$.md)
- [`localAudioLevel$`](./localAudioLevel$.md)
- [`localMicrophoneGain$`](./localMicrophoneGain$.md)
- [`localSpeaking$`](./localSpeaking$.md)
- [`localStream$`](./localStream$.md)
- [`locked$`](./locked$.md)
- [`mediaDirections$`](./mediaDirections$.md)
- [`mediaParamsUpdated$`](./mediaParamsUpdated$.md)
- [`memberJoined$`](./memberJoined$.md)
- [`memberLeft$`](./memberLeft$.md)
- [`memberTalking$`](./memberTalking$.md)
- [`memberUpdated$`](./memberUpdated$.md)
- [`meta$`](./meta$.md)
- [`networkIssues$`](./networkIssues$.md)
- [`networkMetrics$`](./networkMetrics$.md)
- [`nodeId$`](./nodeId$.md)
- [`participants$`](./participants$.md)
- [`participantsId$`](./participantsId$.md)
- [`qualityLevel$`](./qualityLevel$.md)
- [`qualityScore$`](./qualityScore$.md)
- [`raiseHandPriority$`](./raiseHandPriority$.md)
- [`recording$`](./recording$.md)
- [`recoveryEvent$`](./recoveryEvent$.md)
- [`recoveryState$`](./recoveryState$.md)
- [`remoteAudioLevel$`](./remoteAudioLevel$.md)
- [`remoteStream$`](./remoteStream$.md)
- [`rtcPeerConnection`](./rtcPeerConnection.md)
- [`self$`](./self$.md)
- [`selfId$`](./selfId$.md)
- [`signalingEvent$`](./signalingEvent$.md)
- [`status$`](./status$.md)
- [`streaming$`](./streaming$.md)
- [`toName`](./toName.md)
- [`userVariables$`](./userVariables$.md)
- [`webrtcMessages$`](./webrtcMessages$.md)

## Methods

- [`answer`](./answer.md)
- [`cachedObservable`](./cachedObservable.md)
- [`createBehaviorSubject`](./createBehaviorSubject.md)
- [`createReplaySubject`](./createReplaySubject.md)
- [`createSubject`](./createSubject.md)
- [`deferEmission`](./deferEmission.md)
- [`destroy`](./destroy.md)
- [`disablePushToTalk`](./disablePushToTalk.md)
- [`enablePushToTalk`](./enablePushToTalk.md)
- [`execute`](./execute.md)
- [`executeMethod`](./executeMethod.md)
- [`hangup`](./hangup.md)
- [`notifyModifyFailed`](./notifyModifyFailed.md)
- [`publicCachedObservable`](./publicCachedObservable.md)
- [`reject`](./reject.md)
- [`requestIceRestart`](./requestIceRestart.md)
- [`requestKeyframe`](./requestKeyframe.md)
- [`sendDigits`](./sendDigits.md)
- [`setAutoGainControl`](./setAutoGainControl.md)
- [`setEchoCancellation`](./setEchoCancellation.md)
- [`setLayout`](./setLayout.md)
- [`setLocalMicrophoneGain`](./setLocalMicrophoneGain.md)
- [`setMeta`](./setMeta.md)
- [`setNoiseSuppression`](./setNoiseSuppression.md)
- [`setPushToTalkActive`](./setPushToTalkActive.md)
- [`startRecording`](./startRecording.md)
- [`startStreaming`](./startStreaming.md)
- [`subscribe`](./subscribe.md)
- [`subscribeTo`](./subscribeTo.md)
- [`toggleHold`](./toggleHold.md)
- [`toggleIncomingAudio`](./toggleIncomingAudio.md)
- [`toggleIncomingVideo`](./toggleIncomingVideo.md)
- [`toggleLock`](./toggleLock.md)
- [`transfer`](./transfer.md)
- [`updateMeta`](./updateMeta.md)
