---
title: "RoomSessionPlayback"
slug: /video/roomsession-playback
---

[link]: #seek
[link-1]: #forward
[link-2]: #rewind
[video-roomsession]: ./video-roomsession.mdx
[video-roomsession-1]: ./video-roomsession.mdx#play

Instances of this class allow you to control (e.g., pause, resume, stop) the playback inside a room session. You can obtain instances of this class by starting a playback from the desired [RoomSession][video-roomsession] (see [RoomSession.play][video-roomsession-1])

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

Whether the seek functions ([seek][link], [forward][link-1], [rewind][link-2]) can be used for this playback

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

| Name      | Type     | Description                                                                                              |
| :-------- | :------- | :------------------------------------------------------------------------------------------------------- |
| `offset?` | `number` | Relative number of milliseconds to seek forward from the current position. Defaults to 5000 (5 seconds). |

#### Returns

`Promise<void>`

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

| Name      | Type     | Description                                                                                         |
| :-------- | :------- | :-------------------------------------------------------------------------------------------------- |
| `offset?` | `number` | Relative number of milliseconds to seek backwards from the current position. Defaults to 5 seconds. |

#### Returns

`Promise<void>`

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

| Name       | Type     | Description                                                       |
| :--------- | :------- | :---------------------------------------------------------------- |
| `timecode` | `number` | The absolute position in milliseconds to seek to in the playback. |

#### Returns

`Promise<void>`

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

| Name     | Type     | Description                                                           |
| :------- | :------- | :-------------------------------------------------------------------- |
| `volume` | `number` | The desired volume. Values range from -50 to 50, with a default of 0. |

#### Returns

`Promise<void>`

---

### stop

▸ **stop**(): `Promise<void>`

Stops the playback.

#### Returns

`Promise<void>`
