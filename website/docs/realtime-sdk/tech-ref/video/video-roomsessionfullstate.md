---
slug: /video/roomsession-fullstate
sidebar_label: RoomSessionFullState
---

# RoomSessionFullState

[video-roomsession]: video-roomsession.mdx#sethidevideomuted
[video-roomsession-1]: video-roomsession.mdx
[video-roomsessionmember]: video-roomsessionmember.md

Objects of this type contain the full state of a RoomSession at a given point in time.

## **Properties**

<APIField name="id" type="string" required={true}>
  Unique id for this room session.
</APIField>

<APIField name="roomId" type="string" required={true}>
  ID of the room associated to this room session.
</APIField>

<APIField name="name" type="string" required={true}>
  Name of this room.
</APIField>

<APIField name="displayName" type="string" required={true}>
  Display name for this room. Defaults to the value of `name`.
</APIField>

<APIField name="layoutName" type="string" required={true}>
  Current layout name used in the room.
</APIField>

<APIField name="hideVideoMuted" type="boolean" required={true}>
  Whether muted videos are shown in the room layout. See [setHideVideoMuted][video-roomsession].
</APIField>

<APIField name="recording" type="boolean" required={true}>
  Whether recording is active.
</APIField>

<APIField name="members" type="RoomSessionMember[]">
  List of members that are part of this room session. See [`RoomSessionMember`][video-roomsessionmember].
</APIField>

<APIField name="meta" type="Record<string, unknown>" required={true}>
  Metadata associated to this room session.
</APIField>

<APIField name="previewUrl" type="string">
  URL to the room preview.
</APIField>

<APIField name="recordings" type="any[]">
  List of active recordings in the room.
</APIField>

## **Example**

Getting the full state of a room session when it starts:

```js
import { SignalWire } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

const videoClient = client.video;

await videoClient.listen({
  onRoomStarted: async (roomSession) => {
    // roomSession contains the full state
    console.log("Room ID:", roomSession.roomId);
    console.log("Room Session ID:", roomSession.id);
    console.log("Room Name:", roomSession.name);
    console.log("Display Name:", roomSession.displayName);
    console.log("Current Layout:", roomSession.layoutName);
    console.log("Recording Active:", roomSession.recording);
    console.log("Hide Video Muted:", roomSession.hideVideoMuted);
    console.log("Metadata:", roomSession.meta);

    if (roomSession.members) {
      console.log("Members in room:", roomSession.members.length);
      roomSession.members.forEach(member => {
        console.log("- Member:", member.name, "ID:", member.id);
      });
    }

    if (roomSession.previewUrl) {
      console.log("Preview URL:", roomSession.previewUrl);
    }
  }
});
```

## **Methods**

You get the same methods that are available on a [RoomSession][video-roomsession-1] object.
