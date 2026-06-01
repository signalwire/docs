---
slug: "/reference/typescript/rest/namespaces/calling/calling-namespace/transcribe"
title: "transcribe"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.calling.CallingNamespace.transcribe"
  parent: "rest.namespaces.calling.CallingNamespace"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts"
---
# `transcribe`

Start real-time transcription on the call.

## Signature

```typescript
transcribe(callId: string, params: any = {}): Promise<any>
```

## Parameters

| Name     | Type     | Required | Default | Description                                    |
| -------- | -------- | -------- | ------- | ---------------------------------------------- |
| `callId` | `string` | yes      | —       | Target call's ID.                              |
| `params` | `any`    | yes      | `{}`    | Transcription configuration. Defaults to `{}`. |

## Returns

`Promise<any>` — The transcribe command response containing a `control_id`.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/calling.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts)

Line 386.
