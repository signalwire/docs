---
slug: "/reference/typescript/rest/namespaces/calling/calling-namespace/live-transcribe"
title: "liveTranscribe"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.calling.CallingNamespace.liveTranscribe"
  parent: "rest.namespaces.calling.CallingNamespace"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts"
---
# `liveTranscribe`

Start live transcription that emits events as speech is recognised.

## Signature

```typescript
liveTranscribe(callId: string, params: any = {}): Promise<any>
```

## Parameters

| Name     | Type     | Required | Default | Description                                                         |
| -------- | -------- | -------- | ------- | ------------------------------------------------------------------- |
| `callId` | `string` | yes      | —       | Target call's ID.                                                   |
| `params` | `any`    | yes      | `{}`    | Configuration (languages, model, partials, etc.). Defaults to `{}`. |

## Returns

`Promise<any>` — The platform's response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/calling.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts)

Line 463.
