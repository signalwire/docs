---
slug: "/reference/typescript/rest/namespaces/video/video-streams/delete"
title: "delete"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoStreams.delete"
  parent: "rest.namespaces.video.VideoStreams"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts"
---
# `delete`

Stop and delete a video stream.

## Signature

```typescript
delete(streamId: string): Promise<any>
```

## Parameters

| Name       | Type     | Required | Default | Description                      |
| ---------- | -------- | -------- | ------- | -------------------------------- |
| `streamId` | `string` | yes      | —       | Unique identifier of the stream. |

## Returns

`Promise<any>` — The platform's delete response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/video.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts)

Line 290.
