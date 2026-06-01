---
slug: "/reference/typescript/rest/namespaces/calling/calling-namespace/transcribe-stop"
title: "transcribeStop"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.calling.CallingNamespace.transcribeStop"
  parent: "rest.namespaces.calling.CallingNamespace"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts"
---
# `transcribeStop`

Stop real-time transcription.

## Signature

```typescript
transcribeStop(callId: string, params: any = {}): Promise<any>
```

## Parameters

| Name     | Type     | Required | Default | Description                                  |
| -------- | -------- | -------- | ------- | -------------------------------------------- |
| `callId` | `string` | yes      | —       | Target call's ID.                            |
| `params` | `any`    | yes      | `{}`    | Must include `control_id`. Defaults to `{}`. |

## Returns

`Promise<any>` — The final transcription metadata.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/calling.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts)

Line 398.
