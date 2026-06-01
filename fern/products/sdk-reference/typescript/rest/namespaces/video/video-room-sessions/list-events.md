---
slug: "/reference/typescript/rest/namespaces/video/video-room-sessions/list-events"
title: "listEvents"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoRoomSessions.listEvents"
  parent: "rest.namespaces.video.VideoRoomSessions"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts"
---
# `listEvents`

List the event log for a room session.

## Signature

```typescript
listEvents(sessionId: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name        | Type          | Required | Default | Description                                    |
| ----------- | ------------- | -------- | ------- | ---------------------------------------------- |
| `sessionId` | `string`      | yes      | —       | Unique identifier of the room session.         |
| `params`    | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of session events.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/video.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts)

Line 99.
