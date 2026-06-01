---
slug: "/reference/typescript/rest/namespaces/calling/calling-namespace/detect"
title: "detect"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.calling.CallingNamespace.detect"
  parent: "rest.namespaces.calling.CallingNamespace"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts"
---
# `detect`

Run answering-machine / fax / DTMF detection.

## Signature

```typescript
detect(callId: string, params: any = {}): Promise<any>
```

## Parameters

| Name     | Type     | Required | Default | Description                             |
| -------- | -------- | -------- | ------- | --------------------------------------- |
| `callId` | `string` | yes      | —       | Target call's ID.                       |
| `params` | `any`    | yes      | `{}`    | Detect configuration. Defaults to `{}`. |

## Returns

`Promise<any>` — The detect command response containing a `control_id`.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/calling.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts)

Line 281.
