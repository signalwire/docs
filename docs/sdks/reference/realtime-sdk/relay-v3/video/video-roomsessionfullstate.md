---
title: "RoomSessionFullState"
---

Objects of this type contain the full state of a RoomSession at a given point in time.

## Properties

### displayName

• **displayName**: `string`

Display name for this room. Defaults to the value of `name`.

---

### hideVideoMuted

• **hideVideoMuted**: `boolean`

Whether muted videos are shown in the room layout. See [setHideVideoMuted](./video-roomsession.mdx#sethidevideomuted).

---

### id

• **id**: `string`

Unique id for this room session.

---

### layoutName

• **layoutName**: `string`

Current layout name used in the room.

---

### members

• **members**: [`RoomSessionMember`](./video-roomsessionmember.md)[]

List of members that are part of this room session.

---

### meta

• **meta**: `Record``<string, unknown>`

Metadata associated to this room session.

---

### name

• **name**: `string`

Name of this room.

---

### previewUrl

• `Optional` **previewUrl**: `string`

URL to the room preview.

---

### recording

• **recording**: `boolean`

Whether recording is active.

---

### recordings

• `Optional` **recordings**: `any[]`

List of active recordings in the room.

---

### roomId

• **roomId**: `string`

Id of the room associated to this room session.

## Methods

You get the same methods that are available on a [RoomSession](./video-roomsession.mdx) object.
