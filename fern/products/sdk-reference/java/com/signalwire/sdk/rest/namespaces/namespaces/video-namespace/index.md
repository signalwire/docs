---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace"
title: "VideoNamespace"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.VideoNamespace"
  parent: "com.signalwire.sdk.rest.namespaces"
  module: "com.signalwire.sdk.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/VideoNamespace.java"
  visibility: "public"
---
# `VideoNamespace`

REST namespace for the Video API: rooms, room sessions/recordings,
conferences, conference tokens, and individual streams.

<p>Mirrors `signalwire.rest.namespaces.video.VideoNamespace`. The
 stream sub-resources hang off rooms and conferences; the top-level
 `streams` resource exists for CRUD on individual streams keyed by
 stream id.

## Signature

```java
public class VideoNamespace
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/init)
- [`conferences`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/conferences)
- [`conferenceTokens`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/conference-tokens)
- [`recordings`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/recordings) — Legacy alias for `#roomRecordings()`; previous releases of the Java port exposed video.recordings().
- [`roomRecordings`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/room-recordings)
- [`rooms`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/rooms)
- [`roomSessions`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/room-sessions)
- [`roomTokens`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/room-tokens)
- [`streams`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/streams)

## Classes

- [`VideoConferences`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/video-conferences) — Video conferences with token + stream sub-collections.
- [`VideoConferenceTokens`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/video-conference-tokens) — Video conference tokens (top-level): get + reset.
- [`VideoRoomRecordings`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/video-room-recordings) — Top-level video room recordings collection: list, get, delete, plus a per-recording events sub-collection.
- [`VideoRooms`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/video-rooms) — Video room management with stream sub-resources.
- [`VideoRoomSessions`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/video-room-sessions) — Video room sessions: list, get, plus events / members / recordings sub-collections.
- [`VideoStreams`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/video-namespace/video-streams) — Top-level streams resource (per stream id): get / update (PUT) / delete.

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/VideoNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/VideoNamespace.java)

Line 23.
