---
slug: "/reference/typescript/rest/namespaces/calling/calling-namespace/collect"
title: "collect"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.calling.CallingNamespace.collect"
  parent: "rest.namespaces.calling.CallingNamespace"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts"
---
# `collect`

Collect DTMF / speech input from the caller.

## Signature

```typescript
collect(callId: string, params: any = {}): Promise<any>
```

## Parameters

| Name     | Type     | Required | Default | Description                                                                   |
| -------- | -------- | -------- | ------- | ----------------------------------------------------------------------------- |
| `callId` | `string` | yes      | —       | Target call's ID.                                                             |
| `params` | `any`    | yes      | `{}`    | Collect configuration (`digits`, `speech`, timeouts, etc.). Defaults to `{}`. |

## Returns

`Promise<any>` — The collect command response containing a `control_id`.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/calling.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts)

Line 242.
