---
slug: "/reference/typescript/rest/namespaces/video/video-room-sessions/get"
title: "get"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoRoomSessions.get"
  parent: "rest.namespaces.video.VideoRoomSessions"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts"
---
# `get`

Fetch a single room session by ID.

## Signature

```typescript
get(sessionId: string): Promise<any>
```

## Parameters

| Name        | Type     | Required | Default | Description                            |
| ----------- | -------- | -------- | ------- | -------------------------------------- |
| `sessionId` | `string` | yes      | —       | Unique identifier of the room session. |

## Returns

`Promise<any>` — The room-session record.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/namespaces/video.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts)

Line 87.
