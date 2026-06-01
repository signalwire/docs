---
slug: "/reference/typescript/rest/namespaces/video/video-room-tokens/create"
title: "create"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoRoomTokens.create"
  parent: "rest.namespaces.video.VideoRoomTokens"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts"
---
# `create`

Issue a JWT token that grants a browser / mobile client access to a room.

## Signature

```typescript
create(body: any): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description                                                    |
| ------ | ----- | -------- | ------- | -------------------------------------------------------------- |
| `body` | `any` | yes      | —       | Token payload (`room_name`, `user_name`, `permissions`, etc.). |

## Returns

`Promise<any>` — The token record, typically `{ token: "eyJ..." }`.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/video.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts)

Line 58.
