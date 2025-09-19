Defined in: [packages/client/src/unified/CallSession.ts:37](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/CallSession.ts#L37)

## Extends

- `CallSessionContract`.`CallSessionMethods`.`BaseRoomSessionContract`.`BaseConnectionContract`\<[`CallSessionEvents`](../type-aliases/CallSessionEvents.md)\>.`BaseComponentContract`

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

### currentLayout

> **currentLayout**: [`InternalVideoLayout`](../type-aliases/InternalVideoLayout.md)

Defined in: [packages/client/src/utils/interfaces/fabric.ts:210](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/fabric.ts#L210)

The layout returned from the `layout.changed` event based on the current room layout

#### Inherited from

`CallSessionContract.currentLayout`

***

### currentLayoutEvent

> **currentLayoutEvent**: [`CallLayoutChangedEventParams`](CallLayoutChangedEventParams.md)

Defined in: [packages/client/src/utils/interfaces/fabric.ts:208](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/fabric.ts#L208)

The `layout.changed` event based on the current room layout

#### Inherited from

`CallSessionContract.currentLayoutEvent`

***

### currentPosition

> **currentPosition**: `undefined` \| [`VideoPosition`](../type-aliases/VideoPosition.md)

Defined in: [packages/client/src/utils/interfaces/fabric.ts:212](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/fabric.ts#L212)

The current position of the member returned from the `layout.changed` event

#### Inherited from

`CallSessionContract.currentPosition`

***

### getMemberOverlay()

> **getMemberOverlay**: (`memberId`) => `undefined` \| [`UserOverlay`](../classes/UserOverlay.md)

Defined in: [packages/client/src/utils/interfaces/base.ts:25](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/base.ts#L25)

Return the member overlay on top of the root element

#### Parameters

##### memberId

`string`

#### Returns

`undefined` \| [`UserOverlay`](../classes/UserOverlay.md)

#### Inherited from

`BaseRoomSessionContract.getMemberOverlay`

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

### localVideoOverlay

> **localVideoOverlay**: `undefined` \| [`LocalVideoOverlay`](../classes/LocalVideoOverlay.md)

Defined in: [packages/client/src/utils/interfaces/base.ts:13](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/base.ts#L13)

Local video overlay object that the SDK injects in the DOM element inside the MCU

#### Inherited from

`BaseRoomSessionContract.localVideoOverlay`

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

### overlayMap

> **overlayMap**: `undefined` \| [`OverlayMap`](../type-aliases/OverlayMap.md)

Defined in: [packages/client/src/utils/interfaces/base.ts:9](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/base.ts#L9)

A JS Map containing all the layers on top of the Root Element

#### Inherited from

`BaseRoomSessionContract.overlayMap`

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

### screenShareList

> **screenShareList**: [`RoomSessionScreenShare`](RoomSessionScreenShare.md)[]

Defined in: [packages/client/src/utils/interfaces/base.ts:17](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/base.ts#L17)

List of screen share objects

#### Inherited from

`BaseRoomSessionContract.screenShareList`

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

### answer()

> **answer**(): `Promise`\<`void`\>

Defined in: [packages/client/src/utils/interfaces/fabric.ts:231](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/fabric.ts#L231)

Answers the incoming call and starts the WebRTC connection

@example:
```typescript
await call.answer()
```

#### Returns

`Promise`\<`void`\>

#### Inherited from

`CallSessionContract.answer`

***

### audioMute()

> **audioMute**(`params?`): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:135](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L135)

Puts the microphone on mute. The other participants will not hear audio
from the muted participant anymore. You can use this method to mute
either yourself or another participant in the room.

#### Parameters

##### params?

`MemberCommandParams`

#### Returns

`Promise`

#### Capabilities

- `room.self.audio_mute`: to mute a local device
 - `room.member.audio_mute`: to mute a remote member

#### Examples

```typescript
await room.audioMute()
```

```typescript
const id = 'de550c0c-3fac-4efd-b06f-b5b8614b8966'  // you can get this from getMembers()
await room.audioMute({memberId: id})
```

#### Inherited from

`CallSessionMethods.audioMute`

***

### audioUnmute()

> **audioUnmute**(`params?`): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:158](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L158)

Unmutes the microphone if it had been previously muted. You can use this
method to unmute either yourself or another participant in the room.

#### Parameters

##### params?

`MemberCommandParams`

#### Returns

`Promise`

#### Capabilities

- `room.self.audio_unmute`: to unmute a local device
 - `room.member.audio_unmute`: to unmute a remote member

#### Examples

```typescript
await room.audioUnmute()
```

```typescript
const id = 'de550c0c-3fac-4efd-b06f-b5b8614b8966'  // you can get this from getMembers()
await room.audioUnmute({memberId: id})
```

#### Inherited from

`CallSessionMethods.audioUnmute`

***

### deaf()

> **deaf**(`params?`): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:304](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L304)

Mutes the incoming audio. The affected participant will not hear audio
from the other participants anymore. You can use this method to make deaf
either yourself or another participant in the room.

Note that in addition to making a participant deaf, this will also
automatically mute the microphone of the target participant (even if
there is no `audio_mute` permission). If you want, you can then manually
unmute it by calling [audioUnmute](#audiounmute).

#### Parameters

##### params?

`MemberCommandParams`

#### Returns

`Promise`

#### Capabilities

- `room.self.deaf`: to make yourself deaf
 - `room.member.deaf`: to make deaf a remote member

#### Examples

```typescript
await room.deaf()
```

```typescript
const id = 'de550c0c-3fac-4efd-b06f-b5b8614b8966'  // you can get this from getMembers()
await room.deaf({memberId: id})
```

#### Inherited from

`CallSessionMethods.deaf`

***

### destroy()

> **destroy**(): `void`

Defined in: [packages/core/src/types/index.ts:54](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L54)

This only destroys the JavaScript object: it has no
effect on the server-side room.

#### Returns

`void`

#### Inherited from

`BaseComponentContract.destroy`

***

### emit()

> **emit**\<`E`\>(`event`, ...`args`): `void`

Defined in: [packages/core/src/types/index.ts:43](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L43)

**`Internal`**

#### Type Parameters

##### E

`E` *extends* `VideoRoomDeviceUpdatedEventNames` \| `VideoRoomDeviceDisconnectedEventNames` \| `"layout.changed"` \| `"member.joined"` \| `"member.left"` \| `"member.updated"` \| `"member.updated.visible"` \| `"member.updated.deaf"` \| `"member.updated.audioMuted"` \| `"member.updated.videoMuted"` \| `"member.updated.inputVolume"` \| `"member.updated.outputVolume"` \| `"member.updated.inputSensitivity"` \| `"member.talking"` \| `"memberList.updated"` \| `"room.subscribed"` \| `"room.updated"` \| `"room.joined"` \| `"room.left"` \| `MediaEventNames` \| `"track"` \| [`BaseConnectionState`](../type-aliases/BaseConnectionState.md) \| `"call.joined"` \| `"call.updated"` \| `"call.left"` \| `"call.state"` \| `"call.play"` \| `"call.connect"` \| `"call.room"` \| `"member.updated.handraised"` \| `"member.updated.echoCancellation"` \| `"member.updated.autoGain"` \| `"member.updated.noiseSuppression"`

#### Parameters

##### event

`E`

##### args

...`ArgumentMap`\<[`CallSessionEvents`](../type-aliases/CallSessionEvents.md)\>\[`Extract`\<`E`, `VideoRoomDeviceUpdatedEventNames` \| `VideoRoomDeviceDisconnectedEventNames` \| `"layout.changed"` \| `"member.joined"` \| `"member.left"` \| `"member.updated"` \| `"member.updated.visible"` \| `"member.updated.deaf"` \| `"member.updated.audioMuted"` \| `"member.updated.videoMuted"` \| `"member.updated.inputVolume"` \| `"member.updated.outputVolume"` \| `"member.updated.inputSensitivity"` \| `"member.talking"` \| `"memberList.updated"` \| `"room.subscribed"` \| `"room.updated"` \| `"room.joined"` \| `"room.left"` \| `MediaEventNames` \| `"track"` \| [`BaseConnectionState`](../type-aliases/BaseConnectionState.md) \| `"call.joined"` \| `"call.updated"` \| `"call.left"` \| `"call.state"` \| `"call.play"` \| `"call.connect"` \| `"call.room"` \| `"member.updated.handraised"` \| `"member.updated.echoCancellation"` \| `"member.updated.autoGain"` \| `"member.updated.noiseSuppression"`\>\]

#### Returns

`void`

#### Inherited from

`BaseConnectionContract.emit`

***

### end()

> **end**(`params?`): `Promise`\<`void`\>

Defined in: [packages/core/src/types/fabricRoomSession.ts:517](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L517)

Ends call for a specific participant or yourself.

#### Parameters

##### params?

`MemberCommandParams`

#### Returns

`Promise`\<`void`\>

#### Capabilities

- `end`: to end a call (your own or another member's)

#### Examples

```typescript
await room.end();
```

```typescript
const id = 'de550c0c-3fac-4efd-b06f-b5b8614b8966'; // you can get this from getMembers()
await room.end({ memberId: id });
```

#### Inherited from

`CallSessionMethods.end`

***

### getLayouts()

> **getLayouts**(): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:390](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L390)

Returns a list of available layouts for the room. To set a room layout,
use [setLayout](#setlayout).

#### Returns

`Promise`

#### Capabilities

- `room.list_available_layouts`

#### Example

```typescript
await room.getLayouts()
```

#### Inherited from

`CallSessionMethods.getLayouts`

***

### getMembers()

> **getMembers**(): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:275](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L275)

Returns a list of members currently in the room.

#### Returns

`Promise`

#### Example

```typescript
await room.getMembers()
```

#### Inherited from

`CallSessionMethods.getMembers`

***

### hangup()

> **hangup**(`id?`): `Promise`\<`void`\>

Defined in: [packages/client/src/utils/interfaces/fabric.ts:241](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/fabric.ts#L241)

Hangs up the current call and disconnects the WebRTC connection.
If an RTC Peer ID is passed, the method will only disconnect that Peer, otherwise all Peers will be destroyed

@example:
```typescript
await call.hangup()
```

#### Parameters

##### id?

`string`

#### Returns

`Promise`\<`void`\>

#### Inherited from

`CallSessionContract.hangup`

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

### leave()

> **leave**(): `Promise`\<`void`\>

Defined in: [packages/client/src/utils/interfaces/base.ts:21](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/base.ts#L21)

Leaves the room. This detaches all the locally originating streams from the room.

#### Returns

`Promise`\<`void`\>

#### Inherited from

`BaseRoomSessionContract.leave`

***

### lock()

> **lock**(): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:433](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L433)

Lock the room

#### Returns

`Promise`

#### Capabilities

- `room.lock`

#### Example

```typescript
await room.lock()
```

#### Inherited from

`CallSessionMethods.lock`

***

### off()

> **off**\<`T`\>(`event`, `fn?`): [`EmitterContract`](EmitterContract.md)\<[`CallSessionEvents`](../type-aliases/CallSessionEvents.md)\>

Defined in: [packages/core/src/types/index.ts:33](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L33)

#### Type Parameters

##### T

`T` *extends* `VideoRoomDeviceUpdatedEventNames` \| `VideoRoomDeviceDisconnectedEventNames` \| `"layout.changed"` \| `"member.joined"` \| `"member.left"` \| `"member.updated"` \| `"member.updated.visible"` \| `"member.updated.deaf"` \| `"member.updated.audioMuted"` \| `"member.updated.videoMuted"` \| `"member.updated.inputVolume"` \| `"member.updated.outputVolume"` \| `"member.updated.inputSensitivity"` \| `"member.talking"` \| `"memberList.updated"` \| `"room.subscribed"` \| `"room.updated"` \| `"room.joined"` \| `"room.left"` \| `MediaEventNames` \| `"track"` \| [`BaseConnectionState`](../type-aliases/BaseConnectionState.md) \| `"call.joined"` \| `"call.updated"` \| `"call.left"` \| `"call.state"` \| `"call.play"` \| `"call.connect"` \| `"call.room"` \| `"member.updated.handraised"` \| `"member.updated.echoCancellation"` \| `"member.updated.autoGain"` \| `"member.updated.noiseSuppression"`

#### Parameters

##### event

`T`

##### fn?

(...`args`) => `void`

#### Returns

[`EmitterContract`](EmitterContract.md)\<[`CallSessionEvents`](../type-aliases/CallSessionEvents.md)\>

#### Inherited from

`BaseConnectionContract.off`

***

### on()

> **on**\<`T`\>(`event`, `fn`): [`EmitterContract`](EmitterContract.md)\<[`CallSessionEvents`](../type-aliases/CallSessionEvents.md)\>

Defined in: [packages/core/src/types/index.ts:23](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L23)

#### Type Parameters

##### T

`T` *extends* `VideoRoomDeviceUpdatedEventNames` \| `VideoRoomDeviceDisconnectedEventNames` \| `"layout.changed"` \| `"member.joined"` \| `"member.left"` \| `"member.updated"` \| `"member.updated.visible"` \| `"member.updated.deaf"` \| `"member.updated.audioMuted"` \| `"member.updated.videoMuted"` \| `"member.updated.inputVolume"` \| `"member.updated.outputVolume"` \| `"member.updated.inputSensitivity"` \| `"member.talking"` \| `"memberList.updated"` \| `"room.subscribed"` \| `"room.updated"` \| `"room.joined"` \| `"room.left"` \| `MediaEventNames` \| `"track"` \| [`BaseConnectionState`](../type-aliases/BaseConnectionState.md) \| `"call.joined"` \| `"call.updated"` \| `"call.left"` \| `"call.state"` \| `"call.play"` \| `"call.connect"` \| `"call.room"` \| `"member.updated.handraised"` \| `"member.updated.echoCancellation"` \| `"member.updated.autoGain"` \| `"member.updated.noiseSuppression"`

#### Parameters

##### event

`T`

##### fn

(...`args`) => `void`

#### Returns

[`EmitterContract`](EmitterContract.md)\<[`CallSessionEvents`](../type-aliases/CallSessionEvents.md)\>

#### Inherited from

`BaseConnectionContract.on`

***

### once()

> **once**\<`T`\>(`event`, `fn`): [`EmitterContract`](EmitterContract.md)\<[`CallSessionEvents`](../type-aliases/CallSessionEvents.md)\>

Defined in: [packages/core/src/types/index.ts:28](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L28)

#### Type Parameters

##### T

`T` *extends* `VideoRoomDeviceUpdatedEventNames` \| `VideoRoomDeviceDisconnectedEventNames` \| `"layout.changed"` \| `"member.joined"` \| `"member.left"` \| `"member.updated"` \| `"member.updated.visible"` \| `"member.updated.deaf"` \| `"member.updated.audioMuted"` \| `"member.updated.videoMuted"` \| `"member.updated.inputVolume"` \| `"member.updated.outputVolume"` \| `"member.updated.inputSensitivity"` \| `"member.talking"` \| `"memberList.updated"` \| `"room.subscribed"` \| `"room.updated"` \| `"room.joined"` \| `"room.left"` \| `MediaEventNames` \| `"track"` \| [`BaseConnectionState`](../type-aliases/BaseConnectionState.md) \| `"call.joined"` \| `"call.updated"` \| `"call.left"` \| `"call.state"` \| `"call.play"` \| `"call.connect"` \| `"call.room"` \| `"member.updated.handraised"` \| `"member.updated.echoCancellation"` \| `"member.updated.autoGain"` \| `"member.updated.noiseSuppression"`

#### Parameters

##### event

`T`

##### fn

(...`args`) => `void`

#### Returns

[`EmitterContract`](EmitterContract.md)\<[`CallSessionEvents`](../type-aliases/CallSessionEvents.md)\>

#### Inherited from

`BaseConnectionContract.once`

***

### removeAllListeners()

> **removeAllListeners**\<`T`\>(`event?`): [`EmitterContract`](EmitterContract.md)\<[`CallSessionEvents`](../type-aliases/CallSessionEvents.md)\>

Defined in: [packages/core/src/types/index.ts:38](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/index.ts#L38)

#### Type Parameters

##### T

`T` *extends* `VideoRoomDeviceUpdatedEventNames` \| `VideoRoomDeviceDisconnectedEventNames` \| `"layout.changed"` \| `"member.joined"` \| `"member.left"` \| `"member.updated"` \| `"member.updated.visible"` \| `"member.updated.deaf"` \| `"member.updated.audioMuted"` \| `"member.updated.videoMuted"` \| `"member.updated.inputVolume"` \| `"member.updated.outputVolume"` \| `"member.updated.inputSensitivity"` \| `"member.talking"` \| `"memberList.updated"` \| `"room.subscribed"` \| `"room.updated"` \| `"room.joined"` \| `"room.left"` \| `MediaEventNames` \| `"track"` \| [`BaseConnectionState`](../type-aliases/BaseConnectionState.md) \| `"call.joined"` \| `"call.updated"` \| `"call.left"` \| `"call.state"` \| `"call.play"` \| `"call.connect"` \| `"call.room"` \| `"member.updated.handraised"` \| `"member.updated.echoCancellation"` \| `"member.updated.autoGain"` \| `"member.updated.noiseSuppression"`

#### Parameters

##### event?

`T`

#### Returns

[`EmitterContract`](EmitterContract.md)\<[`CallSessionEvents`](../type-aliases/CallSessionEvents.md)\>

#### Inherited from

`BaseConnectionContract.removeAllListeners`

***

### removeMember()

> **removeMember**(`params`): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:377](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L377)

Removes a specific participant from the room.

#### Parameters

##### params

`Required`\<`MemberCommandParams`\>

#### Returns

`Promise`

#### Capabilities

- `room.member.remove`: to remove a remote member

#### Example

```typescript
const id = 'de550c0c-3fac-4efd-b06f-b5b8614b8966'  // you can get this from getMembers()
await room.removeMember({memberId: id})
```

#### Inherited from

`CallSessionMethods.removeMember`

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

### setAudioFlags()

> **setAudioFlags**(`params`): `Promise`\<`void`\>

Defined in: [packages/core/src/types/fabricRoomSession.ts:496](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L496)

Update audio processing flags (echo cancellation, automatic gain control, noise suppression)
for yourself or another participant in the room.

#### Parameters

##### params

[`SetAudioFlagsParams`](../type-aliases/SetAudioFlagsParams.md)

#### Returns

`Promise`\<`void`\>

#### Capabilities

- `self.audioflags.set` – required to modify your own microphone constraints
- `member.audioflags.set` – required to modify another member’s microphone constraints

#### Example

```typescript
// Enable echo cancellation and noise suppression for yourself
await room.setAudioFlags({
  echoCancellation: true,
  autoGain: false,
  noiseSuppression: true
});

// Disable automatic gain control for another participant
const otherId = 'de550c0c-3fac-4efd-b06f-b5b8614b8966';
await room.setAudioFlags({
  memberId: otherId,
  autoGain: false
});
```

#### Inherited from

`CallSessionMethods.setAudioFlags`

***

### setInputSensitivity()

> **setInputSensitivity**(`params`): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:264](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L264)

Sets the input level at which the participant is identified as currently
speaking. You can use this method to set the input sensitivity for either
yourself or another participant in the room.

#### Parameters

##### params

`MemberCommandWithValueParams`

#### Returns

`Promise`

#### Capabilities

- `room.self.set_input_sensitivity`: to set the sensitivity for a local
   device
 - `room.member.set_input_sensitivity`: to set the sensitivity for a
   remote member

#### Examples

```typescript
await room.setInputSensitivity({value: 80})
```

```typescript
const id = 'de550c0c-3fac-4efd-b06f-b5b8614b8966'  // you can get this from getMembers()
await room.setInputSensitivity({memberId: id, value: 80})
```

#### Inherited from

`CallSessionMethods.setInputSensitivity`

***

### setInputVolume()

> **setInputVolume**(`params`): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:233](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L233)

Sets the input volume level (e.g. for the microphone). You can use this
method to set the input volume for either yourself or another participant
in the room.

#### Parameters

##### params

`MemberCommandWithVolumeParams`

#### Returns

`Promise`

#### Capabilities

- `room.self.set_input_volume`: to set the volume for a local device
 - `room.member.set_input_volume`: to set the volume for a remote member

#### Examples

```typescript
await room.setInputVolume({volume: -10})
```

```typescript
const id = 'de550c0c-3fac-4efd-b06f-b5b8614b8966'  // you can get this from getMembers()
await room.setInputVolume({memberId: id, volume: -10})
```

#### Inherited from

`CallSessionMethods.setInputVolume`

***

### setLayout()

> **setLayout**(`params`): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:404](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L404)

Sets a layout for the room. You can obtain a list of available layouts
with [getLayouts](#getlayouts).

#### Parameters

##### params

`SetLayoutParams`

#### Returns

`Promise`

#### Capabilities

- `room.set_layout`
 - `room.set_position` (if you need to assign positions)

#### Example

```typescript
await room.setLayout({name: "6x6"})
```

#### Inherited from

`CallSessionMethods.setLayout`

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

### setOutputVolume()

> **setOutputVolume**(`params`): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:360](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L360)

Sets the output volume level (e.g., for the speaker). You can use this
method to set the output volume for either yourself or another participant
in the room.

#### Parameters

##### params

`MemberCommandWithVolumeParams`

#### Returns

`Promise`

#### Capabilities

- `room.self.set_output_volume`: to set the speaker volume for yourself
 - `room.member.set_output_volume`: to set the speaker volume for a remote
   member

#### Examples

```typescript
await room.setOutputVolume({volume: -10})
```

```typescript
const id = 'de550c0c-3fac-4efd-b06f-b5b8614b8966'  // you can get this from getMembers()
await room.setOutputVolume({memberId: id, volume: -10})
```

#### Inherited from

`CallSessionMethods.setOutputVolume`

***

### setPositions()

> **setPositions**(`params`): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:421](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L421)

Assigns a position in the layout for multiple members.

#### Parameters

##### params

`SetPositionsParams`

#### Returns

`Promise`

#### Capabilities

- `room.set_position`

#### Example

```js
await roomSession.setPositions({
  positions: {
    "1bf4d4fb-a3e4-4d46-80a8-3ebfdceb2a60": "reserved-1",
    "e0c5be44-d6c7-438f-8cda-f859a1a0b1e7": "auto"
  }
})
```

#### Inherited from

`CallSessionMethods.setPositions`

***

### setRaisedHand()

> **setRaisedHand**(`params?`): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:464](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L464)

Raise or lower the hand of a specific participant in the room.

#### Parameters

##### params?

`SetRaisedHandRoomParams`

#### Returns

`Promise`

#### Capabilities

- `video.self.raisehand` - required to raise a hand
 - `video.self.lowerhand` - required to lower a hand
 - `video.member.raisehand` - required to raise a hand for another member’s
 - `video.member.lowerhand` - required to lower a hand for another member’s

#### Example

```typescript
const id = 'de550c0c-3fac-4efd-b06f-b5b8614b8966'  // you can get this from getMembers()
await room.setHandRaised({ memberId: id, raised: false })
```

#### Inherited from

`CallSessionMethods.setRaisedHand`

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

### start()

> **start**(): `Promise`\<`void`\>

Defined in: [packages/client/src/utils/interfaces/fabric.ts:222](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/fabric.ts#L222)

Starts the call via the WebRTC connection
Based on the the remote SDP, it will either send `verto.invite` or `verto.answer` to start the call.

@example:
```typescript
await call.start()
```

#### Returns

`Promise`\<`void`\>

#### Inherited from

`CallSessionContract.start`

***

### startScreenShare()

> **startScreenShare**(`opts?`): `Promise`\<[`RoomSessionScreenShare`](RoomSessionScreenShare.md)\>

Defined in: [packages/client/src/utils/interfaces/base.ts:37](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/base.ts#L37)

Adds a screen sharing instance to the room. You can create multiple screen
sharing instances and add all of them to the room.

#### Parameters

##### opts?

[`StartScreenShareOptions`](../type-aliases/StartScreenShareOptions.md)

[StartScreenShareOptions](../type-aliases/StartScreenShareOptions.md)

#### Returns

`Promise`\<[`RoomSessionScreenShare`](RoomSessionScreenShare.md)\>

- [RoomSessionScreenShare](RoomSessionScreenShare.md)

#### Example

```js
await roomSession.startScreenShare({ audio: true, video: true })
```

#### Inherited from

`BaseRoomSessionContract.startScreenShare`

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

### undeaf()

> **undeaf**(`params?`): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:333](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L333)

Unmutes the incoming audio. The affected participant will start hearing
audio from the other participants again. You can use this method to
undeaf either yourself or another participant in the room.

Note that in addition to allowing a participants to hear the others, this
will also automatically unmute the microphone of the target participant
(even if there is no `audio_unmute` permission). If you want, you can then
manually mute it by calling [audioMute](#audiomute).

#### Parameters

##### params?

`MemberCommandParams`

#### Returns

`Promise`

#### Capabilities

- `room.self.deaf`: to make yourself deaf
 - `room.member.deaf`: to make deaf a remote member

#### Examples

```typescript
await room.undeaf()
```

```typescript
const id = 'de550c0c-3fac-4efd-b06f-b5b8614b8966'  // you can get this from getMembers()
await room.undeaf({memberId: id})
```

#### Inherited from

`CallSessionMethods.undeaf`

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

### unlock()

> **unlock**(): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:445](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L445)

Unlock the room

#### Returns

`Promise`

#### Capabilities

- `room.unlock`

#### Example

```typescript
await room.lock()
```

#### Inherited from

`CallSessionMethods.unlock`

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

### updateSpeaker()

> **updateSpeaker**(`opts`): `Promise`\<`undefined`\>

Defined in: [packages/client/src/utils/interfaces/base.ts:54](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/utils/interfaces/base.ts#L54)

Replaces the current speaker with a different one.

> 📘
> Some browsers do not support output device selection. You can check by calling [WebRTC.supportsMediaOutput](../SignalWire-JS-SDK-Documentation/namespaces/WebRTC/functions/supportsMediaOutput.md).

#### Parameters

##### opts

###### deviceId

`string`

id of the new speaker device

#### Returns

`Promise`\<`undefined`\>

#### Example

```typescript
await room.updateSpeaker({deviceId: "/o4ZeWzroh+8q0Ds/CFfmn9XpqaHzmW3L/5ZBC22CRg="})
```

#### Inherited from

`BaseRoomSessionContract.updateSpeaker`

***

### videoMute()

> **videoMute**(`params?`): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:182](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L182)

Puts the video on mute. Participants will see a mute image instead of the
video stream. You can use this method to mute either yourself or another
participant in the room.

#### Parameters

##### params?

`MemberCommandParams`

#### Returns

`Promise`

#### Capabilities

- `room.self.video_mute`: to unmute a local device
 - `room.member.video_mute`: to unmute a remote member

#### Examples

```typescript
await room.videoMute()
```

```typescript
const id = 'de550c0c-3fac-4efd-b06f-b5b8614b8966'  // you can get this from getMembers()
await room.videoMute({memberId: id})
```

#### Inherited from

`CallSessionMethods.videoMute`

***

### videoUnmute()

> **videoUnmute**(`params?`): `Promise`

Defined in: [packages/core/src/types/fabricRoomSession.ts:206](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/fabricRoomSession.ts#L206)

Unmutes the video if it had been previously muted. Participants will
start seeing the video stream again. You can use this method to unmute
either yourself or another participant in the room.

#### Parameters

##### params?

`MemberCommandParams`

#### Returns

`Promise`

#### Capabilities

- `room.self.video_mute`: to unmute a local device
 - `room.member.video_mute`: to unmute a remote member

#### Examples

```typescript
await room.videoUnmute()
```

```typescript
const id = 'de550c0c-3fac-4efd-b06f-b5b8614b8966'  // you can get this from getMembers()
await room.videoUnmute({memberId: id})
```

#### Inherited from

`CallSessionMethods.videoUnmute`
