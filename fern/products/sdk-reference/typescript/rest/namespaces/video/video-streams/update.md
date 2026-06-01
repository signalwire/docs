---
slug: "/reference/typescript/rest/namespaces/video/video-streams/update"
title: "update"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoStreams.update"
  parent: "rest.namespaces.video.VideoStreams"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts"
---
# `update`

Update a video stream's configuration (e.g. destination URL).

## Signature

```typescript
update(streamId: string, body: any): Promise<any>
```

## Parameters

| Name       | Type     | Required | Default | Description                                         |
| ---------- | -------- | -------- | ------- | --------------------------------------------------- |
| `streamId` | `string` | yes      | —       | Unique identifier of the stream.                    |
| `body`     | `any`    | yes      | —       | Full updated stream attributes (replace semantics). |

## Returns

`Promise<any>` — The updated stream record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/video.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts)

Line 279.
