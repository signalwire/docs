---
title: "RoomSessionPlayback"
slug: /video/room-session-playback
---

Instances of this class allow you to control (e.g., pause, resume, stop) the playback inside a room session. You can obtain instances of this class by starting a playback from the desired [RoomSession](/browser-sdk/reference/video/roomsession) (see [RoomSession.play](/browser-sdk/reference/video/roomsession#play)).

## Properties

### endedAt

• `Optional` **endedAt**: `Date`

End time, if available.

---

### id

• **id**: `string`

Unique id for this playback.

---

### position

• **position**: `number`

Current playback position, in milliseconds.

---

### roomSessionId

• **roomSessionId**: `string`

Id of the room session associated to this playback.

---

### seekable

• **seekable**: `boolean`

Whether the seek functions ([seek](#seek), [forward](#forward), [rewind](#rewind)) can be used for this playback

---

### startedAt

• **startedAt**: `Date`

Start time, if available.

---

### state

• **state**: `"paused"` \| `"completed"` \| `"playing"`

Current state of the playback.

---

### url

• **url**: `string`

Url of the file reproduced by this playback.

---

### volume

• **volume**: `number`

Audio volume at which the playback file is reproduced.

## Methods

### forward

▸ **forward**(`offset`): `Promise<void>`

Seeks the current playback forward by the specified offset.

#### Parameters

<ParamField path="offset" type="number" default="5000">
  Relative number of milliseconds to seek forward from the current position.
</ParamField>

#### Returns

`Promise<void>`

#### Permissions

- `room.playback.seek` or the more permissive `room.playback`

You need to specify the permissions when [creating the Video Room Token](/rest/signalwire-rest/endpoints/video/create-room-token) on the server side.

#### Example

```javascript
const playback = await roomSession.play({ url: "rtmp://example.com/foo" });
await playback.forward(5000); // 5 seconds
```

---

### pause

▸ **pause**(): `Promise<void>`

Pauses the playback.

#### Returns

`Promise<void>`

---

### resume

▸ **resume**(): `Promise<void>`

Resumes the playback.

#### Returns

`Promise<void>`

---

### rewind

▸ **rewind**(`offset`): `Promise<void>`

Seeks the current playback backwards by the specified offset.

#### Parameters

<ParamField path="offset" type="number" default="5000">
  Relative number of milliseconds to seek backwards from the current position.
</ParamField>

#### Returns

`Promise<void>`

#### Permissions

- `room.playback.seek` or the more permissive `room.playback`

You need to specify the permissions when [creating the Video Room Token](/rest/signalwire-rest/endpoints/video/create-room-token) on the server side.

#### Example

```javascript
const playback = await roomSession.play({ url: "rtmp://example.com/foo" });
await playback.rewind(5000); // 5 seconds
```

---

### seek

▸ **seek**(`timecode`): `Promise<void>`

Seeks the current playback to the specified absolute position.

#### Parameters

<ParamField path="timecode" type="number" required={true}>
  The absolute position in milliseconds to seek to in the playback.
</ParamField>

#### Returns

`Promise<void>`

#### Permissions

- `room.playback.seek` or the more permissive `room.playback`

You need to specify the permissions when [creating the Video Room Token](/rest/signalwire-rest/endpoints/video/create-room-token) on the server side.

#### Example

```javascript
const playback = await roomSession.play({ url: "rtmp://example.com/foo" });
await playback.seek(30_000); // 30th second
```

---

### setVolume

▸ **setVolume**(`volume`): `Promise<void>`

Sets the audio volume for the playback.

#### Parameters

<ParamField path="volume" type="number" required={true}>
  The desired volume. Values range from -50 to 50, with a default of 0.
</ParamField>

#### Returns

`Promise<void>`

---

### stop

▸ **stop**(): `Promise<void>`

Stops the playback.

#### Returns

`Promise<void>`
