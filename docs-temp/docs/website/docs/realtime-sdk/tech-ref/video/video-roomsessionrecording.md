---
slug: /video/roomsession-recording
sidebar_label: RoomSessionRecording
---

# RoomSessionRecording

[video-roomsession]: video-roomsession.mdx
[video-roomsessionrecording]: video-roomsessionrecording.md

Represents a specific recording of a room session.

## **Properties**

<APIField name="id" type="string" required={true}>
  The unique ID of this recording.
</APIField>

<APIField name="roomId" type="string" required={true}>
  The ID of the room associated to this recording.
</APIField>

<APIField name="roomSessionId" type="string" required={true}>
  The ID of the room session associated to this recording.
</APIField>

<APIField name="state" type='"recording" | "paused" | "completed"' required={true}>
  Current state.
</APIField>

<APIField name="duration" type="number">
  Duration, if available.
</APIField>

<APIField name="startedAt" type="Date">
  Start time, if available.
</APIField>

<APIField name="endedAt" type="Date">
  End time, if available.
</APIField>

<APIField name="hasEnded" type="boolean" required={true}>
  Whether the recording has ended. Returns `true` if the state is `"completed"`.
</APIField>

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

<APIField name="recording" type="RoomSessionRecording" required={true}>
  The recording that started. See [`RoomSessionRecording`][video-roomsessionrecording].
</APIField>

### onUpdated

▸ **RoomSessionRecording**(`{ listen: {onUpdated: Callback }}`)

Emitted when the recording is updated.

#### Parameters

<APIField name="recording" type="RoomSessionRecording" required={true}>
  The recording that updated. See [`RoomSessionRecording`][video-roomsessionrecording].
</APIField>

### onEnded

▸ **RoomSessionRecording**(`{ listen: {onEnded: Callback }}`)

Emitted when the recording ends.

#### Parameters

<APIField name="recording" type="RoomSessionRecording" required={true}>
  The recording that ended. See [`RoomSessionRecording`][video-roomsessionrecording].
</APIField>



