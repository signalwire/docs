---
slug: /video/room-session-playback
---

# RoomSessionPlayback

Instances of this class allow you to control (e.g., pause, resume, stop) the playback inside a room session. You can obtain instances of this class by starting a playback from the desired [RoomSession](video-roomsession.mdx) (see [RoomSession.play](video-roomsession.mdx#play))

## **Properties**

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

Whether the seek functions ([seek](#seek), [forward](#forward), [rewind](#rewind)) can be used for this playback.

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


## **Methods**

### forward

▸ **forward**(`offset`): `Promise<void>`

Seeks the current playback forward by the specified `offset`.

#### Parameters

| Name      | Type     | Description                                                                                                    |
| :-------- | :------- | :------------------------------------------------------------------------------------------------------------- |
| `offset?` | `number` | Relative number of milliseconds to seek forward from the current position. <br/> Defaults to `5000` (5 seconds). |

#### Returns

`Promise<void>`

#### Example

In this example, we wait for the [`RoomSession`](video-roomsession.mdx) to start,
then we start a playback and forward it by 10 seconds after 5 seconds.
This example assumes that a [`RoomSession`](video-roomsession.mdx) is active and
members are joining the room.

```javascript
import { SignalWire } from "@signalwire/realtime-api"

// Initialize the SignalWire client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" })

// Access the video client from the SignalWire client
const videoClient = client.video

// Setup a listener for when a room starts
await videoClient.listen({
    onRoomStarted: async (roomSession) => {
        // Start a playback
        const playback = await roomSession.play({ url: "https://cdn.signalwire.com/default-music/welcome.mp3" })
      
      setTimeout(async () => {
        // Forward the playback by 5 seconds
        await playback.forward(10000)
      }, 5000)
    }
})
```

---

### pause

▸ **pause**(): `Promise<void>`

Pauses the playback.

#### Returns

`Promise<void>`

#### Example

In this example, we wait for the [`RoomSession`](video-roomsession.mdx) to start,
then we start a playback.
After 5 seconds, we pause the playback.
This example assumes that a [`RoomSession`](video-roomsession.mdx) is active and
members are joining the room.

```javascript
import { SignalWire } from "@signalwire/realtime-api"

// Initialize the SignalWire client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" })

// Access the video client from the SignalWire client
const videoClient = client.video

// Setup a listener for when a room starts
await videoClient.listen({
    onRoomStarted: async (roomSession) => {
      // Start a playback
      const playback = await roomSession.play({ url: "https://cdn.signalwire.com/default-music/welcome.mp3" })
      
      // Resume the playback after 5 seconds
      setTimeout(async () => {
        // Pause the playback
        await playback.pause()
      }, 5000)
    }
})
```

---

### resume

▸ **resume**(): `Promise<void>`

Resumes the playback.

#### Returns

`Promise<void>`


#### Example

In this example, we wait for the [`RoomSession`](video-roomsession.mdx) to start,
then we start a playback and pause it.
After 5 seconds, we resume the playback.
This example assumes that a [`RoomSession`](video-roomsession.mdx) is active and
members are joining the room.

```javascript
import { SignalWire } from "@signalwire/realtime-api"

// Initialize the SignalWire client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" })

// Access the video client from the SignalWire client
const videoClient = client.video

// Setup a listener for when a room starts
await videoClient.listen({
    onRoomStarted: async (roomSession) => {
      // Start a playback
      const playback = await roomSession.play({ url: "https://cdn.signalwire.com/default-music/welcome.mp3" })
      // Pause the playback
      await playback.pause()
      
      // Resume the playback after 5 seconds
      setTimeout(async () => {
        // Pause the playback
        await playback.resume()
      }, 5000)
    }
})
```

---

### rewind

▸ **rewind**(`offset`): `Promise<void>`

Seeks the current playback backwards by the specified offset.

#### Parameters

| Name      | Type     | Description                                                                                         |
|:----------|:---------|:----------------------------------------------------------------------------------------------------|
| `offset?` | `number` | Relative number of milliseconds to seek backwards from the current position. Defaults to 5 seconds. |

#### Returns

`Promise<void>`

#### Example

In this example, we wait for the [`RoomSession`](video-roomsession.mdx) to start,
then we start a playback. After 10 seconds, we rewind the playback by 5 seconds.
This example assumes that a [`RoomSession`](video-roomsession.mdx) is active and
members are joining the room.

```javascript
import { SignalWire } from "@signalwire/realtime-api"

// Initialize the SignalWire client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" })

// Access the video client from the SignalWire client
const videoClient = client.video

// Setup a listener for when a room starts
await videoClient.listen({
  onRoomStarted: async (roomSession) => {
    // Start a playback
    const playback = await roomSession.play({ url: "https://cdn.signalwire.com/default-music/welcome.mp3" })
    
    setTimeout(async () => {
      // Rewind the playback by 5 seconds after 10 seconds
      await playback.rewind(5000)
    }, 10000)
  }
})
```

---

### seek

▸ **seek**(`timecode`): `Promise<void>`

Seeks the current playback to the specified absolute position.

#### Parameters

| Name       | Type     | Description                                                       |
|:-----------|:---------|:------------------------------------------------------------------|
| `timecode` | `number` | The absolute position in milliseconds to seek to in the playback. |

#### Returns

`Promise<void>`

#### Example

In this example, we wait for the [`RoomSession`](video-roomsession.mdx) to start,
then we start a playback. We then seek the playback to the 30th second.
This example assumes that a [`RoomSession`](video-roomsession.mdx) is active and
members are joining the room.

```javascript
import { SignalWire } from "@signalwire/realtime-api";

// Initialize the SignalWire client
const client = await SignalWire({ project: "Project ID Here", token: "API Token Here" })

// Access the video client from the main client
const videoClient = client.video;

// Setup listener for when a room starts
await videoClient.listen({
  onRoomStarted: async (roomSession) => {
    console.log("Room started", roomSession.displayName);

    // play wait music
    await roomSession.play({
      url: "https://cdn.signalwire.com/default-music/welcome.mp3",
      listen: {
        onStarted: (playback) => {
          console.log("Playback started");
          // Seek to 30 seconds
          console.log("Skipping to 30 seconds");
          playback.seek(30000)
        },
        onUpdated: (playback) => console.log("Playback updated", playback.state),
        onEnded: (playback) => console.log("Playback ended", playback.state),
      }
    })
  }
})
```

---

### setVolume

▸ **setVolume**(`volume`): `Promise<void>`

Sets the audio volume for the playback.

#### Parameters

| Name     | Type     | Description                                                           |
|:---------|:---------|:----------------------------------------------------------------------|
| `volume` | `number` | The desired volume. Values range from -50 to 50, with a default of 0. |

#### Returns

`Promise<void>`

#### Example

In this example, we wait for the [`RoomSession`](video-roomsession.mdx) to start,
then we start a playback. After 5 seconds, we set the volume to -50dB.
This example assumes that a [`RoomSession`](video-roomsession.mdx) is active and
members are joining the room.

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

    // play wait music
    let roomPlayback = roomSession.play({
      url: "https://cdn.signalwire.com/default-music/welcome.mp3",
      listen: {
        onStarted: () => {
          console.log("Playback started");
          setTimeout(() => {
             roomPlayback.setVolume(-50);
          }, 5000);
        }
      }
    });
    await roomSession.listen({
      onMemberJoined: (member) => {
        console.log("Member joined", member.name);
      },
      onMemberLeft: (member) => {
        console.log("Member left", member.name);
      },
    });
  },
  onRoomEnded: async (roomSession) => {
    console.log("Room ended", roomSession.displayName);
  }
})
```

---

### stop

▸ **stop**(): `Promise<void>`

Stops the playback.

#### Returns

`Promise<void>`

#### Example

In this example, we wait for the [`RoomSession`](video-roomsession.mdx) to start,
then we start a playback. After 5 seconds, we stop the playback.
This example assumes that a [`RoomSession`](video-roomsession.mdx) is active and
members are joining the room.

```javascript
import { SignalWire } from "@signalwire/realtime-api";

// Initialize the SignalWire client
const client = await SignalWire({ project: "ProjectID Here", token: "Token Here" });

// Access video client from the main client
const videoClient = client.video;

// Setup listener for when a room starts
await videoClient.listen({
  onRoomStarted: async (roomsession) => {

    console.log("Room started", roomsession.displayName);

    // Setup listener for when a room starts
    await videoClient.listen({
      onRoomStarted: async (roomSession) => {
        console.log("Room started", roomSession.displayName);

        // play wait music
        let roomPlayback = roomSession.play({
          url: "https://cdn.signalwire.com/default-music/welcome.mp3",
          listen: {
            onStarted: () => {
              console.log("Playback started");
            },
            onEnded: () => {
              console.log("Playback ended");
            },
            onUpdated: (playback) => {
              console.log("Playback updated", playback);
            },
          }
        });

        // wait for 5 seconds then stop the playback
        setTimeout(() => {
          roomPlayback.stop();
        }, 5000);

        await roomSession.listen({
          onMemberJoined: (member) => {
            console.log("Member joined", member.name);
          },
          onMemberLeft: (member) => {
            console.log("Member left", member.name);
          },
        });
      },
      onRoomEnded: async (roomSession) => {
        console.log("Room ended", roomSession.displayName);
      }
    });
  }
});
```

## **Events**

### onStarted

▸ **RoomSessionPlayback**(`listen: {onStarted: Callback }`)

Emitted when the playback starts.

#### Parameters

| Name       | Type                                                  | Description                |
|:-----------|:------------------------------------------------------|:---------------------------|
| `playback` | [`RoomSessionPlayback`](video-roomsessionplayback.md) | The playback that started. |

---

### onUpdated

▸ **RoomSessionPlayback**(`listen: {onUpdated: Callback }`)

Emitted when the playback is updated.

#### Parameters

| Name       | Type                                                  | Description                |
|:-----------|:------------------------------------------------------|:---------------------------|
| `playback` | [`RoomSessionPlayback`](video-roomsessionplayback.md) | The playback that updated. |

---

### onEnded

▸ **RoomSessionPlayback**(`listen: {onEnded: Callback }`)

Emitted when the playback ends.

#### Parameters

| Name       | Type                                                  | Description              |
|:-----------|:------------------------------------------------------|:-------------------------|
| `playback` | [`RoomSessionPlayback`](video-roomsessionplayback.md) | The playback that ended. |
