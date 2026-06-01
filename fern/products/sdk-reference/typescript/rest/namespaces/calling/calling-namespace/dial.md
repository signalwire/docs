---
slug: "/reference/typescript/rest/namespaces/calling/calling-namespace/dial"
title: "dial"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.calling.CallingNamespace.dial"
  parent: "rest.namespaces.calling.CallingNamespace"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts"
---
# `dial`

Place an outbound call.

## Signature

```typescript
dial(params: any = {}): Promise<any>
```

## Parameters

| Name     | Type  | Required | Default | Description                                                                  |
| -------- | ----- | -------- | ------- | ---------------------------------------------------------------------------- |
| `params` | `any` | yes      | `{}`    | Platform-shaped dial parameters (from, to, timeout, etc.). Defaults to `{}`. |

## Returns

`Promise<any>` — The dial command response, typically containing a new `call_id`.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/calling.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts)

Line 64.
