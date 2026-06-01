---
slug: "/reference/typescript/rest/namespaces/video/video-rooms/create-stream"
title: "createStream"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoRooms.createStream"
  parent: "rest.namespaces.video.VideoRooms"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts"
---
# `createStream`

Start a new outbound stream from a room (e.g. RTMP to YouTube, Twitch).

## Signature

```typescript
createStream(roomId: string, body: any): Promise<any>
```

## Parameters

| Name     | Type     | Required | Default | Description                                                |
| -------- | -------- | -------- | ------- | ---------------------------------------------------------- |
| `roomId` | `string` | yes      | —       | Unique identifier of the video room.                       |
| `body`   | `any`    | yes      | —       | Stream configuration (destination URL, credentials, etc.). |

## Returns

`Promise<any>` — The newly-created stream record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/video.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts)

Line 40.
