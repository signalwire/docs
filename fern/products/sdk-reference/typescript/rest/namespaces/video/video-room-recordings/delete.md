---
slug: "/reference/typescript/rest/namespaces/video/video-room-recordings/delete"
title: "delete"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoRoomRecordings.delete"
  parent: "rest.namespaces.video.VideoRoomRecordings"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts"
---
# `delete`

Delete a room recording.

## Signature

```typescript
delete(recordingId: string): Promise<any>
```

## Parameters

| Name          | Type     | Required | Default | Description                         |
| ------------- | -------- | -------- | ------- | ----------------------------------- |
| `recordingId` | `string` | yes      | —       | Unique identifier of the recording. |

## Returns

`Promise<any>` — The platform's delete response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/video.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts)

Line 163.
