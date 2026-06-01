---
slug: "/reference/typescript/rest/namespaces/compat/compat-calls/start-recording"
title: "startRecording"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatCalls.startRecording"
  parent: "rest.namespaces.compat.CompatCalls"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `startRecording`

Start recording an active call.

## Signature

```typescript
startRecording(callSid: string, body: any = {}): Promise<any>
```

## Parameters

| Name      | Type     | Required | Default | Description                                                                     |
| --------- | -------- | -------- | ------- | ------------------------------------------------------------------------------- |
| `callSid` | `string` | yes      | —       | Call SID.                                                                       |
| `body`    | `any`    | yes      | `{}`    | Recording parameters (channels, trim, status callback, etc.). Defaults to `{}`. |

## Returns

`Promise<any>` — The newly-started recording record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 93.
