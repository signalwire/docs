Defined in: [packages/client/src/RoomSessionScreenShare.ts:25](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/RoomSessionScreenShare.ts#L25)

## Extends

- `RoomScreenShareMethods`.`BaseConnectionContract`\<`RoomSessionScreenShareEvents`\>

## Properties

### active

> `readonly` **active**: `boolean`

Defined in: [packages/core/src/types/index.ts:107](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L107)

Whether the connection is currently active

#### Inherited from

`BaseConnectionContract.active`

***

### callId

> `readonly` **callId**: `string`

Defined in: [packages/core/src/types/index.ts:103](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L103)

**`Internal`**

The underlying connection id - callId

#### Inherited from

`BaseConnectionContract.callId`

***

### cameraConstraints

> `readonly` **cameraConstraints**: `null` \| `MediaTrackConstraints`

Defined in: [packages/core/src/types/index.ts:73](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L73)

The constraints applied to the video device, or null if not available

#### Inherited from

`BaseConnectionContract.cameraConstraints`

***

### cameraId

> `readonly` **cameraId**: `null` \| `string`

Defined in: [packages/core/src/types/index.ts:69](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L69)

The id of the video device, or null if not available

#### Inherited from

`BaseConnectionContract.cameraId`

***

### cameraLabel

> `readonly` **cameraLabel**: `null` \| `string`

Defined in: [packages/core/src/types/index.ts:71](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L71)

The label of the video device, or null if not available

#### Inherited from

`BaseConnectionContract.cameraLabel`

***

### id

> `readonly` **id**: `string`

Defined in: [packages/core/src/types/index.ts:61](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L61)

Unique id for this room session

#### Inherited from

`BaseConnectionContract.id`

***

### leaveReason

> `readonly` **leaveReason**: `undefined` \| `"RECONNECTION_ATTEMPT_TIMEOUT"`

Defined in: [packages/core/src/types/index.ts:66](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L66)

**`Internal`**

#### Inherited from

`BaseConnectionContract.leaveReason`

***

### localAudioTrack

> `readonly` **localAudioTrack**: `null` \| `MediaStreamTrack`

Defined in: [packages/core/src/types/index.ts:84](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L84)

Provides access to the local audio
[MediaStreamTrack](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack).

#### Inherited from

`BaseConnectionContract.localAudioTrack`

***

### localStream

> `readonly` **localStream**: `undefined` \| `MediaStream`

Defined in: [packages/core/src/types/index.ts:75](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L75)

Provides access to the local [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream)

#### Inherited from

`BaseConnectionContract.localStream`

***

### localVideoTrack

> `readonly` **localVideoTrack**: `null` \| `MediaStreamTrack`

Defined in: [packages/core/src/types/index.ts:89](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L89)

Provides access to the local video
[MediaStreamTrack](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack).

#### Inherited from

`BaseConnectionContract.localVideoTrack`

***

### memberId

> `readonly` **memberId**: `string`

Defined in: [packages/core/src/types/index.ts:109](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L109)

The id of the current member within the room

#### Inherited from

`BaseConnectionContract.memberId`

***

### microphoneConstraints

> `readonly` **microphoneConstraints**: `null` \| `MediaTrackConstraints`

Defined in: [packages/core/src/types/index.ts:95](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L95)

The constraints applied to the audio input device, or null if not available

#### Inherited from

`BaseConnectionContract.microphoneConstraints`

***

### microphoneId

> `readonly` **microphoneId**: `null` \| `string`

Defined in: [packages/core/src/types/index.ts:91](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L91)

The id of the audio input device, or null if not available

#### Inherited from

`BaseConnectionContract.microphoneId`

***

### microphoneLabel

> `readonly` **microphoneLabel**: `null` \| `string`

Defined in: [packages/core/src/types/index.ts:93](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L93)

The label of the audio input device, or null if not available

#### Inherited from

`BaseConnectionContract.microphoneLabel`

***

### options

> `readonly` **options**: `Record`\<`any`, `any`\>

Defined in: [packages/core/src/types/index.ts:63](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L63)

**`Internal`**

The BaseConnection options

#### Inherited from

`BaseConnectionContract.options`

***

### previewUrl?

> `readonly` `optional` **previewUrl**: `string`

Defined in: [packages/core/src/types/index.ts:111](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L111)

The preview_url for the room. Only with "enable_room_previews: true" on Room configuration.

#### Inherited from

`BaseConnectionContract.previewUrl`

***

### remoteStream

> `readonly` **remoteStream**: `undefined` \| `MediaStream`

Defined in: [packages/core/src/types/index.ts:99](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L99)

Provides access to the remote [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream)

#### Inherited from

`BaseConnectionContract.remoteStream`

***

### roomId

> `readonly` **roomId**: `string`

Defined in: [packages/core/src/types/index.ts:101](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L101)

The unique identifier for the room

#### Inherited from

`BaseConnectionContract.roomId`

***

### roomSessionId

> `readonly` **roomSessionId**: `string`

Defined in: [packages/core/src/types/index.ts:105](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L105)

The unique identifier for the room session

#### Inherited from

`BaseConnectionContract.roomSessionId`

***

### runWorker()

> **runWorker**: \<`Hooks`\>(`name`, `def`) => `Task`\<`any`\>

Defined in: [packages/client/src/RoomSessionScreenShare.ts:31](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/RoomSessionScreenShare.ts#L31)

**`Internal`**

**`Internal`**

#### Type Parameters

##### Hooks

`Hooks` *extends* `SDKWorkerHooks` = `SDKWorkerHooks`

#### Parameters

##### name

`string`

##### def

`SDKWorkerDefinition`\<`Hooks`\>

#### Returns

`Task`\<`any`\>

***

### withAudio

> `readonly` **withAudio**: `boolean`

Defined in: [packages/core/src/types/index.ts:77](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L77)

Indicates if there is any receiving audio

#### Inherited from

`BaseConnectionContract.withAudio`

***

### withVideo

> `readonly` **withVideo**: `boolean`

Defined in: [packages/core/src/types/index.ts:79](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L79)

Indicates if there is any receiving video

#### Inherited from

`BaseConnectionContract.withVideo`

## Methods

### audioMute()

> **audioMute**(): `Promise`

Defined in: [packages/client/src/utils/interfaces/video.ts:217](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/video.ts#L217)

Puts the microphone on mute. The other participants will not hear audio
from the muted device anymore.

#### Returns

`Promise`

#### Permissions

- `room.self.audio_mute`

You need to specify the permissions when [creating the Video Room
Token](https://developer.signalwire.com/apis/reference/create_room_token)
on the server side.

#### Example

```typescript
await roomdevice.audioMute()
```

#### Inherited from

`RoomScreenShareMethods.audioMute`

***

### audioUnmute()

> **audioUnmute**(): `Promise`

Defined in: [packages/client/src/utils/interfaces/video.ts:234](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/video.ts#L234)

Unmutes the microphone if it had been previously muted.

#### Returns

`Promise`

#### Permissions

- `room.self.audio_unmute`

You need to specify the permissions when [creating the Video Room
Token](https://developer.signalwire.com/apis/reference/create_room_token)
on the server side.

#### Example

```typescript
await roomdevice.audioUnmute()
```

#### Inherited from

`RoomScreenShareMethods.audioUnmute`

***

### emit()

> **emit**\<`E`\>(`event`, ...`args`): `void`

Defined in: [packages/core/src/types/index.ts:43](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L43)

**`Internal`**

#### Type Parameters

##### E

`E` *extends* `"room.left"` \| `MediaEventNames` \| [`BaseConnectionState`](../type-aliases/BaseConnectionState.md)

#### Parameters

##### event

`E`

##### args

...`ArgumentMap`\<`RoomSessionScreenShareEvents`\>\[`Extract`\<`E`, `"room.left"` \| `MediaEventNames` \| [`BaseConnectionState`](../type-aliases/BaseConnectionState.md)\>\]

#### Returns

`void`

#### Inherited from

`BaseConnectionContract.emit`

***

### hold()

> **hold**(): `Promise`\<`void`\>

Defined in: [packages/core/src/types/index.ts:221](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L221)

Hold the call.
It stops the self member's outbound video/audio and other member's inbound video/audio.

#### Returns

`Promise`\<`void`\>

A Promise that resolves once the hold state is acheived.

#### Example

```typescript
room.hold()
```

#### Inherited from

`BaseConnectionContract.hold`

***

### join()

> **join**(): `Promise`\<`void`\>

Defined in: [packages/client/src/RoomSessionScreenShare.ts:28](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/RoomSessionScreenShare.ts#L28)

#### Returns

`Promise`\<`void`\>

***

### leave()

> **leave**(): `Promise`\<`void`\>

Defined in: [packages/client/src/RoomSessionScreenShare.ts:29](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/RoomSessionScreenShare.ts#L29)

#### Returns

`Promise`\<`void`\>

***

### off()

> **off**\<`T`\>(`event`, `fn?`): [`EmitterContract`](EmitterContract.md)\<`RoomSessionScreenShareEvents`\>

Defined in: [packages/core/src/types/index.ts:33](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L33)

#### Type Parameters

##### T

`T` *extends* `"room.left"` \| `MediaEventNames` \| [`BaseConnectionState`](../type-aliases/BaseConnectionState.md)

#### Parameters

##### event

`T`

##### fn?

(...`args`) => `void`

#### Returns

[`EmitterContract`](EmitterContract.md)\<`RoomSessionScreenShareEvents`\>

#### Inherited from

`BaseConnectionContract.off`

***

### on()

> **on**\<`T`\>(`event`, `fn`): [`EmitterContract`](EmitterContract.md)\<`RoomSessionScreenShareEvents`\>

Defined in: [packages/core/src/types/index.ts:23](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L23)

#### Type Parameters

##### T

`T` *extends* `"room.left"` \| `MediaEventNames` \| [`BaseConnectionState`](../type-aliases/BaseConnectionState.md)

#### Parameters

##### event

`T`

##### fn

(...`args`) => `void`

#### Returns

[`EmitterContract`](EmitterContract.md)\<`RoomSessionScreenShareEvents`\>

#### Inherited from

`BaseConnectionContract.on`

***

### once()

> **once**\<`T`\>(`event`, `fn`): [`EmitterContract`](EmitterContract.md)\<`RoomSessionScreenShareEvents`\>

Defined in: [packages/core/src/types/index.ts:28](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L28)

#### Type Parameters

##### T

`T` *extends* `"room.left"` \| `MediaEventNames` \| [`BaseConnectionState`](../type-aliases/BaseConnectionState.md)

#### Parameters

##### event

`T`

##### fn

(...`args`) => `void`

#### Returns

[`EmitterContract`](EmitterContract.md)\<`RoomSessionScreenShareEvents`\>

#### Inherited from

`BaseConnectionContract.once`

***

### removeAllListeners()

> **removeAllListeners**\<`T`\>(`event?`): [`EmitterContract`](EmitterContract.md)\<`RoomSessionScreenShareEvents`\>

Defined in: [packages/core/src/types/index.ts:38](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L38)

#### Type Parameters

##### T

`T` *extends* `"room.left"` \| `MediaEventNames` \| [`BaseConnectionState`](../type-aliases/BaseConnectionState.md)

#### Parameters

##### event?

`T`

#### Returns

[`EmitterContract`](EmitterContract.md)\<`RoomSessionScreenShareEvents`\>

#### Inherited from

`BaseConnectionContract.removeAllListeners`

***

### restoreOutboundAudio()

> **restoreOutboundAudio**(): `void`

Defined in: [packages/core/src/types/index.ts:239](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L239)

**`Internal`**

#### Returns

`void`

#### Inherited from

`BaseConnectionContract.restoreOutboundAudio`

***

### restoreOutboundVideo()

> **restoreOutboundVideo**(): `void`

Defined in: [packages/core/src/types/index.ts:243](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L243)

**`Internal`**

#### Returns

`void`

#### Inherited from

`BaseConnectionContract.restoreOutboundVideo`

***

### sendDigits()

> **sendDigits**(`dtmf`): `Promise`\<`void`\>

Defined in: [packages/core/src/types/index.ts:163](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L163)

Send DTMF

#### Parameters

##### dtmf

`string`

#### Returns

`Promise`\<`void`\>

#### Example

```typescript
room.sendDigits('1')
```

#### Inherited from

`BaseConnectionContract.sendDigits`

***

### setAudioDirection()

> **setAudioDirection**(`direction`): `Promise`\<`void`\>

Defined in: [packages/core/src/types/index.ts:193](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L193)

Add or update the audio with requested direction.
It perform RTC Peer renegotiation.

#### Parameters

##### direction

`UpdateMediaDirection`

#### Returns

`Promise`\<`void`\>

A Promise that resolves once the requested audio is negotiated or failed.

#### Example

```typescript
room.setAudioDirection('sendrecv')
```

#### Inherited from

`BaseConnectionContract.setAudioDirection`

***

### setInputSensitivity()

> **setInputSensitivity**(`params`): `Promise`

Defined in: [packages/client/src/utils/interfaces/video.ts:317](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/video.ts#L317)

Sets the input level at which the participant is identified as currently
speaking.

#### Parameters

##### params

###### value

`number`

desired sensitivity. The default value is 30 and the
scale goes from 0 (lowest sensitivity, essentially muted) to 100 (highest
sensitivity).

#### Returns

`Promise`

#### Permissions

- `room.self.set_input_sensitivity`

You need to specify the permissions when [creating the Video Room
Token](https://developer.signalwire.com/apis/reference/create_room_token)
on the server side.

#### Example

```typescript
await roomdevice.setInputSensitivity({value: 80})
```

#### Inherited from

`RoomScreenShareMethods.setInputSensitivity`

***

### setInputVolume()

> **setInputVolume**(`params`): `Promise`

Defined in: [packages/client/src/utils/interfaces/video.ts:295](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/video.ts#L295)

Sets the input volume level (e.g. for the microphone).

#### Parameters

##### params

###### volume

`number`

desired volume. Values range from -50 to 50, with a
default of 0.

#### Returns

`Promise`

#### Permissions

- `room.self.set_input_volume`

You need to specify the permissions when [creating the Video Room
Token](https://developer.signalwire.com/apis/reference/create_room_token)
on the server side.

#### Example

```typescript
await roomdevice.setMicrophoneVolume({volume: -10})
```

#### Inherited from

`RoomScreenShareMethods.setInputVolume`

***

### setLocalStream()

> **setLocalStream**(`stream`): `Promise`\<`MediaStream`\>

Defined in: [packages/core/src/types/index.ts:152](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L152)

Replaces the current local media stream with the one coming from the user.

#### Parameters

##### stream

`MediaStream`

Specify the media stream that the device should use.
See
[MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream).

#### Returns

`Promise`\<`MediaStream`\>

#### Example

```typescript
room.setLocalStream(new MediaStream)
```

#### Inherited from

`BaseConnectionContract.setLocalStream`

***

### ~~setMicrophoneVolume()~~

> **setMicrophoneVolume**(`params`): `Promise`

Defined in: [packages/client/src/utils/interfaces/video.ts:275](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/video.ts#L275)

#### Parameters

##### params

###### volume

`number`

#### Returns

`Promise`

#### Deprecated

Use [setInputVolume](#setinputvolume) instead.

#### Inherited from

`RoomScreenShareMethods.setMicrophoneVolume`

***

### setVideoDirection()

> **setVideoDirection**(`direction`): `Promise`\<`void`\>

Defined in: [packages/core/src/types/index.ts:208](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L208)

Add or update the video with requested direction.
It perform RTC Peer renegotiation.

#### Parameters

##### direction

`UpdateMediaDirection`

#### Returns

`Promise`\<`void`\>

A Promise that resolves once the requested video is negotiated or failed.

#### Example

```typescript
room.setVideoDirection('recvonly')
```

#### Inherited from

`BaseConnectionContract.setVideoDirection`

***

### stopOutboundAudio()

> **stopOutboundAudio**(): `void`

Defined in: [packages/core/src/types/index.ts:237](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L237)

**`Internal`**

#### Returns

`void`

#### Inherited from

`BaseConnectionContract.stopOutboundAudio`

***

### stopOutboundVideo()

> **stopOutboundVideo**(): `void`

Defined in: [packages/core/src/types/index.ts:241](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L241)

**`Internal`**

#### Returns

`void`

#### Inherited from

`BaseConnectionContract.stopOutboundVideo`

***

### unhold()

> **unhold**(): `Promise`\<`void`\>

Defined in: [packages/core/src/types/index.ts:234](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L234)

Unhold the call.
It resumes the self member's outbound video/audio and other member's inbound video/audio.

#### Returns

`Promise`\<`void`\>

A Promise that resolves once the active call state is acheived.

#### Example

```typescript
room.unhold()
```

#### Inherited from

`BaseConnectionContract.unhold`

***

### updateCamera()

> **updateCamera**(`constraints`): `Promise`\<`void`\>

Defined in: [packages/core/src/types/index.ts:125](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L125)

Replaces the current camera stream with the one coming from a different
device.

#### Parameters

##### constraints

`MediaTrackConstraints`

Specify the constraints that the device should satisfy. MediaTrackConstraints
See
[MediaTrackConstraints](https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints).

#### Returns

`Promise`\<`void`\>

#### Example

```typescript
await room.updateCamera({deviceId: "/o4ZeWzroh+8q0Ds/CFfmn9XpqaHzmW3L/5ZBC22CRg="})
```

#### Inherited from

`BaseConnectionContract.updateCamera`

***

### updateMedia()

> **updateMedia**(`params`): `Promise`\<`void`\>

Defined in: [packages/core/src/types/index.ts:178](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L178)

Upgrade or downgrade the media in the WebRTC connection.
It perform RTC Peer renegotiation.

#### Parameters

##### params

`UpdateMediaParams`

UpdateMediaParams

#### Returns

`Promise`\<`void`\>

A Promise that resolves once the requested media is negotiated or failed.

#### Example

```typescript
room.updateMedia({ video: { direction: 'sendrecv' } })
```

#### Inherited from

`BaseConnectionContract.updateMedia`

***

### updateMicrophone()

> **updateMicrophone**(`constraints`): `Promise`\<`void`\>

Defined in: [packages/core/src/types/index.ts:139](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L139)

Replaces the current microphone stream with the one coming from a different
device.

#### Parameters

##### constraints

`MediaTrackConstraints`

Specify the constraints that the device should satisfy. MediaTrackConstraints
See
[MediaTrackConstraints](https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints).

#### Returns

`Promise`\<`void`\>

#### Example

the specified deviceId:
```typescript
await room.updateMicrophone({deviceId: "/o4ZeWzroh+8q0Ds/CFfmn9XpqaHzmW3L/5ZBC22CRg="})
```

#### Inherited from

`BaseConnectionContract.updateMicrophone`

***

### videoMute()

> **videoMute**(): `Promise`

Defined in: [packages/client/src/utils/interfaces/video.ts:252](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/video.ts#L252)

Puts the video on mute. Participants will see a mute image instead of the
video stream.

#### Returns

`Promise`

#### Permissions

- `room.self.video_mute`

You need to specify the permissions when [creating the Video Room
Token](https://developer.signalwire.com/apis/reference/create_room_token)
on the server side.

#### Example

```typescript
await roomdevice.videoMute()
```

#### Inherited from

`RoomScreenShareMethods.videoMute`

***

### videoUnmute()

> **videoUnmute**(): `Promise`

Defined in: [packages/client/src/utils/interfaces/video.ts:270](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/video.ts#L270)

Unmutes the video if it had been previously muted. Participants will start
seeing the video stream again.

#### Returns

`Promise`

#### Permissions

- `room.self.video_unmute`

You need to specify the permissions when [creating the Video Room
Token](https://developer.signalwire.com/apis/reference/create_room_token)
on the server side.

#### Example

```typescript
await roomdevice.videoUnmute()
```

#### Inherited from

`RoomScreenShareMethods.videoUnmute`
