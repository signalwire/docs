---
slug: "/reference/typescript/rest/namespaces/video/video-conferences/create-stream"
title: "createStream"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoConferences.createStream"
  parent: "rest.namespaces.video.VideoConferences"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts"
---
# `createStream`

Start an outbound stream from a conference (e.g. RTMP to YouTube).

## Signature

```typescript
createStream(conferenceId: string, body: any): Promise<any>
```

## Parameters

| Name           | Type     | Required | Default | Description                                                |
| -------------- | -------- | -------- | ------- | ---------------------------------------------------------- |
| `conferenceId` | `string` | yes      | —       | Unique identifier of the conference.                       |
| `body`         | `any`    | yes      | —       | Stream configuration (destination URL, credentials, etc.). |

## Returns

`Promise<any>` — The newly-created stream record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/video.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts)

Line 220.
