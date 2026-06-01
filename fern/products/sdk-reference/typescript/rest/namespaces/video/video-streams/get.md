---
slug: "/reference/typescript/rest/namespaces/video/video-streams/get"
title: "get"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoStreams.get"
  parent: "rest.namespaces.video.VideoStreams"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts"
---
# `get`

Fetch a video stream by ID.

## Signature

```typescript
get(streamId: string): Promise<any>
```

## Parameters

| Name       | Type     | Required | Default | Description                      |
| ---------- | -------- | -------- | ------- | -------------------------------- |
| `streamId` | `string` | yes      | —       | Unique identifier of the stream. |

## Returns

`Promise<any>` — The stream record.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/namespaces/video.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts)

Line 267.
