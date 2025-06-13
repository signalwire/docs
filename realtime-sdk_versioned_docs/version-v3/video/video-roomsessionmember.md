---
title: "RoomSessionMember"
slug: /video/roomsession-member
---

Represents a member of a room session. You receive instances of this type by listening to room events, for example on a [RoomSession](./video-roomsession.mdx) object.

:::info

The state of RoomSessionMember objects, for example `member.visible`, is
immutable. When you receive instances of RoomSessionMember from event
listeners, the state of the member always refers to that specific point in
time and remains fixed for the whole lifetime of the object.

:::

#### Example

Getting a RoomSessionMember instance when a user joins a [RoomSession](./video-roomsession.mdx):

```js
roomSession.on("member.joined", (e) => {
  console.log("RoomSessionMember:", e.member);
});
```

## Properties

### audioMuted

• **audioMuted**: `boolean`

Whether the outbound audio is muted (e.g., from the microphone).

---

### currentPosition

• `Optional` **currentPosition**: `VideoPosition`

Current position of this member in the layout.

---

### deaf

• **deaf**: `boolean`

Whether the inbound audio is muted.

---

### handraised

• **handraised**: `boolean`

Whether the member has raised their hand.

---

### id

• **id**: `string`

Unique id of this member.

---

### inputSensitivity

• **inputSensitivity**: `number`

Input level at which the participant is identified as currently speaking. The default value is 30 and the scale goes from 0 (lowest sensitivity, essentially muted) to 100 (highest sensitivity).

---

### inputVolume

• **inputVolume**: `number`

Input volume (e.g., of the microphone). Values range from -50 to 50, with a default of 0.

---

### meta

• **meta**: `Record``<string, unknown>`

Metadata associated to this member.

---

### name

• **name**: `string`

Name of this member.

---

### onHold

• **onHold**: `boolean`

Whether the member is on hold.

---

### outputVolume

• **outputVolume**: `number`

Output volume (e.g., of the speaker). Values range from -50 to 50, with a default of 0.

---

### parentId

• `Optional` **parentId**: `string`

Id of the parent video member, if it exists.

---

### requestedPosition

• **requestedPosition**: `VideoPosition`

Position requested for this member in the layout. This may differ from
`currentPosition` if the requested position is not currently available.

---

### roomId

• **roomId**: `string`

Id of the room associated to this member.

---

### roomSessionId

• **roomSessionId**: `string`

Id of the room session associated to this member.

---

### type

• **type**: `VideoMemberType`

Type of this video member. Can be `'member'`, `'screen'`, or `'device'`.

---

### videoMuted

• **videoMuted**: `boolean`

Whether the outbound video is muted.

---

### visible

• **visible**: `boolean`

Whether the member is visible.

## Methods

### audioMute

▸ **audioMute**(): `Promise<void>`

Mutes the outbound audio for this member (e.g., the one coming from a microphone). The other participants will not hear audio from the muted participant anymore.

#### Returns

`Promise<void>`

#### Example

```typescript
await member.audioMute();
```

---

### audioUnmute

▸ **audioUnmute**(): `Promise<void>`

Unmutes the outbound audio for this member (e.g., the one coming from a microphone) if it had been previously muted.

#### Returns

`Promise<void>`

#### Example

```typescript
await member.audioUnmute();
```

---

### remove

▸ **remove**(): `Promise<void>`

Removes this member from the room.

#### Returns

`Promise<void>`

#### Example

```typescript
await member.remove();
```

---

### setDeaf

▸ **setDeaf**(`value`): `Promise<void>`

Mutes or unmutes the inbound audio for the member (e.g., the one played through this member's speakers). When the inbound audio is muted, the affected participant will not hear audio from the other participants anymore.

#### Parameters

| Name    | Type      | Description                |
| :------ | :-------- | :------------------------- |
| `value` | `boolean` | Whether to mute the audio. |

#### Returns

`Promise<void>`

#### Example

```typescript
await member.setDeaf(true);
```

---

### setInputSensitivity

▸ **setInputSensitivity**(`params`): `Promise<void>`

Sets the input level at which the participant is identified as currently speaking.

#### Parameters

| Name           | Type     | Description                                                                                                               |
|:---------------|:---------|:--------------------------------------------------------------------------------------------------------------------------|
| `params`       | `Object` | -                                                                                                                         |
| `params.value` | `number` | Desired sensitivity from 0 (lowest sensitivity, essentially muted) to 100 (highest sensitivity). The default value is 30. |

#### Returns

`Promise<void>`

#### Example

```typescript
await member.setInputSensitivity({ value: 80 });
```

---

### setInputVolume

▸ **setInputVolume**(`params`): `Promise<void>`

Sets the input volume for the member (e.g., the microphone input level).

#### Parameters

| Name            | Type     | Description                                                       |
| :-------------- | :------- | :---------------------------------------------------------------- |
| `params`        | `Object` |                                                                   |
| `params.volume` | `number` | Desired volume. Values range from -50 to 50, with a default of 0. |

#### Returns

`Promise<void>`

#### Example

```typescript
await member.setInputVolume({ volume: -10 });
```

---

### setMicrophoneVolume

▸ **setMicrophoneVolume**(`params`): `Promise<void>`

> ⚠️ Deprecated.
> Use [setInputVolume](./video-roomsessionmember.md#setinputvolume) instead.
> `setMicrophoneVolume` will be removed in v4.0.0

#### Parameters

| Name            | Type     |
| :-------------- | :------- |
| `params`        | `Object` |
| `params.volume` | `number` |

#### Returns

`Promise<void>`

---

### setOutputVolume

▸ **setOutputVolume**(`params`): `Promise<void>`

Sets the output volume for the member (e.g., the speaker output level).

#### Parameters

| Name            | Type     | Description                                                       |
| :-------------- | :------- | :---------------------------------------------------------------- |
| `params`        | `Object` | -                                                                 |
| `params.volume` | `number` | Desired volume. Values range from -50 to 50, with a default of 0. |

#### Returns

`Promise<void>`

#### Example

```typescript
await member.setOutputVolume({ volume: -10 });
```

---

### setRaisedHand

▸ **setRaisedHand**(`params`): `Promise<void>`

Sets the raised hand status for the current member.

#### Parameters

| Name             | Type      | Description                                                                                                                        |
|:-----------------|:----------|:-----------------------------------------------------------------------------------------------------------------------------------|
| `param`          | `Object`  | -                                                                                                                                  |
| `params.raised?` | `boolean` | Whether to raise or lower the hand. Default: `true`. If omitted, the hand status is toggled to the opposite of the current status. |

#### Returns

`Promise<void>`

#### Permissions

- `video.member.raisehand`: to raise a hand
- `video.member.lowerhand`: to lower a hand

You need to specify the permissions when [creating the Video Room Token](/rest/signalwire-rest/endpoints/video/create-room-token) on the server side.


#### Example

```javascript
await member.setRaisedHand({ raised: false })
```

---

### setSpeakerVolume

▸ **setSpeakerVolume**(`params`): `Promise<void>`

> ⚠️ Deprecated.
> Use [setOutputVolume](./video-roomsessionmember.md#setoutputvolume) instead.
> `setSpeakerVolume` will be removed in v4.0.0

#### Parameters

| Name            | Type     |
| :-------------- | :------- |
| `params`        | `Object` |
| `params.volume` | `number` |

#### Returns

`Promise<void>`

---

### videoMute

▸ **videoMute**(): `Promise<void>`

Mutes the outbound video for this member (e.g., the one coming from a webcam). Participants will see a mute image instead of the video stream.

#### Returns

`Promise<void>`

#### Example

```typescript
await member.videoMute();
```

---

### videoUnmute

▸ **videoUnmute**(): `Promise<void>`

Unmutes the outbound video for this member (e.g., the one coming from a webcam) if it had been previously muted. Participants will start seeing the video stream again.

#### Returns

`Promise<void>`

#### Example

```typescript
await member.videoUnmute();
```
