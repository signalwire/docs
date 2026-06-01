---
slug: "/reference/typescript/rest/namespaces/compat/compat-transcriptions/delete"
title: "delete"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatTranscriptions.delete"
  parent: "rest.namespaces.compat.CompatTranscriptions"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `delete`

Delete a transcription.

## Signature

```typescript
delete(sid: string): Promise<any>
```

## Parameters

| Name  | Type     | Required | Default | Description        |
| ----- | -------- | -------- | ------- | ------------------ |
| `sid` | `string` | yes      | —       | Transcription SID. |

## Returns

`Promise<any>` — The platform's delete response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 707.
