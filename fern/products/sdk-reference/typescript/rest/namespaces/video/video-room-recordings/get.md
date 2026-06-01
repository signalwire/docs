---
slug: "/reference/typescript/rest/namespaces/video/video-room-recordings/get"
title: "get"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoRoomRecordings.get"
  parent: "rest.namespaces.video.VideoRoomRecordings"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts"
---
# `get`

Fetch a room recording by ID.

## Signature

```typescript
get(recordingId: string): Promise<any>
```

## Parameters

| Name          | Type     | Required | Default | Description                         |
| ------------- | -------- | -------- | ------- | ----------------------------------- |
| `recordingId` | `string` | yes      | —       | Unique identifier of the recording. |

## Returns

`Promise<any>` — The recording record.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/namespaces/video.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts)

Line 152.
