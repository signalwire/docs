---
slug: /video/room-session-member
sidebar_label: RoomSessionMember

---

# RoomSessionMember

[video-roomsession]: video-roomsession.mdx

Represents a member of a room session. You receive instances of this type by listening to room events, for example on a [RoomSession][video-roomsession] object.

:::info

The state of RoomSessionMember objects, for example `member.visible`, is
immutable. When you receive instances of RoomSessionMember from event
listeners, the state of the member always refers to that specific point in
time and remains fixed for the whole lifetime of the object.

:::

### Example

Getting a RoomSessionMember instance when a user joins a [RoomSession][video-roomsession]:

```js
import { SignalWire } from "@signalwire/realtime-api";

// Intialize the SignalWire Client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" })

// Access the video client from the SignalWire client
const videoClient = client.video;

// Setup listerner for when a room starts
await videoClient.listen({
  onRoomStarted: async (roomsession) => {
    roomsession.listen({
      onMemberJoined: (member) => {
        console.log("RoomSessionMember:", member);
      },
    });
  }
});
```

---

## **Properties**

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

• **meta**: `Record<string, unknown>`

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

---

## **Methods**

### audioMute

▸ **audioMute**(): `Promise<void>`

Mutes the outbound audio for this member (e.g., the one coming from a microphone). The other participants will not hear audio from the muted participant anymore.

#### Returns

`Promise<void>`

#### Example

In this example, we mute the audio of the member when they join the room.
This example assumes that you already have a [`RoomSession`][video-roomsession] active
and members are joining the room.

```js
import { SignalWire } from "@signalwire/realtime-api";

// Intialize the SignalWire Client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" })

// Access the video client from the SignalWire client
const videoClient = client.video;

// Setup listerner for when a room starts
await videoClient.listen({
  onRoomStarted: async (roomsession) => {
    roomsession.listen({
      // Mute the audio of the RoomSession member when they join the room
      onMemberJoined: async (member) => {
        await member.audioMute();
      },
      onMemberUpdated: async (member) => {
        console.log("Member Updated:", member.name);
      }
    });
  }
});
```

---

### audioUnmute

▸ **audioUnmute**(): `Promise<void>`

Unmutes the outbound audio for this member (e.g., the one coming from a microphone) if it had been previously muted.

#### Returns

`Promise<void>`

#### Example

In this example, we mute the audio of the member when they join the room and
unmute it after 5 seconds. 
This example assumes that you already have a [`RoomSession`][video-roomsession] active
and members are joining the room.

```js
import { SignalWire } from "@signalwire/realtime-api";

// Intialize the SignalWire Client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" })

// Access the video client from the SignalWire client
const videoClient = client.video;

// Setup listerner for when a room starts
await videoClient.listen({
  onRoomStarted: async (roomsession) => {
    roomsession.listen({
      // Mute the audio of the RoomSession member when they join the room and unmute it after 5 seconds
      onMemberJoined: async (member) => {
        await member.audioMute();
        setTimeout(async () => {
          await member.audioUnmute();
        }, 5000);
      },
      onMemberUpdated: async (member) => {
        console.log("Member Updated:", member.name);
      }
    });
  }
});
```

---

### remove

▸ **remove**(): `Promise<void>`

Removes this member from the room.

#### Returns

`Promise<void>`

#### Example

In this example, we remove the member from the room when they join the room after 5 seconds.
This example assumes that you already have a [`RoomSession`][video-roomsession] active
and members are joining the room.

```js
import { SignalWire } from "@signalwire/realtime-api";

// Intialize the SignalWire Client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" })

// Access the video client from the SignalWire client
const videoClient = client.video;

// Setup listerner for when a room starts
await videoClient.listen({
  onRoomStarted: async (roomsession) => {
    roomsession.listen({
      // Remove the RoomSession member when they join the room
      onMemberJoined: async (member) => {
        setTimeout(async () => {
          await member.remove();
        }, 5000);
      },
      onMemberUpdated: async (member) => {
        console.log("Member Updated:", member.name);
      }
    });
  }
});
```

---

### setDeaf

▸ **setDeaf**(`value`): `Promise<void>`

Mutes or unmutes the inbound audio for the member (e.g., the one played through this member's speakers). When the inbound audio is muted, the affected participant will not hear audio from the other participants anymore.

#### Parameters

| Name    | Type      | Description                |
|:--------|:----------|:---------------------------|
| `value` | `boolean` | Whether to mute the audio. |

#### Returns

`Promise<void>`

#### Example

In this example, we mute the audio of the member when they join the room.
This example assumes that you already have a [`RoomSession`][video-roomsession] active
and members are joining the room.

```js
import { SignalWire } from "@signalwire/realtime-api";

// Intialize the SignalWire Client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" })

// Access the video client from the SignalWire client
const videoClient = client.video;

// Setup listerner for when a room starts
await videoClient.listen({
  onRoomStarted: async (roomsession) => {
    roomsession.listen({
      // Mute the audio of the RoomSession member when they join the room
      onMemberJoined: async (member) => {
        await member.setDeaf(true);
      },
      onMemberUpdated: async (member) => {
        console.log("Member Updated:", member.name);
      }
    });
  }
});
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

In this example, we set the input sensitivity of the member when they join the room.
This example assumes that you already have a [`RoomSession`][video-roomsession] active
and members are joining the room.

```js
import { SignalWire } from "@signalwire/realtime-api";

// Intialize the SignalWire Client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" })

// Access the video client from the SignalWire client
const videoClient = client.video;

// Setup listerner for when a room starts
await videoClient.listen({
  onRoomStarted: async (roomsession) => {
    roomsession.listen({
      // Set the input sensitivity of the RoomSession member when they join the room
      onMemberJoined: async (member) => {
        await member.setInputSensitivity({ value: 80 });
      },
      onMemberUpdated: async (member) => {
        console.log("Member Updated:", member.name);
      }
    });
  }
});
```

---

### setInputVolume

▸ **setInputVolume**(`params`): `Promise<void>`

Sets the input volume for the member (e.g., the microphone input level).

#### Parameters

| Name            | Type     | Description                                                       |
|:----------------|:---------|:------------------------------------------------------------------|
| `params`        | `Object` |                                                                   |
| `params.volume` | `number` | Desired volume. Values range from -50 to 50, with a default of 0. |

#### Returns

`Promise<void>`

#### Example

In this example, we set the input volume of the member when they join the room.
This example assumes that you already have a [`RoomSession`][video-roomsession] active
and members are joining the room.

```js
import { SignalWire } from "@signalwire/realtime-api";

// Intialize the SignalWire Client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" })

// Access the video client from the SignalWire client
const videoClient = client.video;

// Setup listerner for when a room starts
await videoClient.listen({
  onRoomStarted: async (roomsession) => {
    roomsession.listen({
      // Set the input volume of the RoomSession member when they join the room
      onMemberJoined: async (member) => {
        await member.setInputVolume({ volume: -10 });
      },
      onMemberUpdated: async (member) => {
        console.log("Member Updated:", member.name);
      }
    });
  }
});
```

---

### setOutputVolume

▸ **setOutputVolume**(`params`): `Promise<void>`

Sets the output volume for the member (e.g., the speaker output level).

#### Parameters

| Name            | Type     | Description                                                       |
|:----------------|:---------|:------------------------------------------------------------------|
| `params`        | `Object` | -                                                                 |
| `params.volume` | `number` | Desired volume. Values range from -50 to 50, with a default of 0. |

#### Returns

`Promise<void>`

#### Example

In this example, we set the output volume of the member when they join the room.
This example assumes that you already have a [`RoomSession`][video-roomsession] active
and members are joining the room.

```js
import { SignalWire } from "@signalwire/realtime-api";

// Intialize the SignalWire Client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" })

// Access the video client from the SignalWire client
const videoClient = client.video;

// Setup listerner for when a room starts
await videoClient.listen({
  onRoomStarted: async (roomsession) => {
    roomsession.listen({
      // Set the output volume of the RoomSession member when they join the room
      onMemberJoined: async (member) => {
        await member.setOutputVolume({ volume: -10 });
      },
      onMemberUpdated: async (member) => {
        console.log("Member Updated:", member.name);
      }
    });
  }
});
```

---

### videoMute

▸ **videoMute**(): `Promise<void>`

Mutes the outbound video for this member (e.g., the one coming from a webcam). Participants will see a mute image instead of the video stream.

#### Returns

`Promise<void>`

#### Example


In this example, we mute the video of the member when they join the room.
This example assumes that you already have a [`RoomSession`][video-roomsession] active
and members are joining the room.

```js
import { SignalWire } from "@signalwire/realtime-api";

// Intialize the SignalWire Client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" })

// Access the video client from the SignalWire client
const videoClient = client.video;

// Setup listerner for when a room starts
await videoClient.listen({
  
  onRoomStarted: async (roomsession) => {
    roomsession.listen({
      // Mute the video of the RoomSession member when they join the room
      onMemberJoined: async (member) => {
        await member.videoMute();
      },
      onMemberUpdated: async (member) => {
        console.log("Member Updated:", member.name);
      }
    });
  }
});
```

---

### videoUnmute

▸ **videoUnmute**(): `Promise<void>`

Unmutes the outbound video for this member (e.g., the one coming from a webcam) if it had been previously muted. Participants will start seeing the video stream again.

#### Returns

`Promise<void>`

#### Example

In this example, we mute the video of the member when they join the room and
unmute it after 5 seconds. This example assumes that you already have a [`RoomSession`][video-roomsession] active
and members are joining the room.

```js
import { SignalWire } from "@signalwire/realtime-api";

// Intialize the SignalWire Client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" })

// Access the video client from the SignalWire client
const videoClient = client.video;

// Listen for a room to start
await videoClient.listen({
  
  onRoomStarted: async (roomsession) => {
    // Listen for a member to join the room
    roomsession.listen({
      onMemberJoined: async (member) => {
        // Mute the video of the RoomSession member when they join the room
        await member.videoMute();
        // Unmute the video of the RoomSession member after 5 seconds
        setTimeout(async () => {
          await member.videoUnmute();
        }, 5000);
      },
      onMemberUpdated: async (member) => {
        console.log("Member Updated:", member.name);
      }
    });
  }
});
```
