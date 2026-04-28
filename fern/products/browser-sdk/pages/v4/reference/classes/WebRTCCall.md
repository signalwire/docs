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
| `options` | [`CallOptions`](../interfaces/CallOptions.md) |
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
| <a id="options"></a> `options` | `public` | [`CallOptions`](../interfaces/CallOptions.md) | `undefined` | - | - | [core/entities/Call.ts:193](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L193) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | `Destroyable.subjects` | [behaviors/Destroyable.ts:7](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L7) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | `Destroyable.subscriptions` | [behaviors/Destroyable.ts:6](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L6) |
| <a id="to"></a> `to?` | `public` | `string` | `undefined` | Destination URI this call was placed to. | - | [core/entities/Call.ts:156](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L156) |

## Accessors

- [`address$`](./WebRTCCall/address$.md)
- [`answered$`](./WebRTCCall/answered$.md)
- [`answerMediaOptions`](./WebRTCCall/answerMediaOptions.md)
- [`bandwidthConstrained$`](./WebRTCCall/bandwidthConstrained$.md)
- [`callEvent$`](./WebRTCCall/callEvent$.md)
- [`callStates$`](./WebRTCCall/callStates$.md)
- [`callUpdated$`](./WebRTCCall/callUpdated$.md)
- [`capabilities`](./WebRTCCall/capabilities.md)
- [`capabilities$`](./WebRTCCall/capabilities$.md)
- [`destroyed$`](./WebRTCCall/destroyed$.md)
- [`direction`](./WebRTCCall/direction.md)
- [`errors$`](./WebRTCCall/errors$.md)
- [`from`](./WebRTCCall/from.md)
- [`fromName`](./WebRTCCall/fromName.md)
- [`isNetworkHealthy`](./WebRTCCall/isNetworkHealthy.md)
- [`isNetworkHealthy$`](./WebRTCCall/isNetworkHealthy$.md)
- [`layout`](./WebRTCCall/layout.md)
- [`layout$`](./WebRTCCall/layout$.md)
- [`layoutEvent$`](./WebRTCCall/layoutEvent$.md)
- [`layoutLayers`](./WebRTCCall/layoutLayers.md)
- [`layoutLayers$`](./WebRTCCall/layoutLayers$.md)
- [`layouts`](./WebRTCCall/layouts.md)
- [`layouts$`](./WebRTCCall/layouts$.md)
- [`layoutUpdates$`](./WebRTCCall/layoutUpdates$.md)
- [`localAudioLevel$`](./WebRTCCall/localAudioLevel$.md)
- [`localMicrophoneGain$`](./WebRTCCall/localMicrophoneGain$.md)
- [`localSpeaking$`](./WebRTCCall/localSpeaking$.md)
- [`localStream`](./WebRTCCall/localStream.md)
- [`localStream$`](./WebRTCCall/localStream$.md)
- [`locked`](./WebRTCCall/locked.md)
- [`locked$`](./WebRTCCall/locked$.md)
- [`mediaDirections`](./WebRTCCall/mediaDirections.md)
- [`mediaDirections$`](./WebRTCCall/mediaDirections$.md)
- [`mediaParamsUpdated$`](./WebRTCCall/mediaParamsUpdated$.md)
- [`memberJoined$`](./WebRTCCall/memberJoined$.md)
- [`memberLeft$`](./WebRTCCall/memberLeft$.md)
- [`memberTalking$`](./WebRTCCall/memberTalking$.md)
- [`memberUpdated$`](./WebRTCCall/memberUpdated$.md)
- [`meta`](./WebRTCCall/meta.md)
- [`meta$`](./WebRTCCall/meta$.md)
- [`networkIssues`](./WebRTCCall/networkIssues.md)
- [`networkIssues$`](./WebRTCCall/networkIssues$.md)
- [`networkMetrics`](./WebRTCCall/networkMetrics.md)
- [`networkMetrics$`](./WebRTCCall/networkMetrics$.md)
- [`nodeId`](./WebRTCCall/nodeId.md)
- [`nodeId$`](./WebRTCCall/nodeId$.md)
- [`participants`](./WebRTCCall/participants.md)
- [`participants$`](./WebRTCCall/participants$.md)
- [`participantsId$`](./WebRTCCall/participantsId$.md)
- [`qualityLevel$`](./WebRTCCall/qualityLevel$.md)
- [`qualityScore$`](./WebRTCCall/qualityScore$.md)
- [`raiseHandPriority`](./WebRTCCall/raiseHandPriority.md)
- [`raiseHandPriority$`](./WebRTCCall/raiseHandPriority$.md)
- [`recording`](./WebRTCCall/recording.md)
- [`recording$`](./WebRTCCall/recording$.md)
- [`recoveryEvent$`](./WebRTCCall/recoveryEvent$.md)
- [`recoveryState$`](./WebRTCCall/recoveryState$.md)
- [`remoteAudioLevel$`](./WebRTCCall/remoteAudioLevel$.md)
- [`remoteStream`](./WebRTCCall/remoteStream.md)
- [`remoteStream$`](./WebRTCCall/remoteStream$.md)
- [`rtcPeerConnection`](./WebRTCCall/rtcPeerConnection.md)
- [`self`](./WebRTCCall/self.md)
- [`self$`](./WebRTCCall/self$.md)
- [`selfId`](./WebRTCCall/selfId.md)
- [`selfId$`](./WebRTCCall/selfId$.md)
- [`signalingEvent$`](./WebRTCCall/signalingEvent$.md)
- [`status`](./WebRTCCall/status.md)
- [`status$`](./WebRTCCall/status$.md)
- [`streaming`](./WebRTCCall/streaming.md)
- [`streaming$`](./WebRTCCall/streaming$.md)
- [`toName`](./WebRTCCall/toName.md)
- [`userVariables`](./WebRTCCall/userVariables.md)
- [`userVariables$`](./WebRTCCall/userVariables$.md)
- [`webrtcMessages$`](./WebRTCCall/webrtcMessages$.md)

## Methods

- [`answer`](./WebRTCCall/answer.md)
- [`cachedObservable`](./WebRTCCall/cachedObservable.md)
- [`createBehaviorSubject`](./WebRTCCall/createBehaviorSubject.md)
- [`createReplaySubject`](./WebRTCCall/createReplaySubject.md)
- [`createSubject`](./WebRTCCall/createSubject.md)
- [`deferEmission`](./WebRTCCall/deferEmission.md)
- [`destroy`](./WebRTCCall/destroy.md)
- [`disablePushToTalk`](./WebRTCCall/disablePushToTalk.md)
- [`enablePushToTalk`](./WebRTCCall/enablePushToTalk.md)
- [`execute`](./WebRTCCall/execute.md)
- [`executeMethod`](./WebRTCCall/executeMethod.md)
- [`hangup`](./WebRTCCall/hangup.md)
- [`notifyModifyFailed`](./WebRTCCall/notifyModifyFailed.md)
- [`publicCachedObservable`](./WebRTCCall/publicCachedObservable.md)
- [`reject`](./WebRTCCall/reject.md)
- [`requestIceRestart`](./WebRTCCall/requestIceRestart.md)
- [`requestKeyframe`](./WebRTCCall/requestKeyframe.md)
- [`sendDigits`](./WebRTCCall/sendDigits.md)
- [`setAutoGainControl`](./WebRTCCall/setAutoGainControl.md)
- [`setEchoCancellation`](./WebRTCCall/setEchoCancellation.md)
- [`setLayout`](./WebRTCCall/setLayout.md)
- [`setLocalMicrophoneGain`](./WebRTCCall/setLocalMicrophoneGain.md)
- [`setMeta`](./WebRTCCall/setMeta.md)
- [`setNoiseSuppression`](./WebRTCCall/setNoiseSuppression.md)
- [`setPushToTalkActive`](./WebRTCCall/setPushToTalkActive.md)
- [`startRecording`](./WebRTCCall/startRecording.md)
- [`startStreaming`](./WebRTCCall/startStreaming.md)
- [`subscribe`](./WebRTCCall/subscribe.md)
- [`subscribeTo`](./WebRTCCall/subscribeTo.md)
- [`toggleHold`](./WebRTCCall/toggleHold.md)
- [`toggleIncomingAudio`](./WebRTCCall/toggleIncomingAudio.md)
- [`toggleIncomingVideo`](./WebRTCCall/toggleIncomingVideo.md)
- [`toggleLock`](./WebRTCCall/toggleLock.md)
- [`transfer`](./WebRTCCall/transfer.md)
- [`updateMeta`](./WebRTCCall/updateMeta.md)
