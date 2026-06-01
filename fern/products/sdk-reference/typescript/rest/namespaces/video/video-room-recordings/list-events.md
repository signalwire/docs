---
slug: "/reference/typescript/rest/namespaces/video/video-room-recordings/list-events"
title: "listEvents"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoRoomRecordings.listEvents"
  parent: "rest.namespaces.video.VideoRoomRecordings"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts"
---
# `listEvents`

List event log entries for a room recording.

## Signature

```typescript
listEvents(recordingId: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name          | Type          | Required | Default | Description                                    |
| ------------- | ------------- | -------- | ------- | ---------------------------------------------- |
| `recordingId` | `string`      | yes      | —       | Unique identifier of the recording.            |
| `params`      | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of recording events.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/video.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts)

Line 175.
