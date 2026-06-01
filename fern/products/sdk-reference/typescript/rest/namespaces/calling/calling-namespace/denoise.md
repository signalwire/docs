---
slug: "/reference/typescript/rest/namespaces/calling/calling-namespace/denoise"
title: "denoise"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.calling.CallingNamespace.denoise"
  parent: "rest.namespaces.calling.CallingNamespace"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts"
---
# `denoise`

Enable noise reduction on the call.

## Signature

```typescript
denoise(callId: string, params: any = {}): Promise<any>
```

## Parameters

| Name     | Type     | Required | Default | Description                              |
| -------- | -------- | -------- | ------- | ---------------------------------------- |
| `callId` | `string` | yes      | —       | Target call's ID.                        |
| `params` | `any`    | yes      | `{}`    | Denoise configuration. Defaults to `{}`. |

## Returns

`Promise<any>` — The platform's response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/calling.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts)

Line 360.
