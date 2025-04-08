---
title: "RoomSessionDevice"
sidebar_position: 100
---

A RoomSessionDevice represents a device (such as a microphone or a camera) that is at some point in its lifetime part of a [RoomSession](./video-roomsession.mdx). You can obtain a RoomSessionDevice from the [RoomSession](./video-roomsession.mdx) methods [RoomSession.addCamera](./video-roomsession.mdx#addcamera), [RoomSession.addMicrophone](./video-roomsession.mdx#addmicrophone), and [RoomSession.addDevice](./video-roomsession.mdx#adddevice).

## Properties

### active

• `Readonly` **active**: `boolean`

Whether the connection is currently active.

---

### cameraId

• `Readonly` **cameraId**: `null` \| `string`

The id of the video device, or null if not available.

---

### cameraLabel

• `Readonly` **cameraLabel**: `null` \| `string`

The label of the video device, or null if not available.

---

### localAudioTrack

• `Readonly` **localAudioTrack**: `null` \| `MediaStreamTrack`

Provides access to the local audio [MediaStreamTrack](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack).

---

### localStream

• `Readonly` **localStream**: `undefined` \| `MediaStream`

Provides access to the local [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream).

---

### localVideoTrack

• `Readonly` **localVideoTrack**: `null` \| `MediaStreamTrack`

Provides access to the local video [MediaStreamTrack](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack).

---

### memberId

• `Readonly` **memberId**: `string`

The id of the current member within the room.

---

### microphoneId

• `Readonly` **microphoneId**: `null` \| `string`

The id of the audio input device, or null if not available.

---

### microphoneLabel

• `Readonly` **microphoneLabel**: `null` \| `string`

The label of the audio input device, or null if not available.

---

### remoteStream

• `Readonly` **remoteStream**: `undefined` \| `MediaStream`

Provides access to the remote [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream).

---

### roomId

• `Readonly` **roomId**: `string`

The unique identifier for the room.

---

### roomSessionId

• `Readonly` **roomSessionId**: `string`

The unique identifier for the room session.

## Methods

### audioMute

▸ **audioMute**(): `Promise<void>`

Puts the microphone on mute. The other participants will not hear audio from the muted device anymore.

#### Returns

`Promise<void>`

#### Permissions

- `room.self.audio_mute`

You need to specify the permissions when [creating the Video Room Token](/rest/signalwire-rest/endpoints/video/create-room-token) on the server side.

#### Example

Muting the microphone:

```javascript
await roomdevice.audioMute();
```

---

### audioUnmute

▸ **audioUnmute**(): `Promise<void>`

Unmutes the microphone if it had been previously muted.

#### Returns

`Promise<void>`

#### Permissions

- `room.self.audio_unmute`

You need to specify the permissions when [creating the Video Room Token](/rest/signalwire-rest/endpoints/video/create-room-token) on the server side.

#### Example

Unmuting the microphone:

```javascript
await roomdevice.audioUnmute();
```

---

### join

▸ **join**(): `Promise<void>`

Joins this device to the room session.

#### Returns

`Promise<void>`

---

### leave

▸ **leave**(): `Promise<void>`

Detaches this device from the room session.

#### Returns

`Promise<void>`

---

### setInputSensitivity

▸ **setInputSensitivity**(`params`): `Promise<void>`

Sets the input level at which the participant is identified as currently speaking.

#### Parameters

| Name           | Type     | Description                                                                                                               |
| :------------- | :------- | :------------------------------------------------------------------------------------------------------------------------ |
| `params`       | `Object` |                                                                                                                           |
| `params.value` | `number` | Desired sensitivity from 0 (lowest sensitivity, essentially muted) to 100 (highest sensitivity). The default value is 30. |

#### Returns

`Promise<void>`

#### Permissions

- `room.self.set_input_sensitivity`

You need to specify the permissions when [creating the Video Room Token](/rest/signalwire-rest/endpoints/video/create-room-token) on the server side.

#### Example

```javascript
await roomdevice.setInputSensitivity({ value: 80 });
```

---

### setInputVolume

▸ **setInputVolume**(`params`): `Promise<void>`

Sets the input volume level (e.g. for the microphone).

#### Parameters

| Name            | Type     | Description                                                       |
| :-------------- | :------- | :---------------------------------------------------------------- |
| `params`        | `Object` | -                                                                 |
| `params.volume` | `number` | Desired volume. Values range from -50 to 50, with a default of 0. |

#### Returns

`Promise<void>`

#### Permissions

- `room.self.set_input_volume`

You need to specify the permissions when [creating the Video Room Token](/rest/signalwire-rest/endpoints/video/create-room-token) on the server side.

#### Example

```javascript
await roomdevice.setMicrophoneVolume({ volume: -10 });
```

---

### setMicrophoneVolume

▸ **setMicrophoneVolume**(`params`): `Promise<void>`

> ⚠️ Deprecated.
> Use [setInputVolume](./video-roomsessiondevice.md#setinputvolume) instead.

#### Parameters

| Name            | Type     |
| :-------------- | :------- |
| `params`        | `Object` |
| `params.volume` | `number` |

#### Returns

`Promise<void>`

---

### updateCamera

▸ **updateCamera**(`constraints`): `Promise<void>`

Replaces the current camera stream with the one coming from a different device.

#### Parameters

| Name          | Type                    | Description                                                                                                                                                  |
| :------------ | :---------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `constraints` | `MediaTrackConstraints` | Specify the constraints that the device should satisfy. See [MediaTrackConstraints](https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints). |

#### Returns

`Promise<void>`

#### Example

Replaces the current camera stream with the one coming from the specified deviceId:

```javascript
await roomDevice.updateCamera({
  deviceId: "/o4ZeWzroh+8q0Ds/CFfmn9XpqaHzmW3L/5ZBC22CRg=",
});
```

---

### updateMicrophone

▸ **updateMicrophone**(`constraints`): `Promise<void>`

Replaces the current microphone stream with the one coming from a different device.

#### Parameters

| Name          | Type                    | Description                                                                                                                                                  |
| :------------ | :---------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `constraints` | `MediaTrackConstraints` | Specify the constraints that the device should satisfy. See [MediaTrackConstraints](https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints). |

#### Returns

`Promise<void>`

#### Example

Replaces the current microphone stream with the one coming from the specified deviceId:

```javascript
await roomDevice.updateMicrophone({
  deviceId: "/o4ZeWzroh+8q0Ds/CFfmn9XpqaHzmW3L/5ZBC22CRg=",
});
```

---

### videoMute

▸ **videoMute**(): `Promise<void>`

Puts the video on mute. Participants will see a mute image instead of the video stream.

#### Returns

`Promise<void>`

#### Permissions

- `room.self.video_mute`

You need to specify the permissions when [creating the Video Room Token](/rest/signalwire-rest/endpoints/video/create-room-token) on the server side.

#### Example

Muting the camera:

```javascript
await roomdevice.videoMute();
```

---

### videoUnmute

▸ **videoUnmute**(): `Promise<void>`

Unmutes the video if it had been previously muted. Participants will start seeing the video stream again.

#### Returns

`Promise<void>`

#### Permissions

- `room.self.video_unmute`

You need to specify the permissions when [creating the Video Room Token](/rest/signalwire-rest/endpoints/video/create-room-token) on the server side.

#### Example

Unmuting the camera:

```javascript
await roomdevice.videoUnmute();
```
