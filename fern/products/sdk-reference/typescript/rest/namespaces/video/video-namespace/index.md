---
slug: "/reference/typescript/rest/namespaces/video/video-namespace"
title: "VideoNamespace"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoNamespace"
  parent: "rest.namespaces.video"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts"
---
# `VideoNamespace`

Video API namespace.

Access via `client.video.*`.

## Signature

```typescript
class VideoNamespace
```

## Examples

```typescript
const room = await client.video.rooms.create({ name: 'standup' });
const token = await client.video.roomTokens.create({ room_name: 'standup', user_name: 'Alice' });
```

## Properties

| Name               | Type                    | Required | Default | Description                                                  |
| ------------------ | ----------------------- | -------- | ------- | ------------------------------------------------------------ |
| `conferences`      | `VideoConferences`      | yes      | —       | Video conference CRUD plus stream / token management.        |
| `conferenceTokens` | `VideoConferenceTokens` | yes      | —       | Individual conference token read / reset operations.         |
| `roomRecordings`   | `VideoRoomRecordings`   | yes      | —       | Room recording read, delete, and event-log access.           |
| `rooms`            | `VideoRooms`            | yes      | —       | Video room CRUD plus outbound stream management.             |
| `roomSessions`     | `VideoRoomSessions`     | yes      | —       | Past and active room session read access.                    |
| `roomTokens`       | `VideoRoomTokens`       | yes      | —       | Issue JWT tokens for browser / mobile clients to join rooms. |
| `streams`          | `VideoStreams`          | yes      | —       | Individual video stream read / update / delete operations.   |

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/video/video-namespace/constructor)

## Source

[`src/rest/namespaces/video.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts)

Line 306.
