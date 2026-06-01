---
slug: "/reference/typescript/rest/namespaces/compat/compat-calls/start-stream"
title: "startStream"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatCalls.startStream"
  parent: "rest.namespaces.compat.CompatCalls"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `startStream`

Start a media stream on an active call (WebSocket media forwarding).

## Signature

```typescript
startStream(callSid: string, body: any = {}): Promise<any>
```

## Parameters

| Name      | Type     | Required | Default | Description                                             |
| --------- | -------- | -------- | ------- | ------------------------------------------------------- |
| `callSid` | `string` | yes      | —       | Call SID.                                               |
| `body`    | `any`    | yes      | `{}`    | Stream parameters (URL, track, etc.). Defaults to `{}`. |

## Returns

`Promise<any>` — The newly-started stream record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 118.
