---
slug: "/reference/typescript/rest/namespaces/compat/compat-transcriptions/get"
title: "get"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatTranscriptions.get"
  parent: "rest.namespaces.compat.CompatTranscriptions"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `get`

Fetch a transcription by SID.

## Signature

```typescript
get(sid: string): Promise<any>
```

## Parameters

| Name  | Type     | Required | Default | Description                         |
| ----- | -------- | -------- | ------- | ----------------------------------- |
| `sid` | `string` | yes      | —       | Transcription SID (e.g. `"TR..."`). |

## Returns

`Promise<any>` — The transcription record.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 696.
