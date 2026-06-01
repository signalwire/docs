---
slug: "/reference/typescript/rest/namespaces/video/video-room-sessions/list-members"
title: "listMembers"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoRoomSessions.listMembers"
  parent: "rest.namespaces.video.VideoRoomSessions"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts"
---
# `listMembers`

List members that participated in a room session.

## Signature

```typescript
listMembers(sessionId: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name        | Type          | Required | Default | Description                                    |
| ----------- | ------------- | -------- | ------- | ---------------------------------------------- |
| `sessionId` | `string`      | yes      | —       | Unique identifier of the room session.         |
| `params`    | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of members (past and current).

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/video.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts)

Line 111.
