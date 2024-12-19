---
title: "RoomSessionRecording"
sidebar_position: 100
---

Represents a specific recording of a room session.

## Properties

### duration

• `Optional` **duration**: `number`

Duration, if available.

---

### endedAt

• `Optional` **endedAt**: `Date`

End time, if available.

---

### id

• **id**: `string`

The unique id of this recording.

---

### roomSessionId

• **roomSessionId**: `string`

The id of the room session associated to this recording.

---

### startedAt

• `Optional` **startedAt**: `Date`

Start time, if available.

---

### state

• **state**: `"recording"` \| `"paused"` \| `"completed"`

Current state.

## Methods

### pause

▸ **pause**(): `Promise<void>`

Pauses the recording.

#### Returns

`Promise<void>`

---

### resume

▸ **resume**(): `Promise<void>`

Resumes the recording.

#### Returns

`Promise<void>`

---

### stop

▸ **stop**(): `Promise<void>`

Stops the recording.

#### Returns

`Promise<void>`
