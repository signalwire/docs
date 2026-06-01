---
slug: "/reference/typescript/rest/namespaces/calling/calling-namespace/denoise-stop"
title: "denoiseStop"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.calling.CallingNamespace.denoiseStop"
  parent: "rest.namespaces.calling.CallingNamespace"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts"
---
# `denoiseStop`

Disable noise reduction.

## Signature

```typescript
denoiseStop(callId: string, params: any = {}): Promise<any>
```

## Parameters

| Name     | Type     | Required | Default | Description                                   |
| -------- | -------- | -------- | ------- | --------------------------------------------- |
| `callId` | `string` | yes      | —       | Target call's ID.                             |
| `params` | `any`    | yes      | `{}`    | Platform-shaped parameters. Defaults to `{}`. |

## Returns

`Promise<any>` — The platform's response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/calling.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts)

Line 372.
