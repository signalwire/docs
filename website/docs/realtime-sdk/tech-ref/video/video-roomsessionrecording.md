---
slug: /video/roomsession-recording
sidebar_label: RoomSessionRecording
---

# RoomSessionRecording

[video-roomsession]: video-roomsession.mdx
[video-roomsessionrecording]: video-roomsessionrecording.md

Represents a specific recording of a room session.

## **Properties**

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

The unique ID of this recording.

---

### roomSessionId

• **roomSessionId**: `string`

The ID of the room session associated to this recording.

---

### startedAt

• `Optional` **startedAt**: `Date`

Start time, if available.

---

### state

• **state**: `"recording"` \| `"paused"` \| `"completed"`

Current state.


## **Methods**

### pause

▸ **pause**(): `Promise<void>`

Pauses the recording.

#### Returns

`Promise<void>`

#### Example

In this example, we start a recording and pause it after 5 seconds.
This example assumes you have already created a [`RoomSession`][video-roomsession]
and members are joining.


```javascript
import { SignalWire } from "@signalwire/realtime-api";

// Initialize the SignalWire client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" });

// Access video client from the main client
const videoClient = client.video;

// Setup listener for when a room starts
await videoClient.listen({
  onRoomStarted: async (roomSession) => {
    console.log("Room started", roomSession.displayName);

    let roomRecording =  roomSession.startRecording({
      listen: {
        onStarted: () => {
          console.log("Recording started");
        },
        onEnded: (recording) => {
          console.log(`Recording ended.
          Recording State: ${recording.state}.
          Recording Id: ${recording.id}`);
        },
      }
    })
    await roomSession.listen({
      onRecordingUpdated: (recording) => {
        console.log(`Recording State: ${recording.state}. Recording Id: ${recording.id}`);
      },
      onMemberJoined: async (member) => {
        console.log("Member joined", member.name);
    },
      onMemberLeft: (member) => {
        console.log("Member left", member.name);
      },
    })

    // Pausing the recording after 5 seconds
    setTimeout(async () => {
      console.log("Stopping recording");
      await roomRecording.pause();
    }, 5000);
  },
  onRoomEnded: async (roomSession) => {
    console.log("Room ended", roomSession.displayName);
  }
});
```

---

### resume

▸ **resume**(): `Promise<void>`

Resumes the recording.

#### Returns

`Promise<void>`

#### Example

In this example, we start a recording and pause it after 5 seconds.
Then we resume the recording after another 5 seconds of being paused.
This example assumes you have already created a [`RoomSession`][video-roomsession]
and members are joining.

```javascript
import { SignalWire } from "@signalwire/realtime-api";

// Initialize the SignalWire client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" });

// Access video client from the main client
const videoClient = client.video;

// Setup listener for when a room starts
await videoClient.listen({
  onRoomStarted: async (roomSession) => {
    console.log("Room started", roomSession.displayName);

    let roomRecording =  roomSession.startRecording({
      listen: {
        onStarted: () => {
          console.log("Recording started");
        },
        onEnded: (recording) => {
          console.log(`Recording ended.
          Recording State: ${recording.state}.
          Recording Id: ${recording.id}`);
        },
      }
    })

    await roomSession.listen({
      onRecordingUpdated: (recording) => {
        console.log(`Recording State: ${recording.state}. Recording Id: ${recording.id}`);
      },
      onMemberJoined: async (member) => {
        console.log("Member joined", member.name);

    },
      onMemberLeft: (member) => {
        console.log("Member left", member.name);
      },
    })

    // Pause the recording after 5 seconds
    setTimeout(async () => {
      console.log("Pausing recording");
      await roomRecording.pause();

      // Resume the recording after 5 seconds
      setTimeout(() => {
        console.log("Resuming recording");
        roomRecording.resume();
      }, 5000);
    }, 5000);
  },
  onRoomEnded: async (roomSession) => {
    console.log("Room ended", roomSession.displayName);
  }
});
```

---

### stop

▸ **stop**(): `Promise<void>`

Stops the recording.

#### Returns

`Promise<void>`

#### Example

In this example, we start a recording and stop it after 5 seconds.
This example assumes you have already created a [`RoomSession`][video-roomsession]
and members are joining.

```javascript
import { SignalWire } from "@signalwire/realtime-api";

// Initialize the SignalWire client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" });

// Access video client from the main client
const videoClient = client.video;

// Setup listener for when a room starts
await videoClient.listen({
  onRoomStarted: async (roomSession) => {
    console.log("Room started", roomSession.displayName);

    let roomRecording =  roomSession.startRecording({
      listen: {
        onStarted: () => {
          console.log("Recording started");
        },
        onEnded: (recording) => {
          console.log(`Recording ended.
          Recording State: ${recording.state}.
          Recording Id: ${recording.id}`);
        },
      }
    })

    await roomSession.listen({
      onRecordingUpdated: (recording) => {
        console.log(`Recording State: ${recording.state}. Recording Id: ${recording.id}`);
      },
      onMemberJoined: async (member) => {
        console.log("Member joined", member.name);

    },
      onMemberLeft: (member) => {
        console.log("Member left", member.name);
      },
    })

    // Stopping the recording after 5 seconds
    setTimeout(async () => {
      console.log("Stopping recording");
      await roomRecording.stop();
    }, 5000);
  },
  onRoomEnded: async (roomSession) => {
    console.log("Room ended", roomSession.displayName);
  }
});
```

---

## **Events**

### onStarted

▸ **RoomSessionRecording**(`{ listen: {onStarted: Callback }}`)

Emitted when the recording starts.

#### Parameters

| Name        | Type                                                    | Description                 |
|:------------|:--------------------------------------------------------|:----------------------------|
| `recording`<span className="required-arg">Required</span> | [`RoomSessionRecording`][video-roomsessionrecording] | The recording that started. |

---

### onUpdated

▸ **RoomSessionRecording**(`{ listen: {onUpdated: Callback }}`)

Emitted when the recording is updated.

#### Parameters

| Name        | Type                                                    | Description                 |
|:------------|:--------------------------------------------------------|:----------------------------|
| `recording`<span className="required-arg">Required</span> | [`RoomSessionRecording`][video-roomsessionrecording] | The recording that updated. |

---

### onEnded

▸ **RoomSessionRecording**(`{ listen: {onEnded: Callback }}`)

Emitted when the recording ends.

#### Parameters

| Name        | Type                                                    | Description               |
|:------------|:--------------------------------------------------------|:--------------------------|
| `recording`<span className="required-arg">Required</span> | [`RoomSessionRecording`][video-roomsessionrecording] | The recording that ended. |



