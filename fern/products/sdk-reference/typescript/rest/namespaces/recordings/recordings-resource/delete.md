---
slug: "/reference/typescript/rest/namespaces/recordings/recordings-resource/delete"
title: "delete"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.recordings.RecordingsResource.delete"
  parent: "rest.namespaces.recordings.RecordingsResource"
  module: "rest.namespaces.recordings"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/recordings.ts"
---
# `delete`

Delete a recording.

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

[`src/rest/namespaces/recordings.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/recordings.ts)

Line 50.
