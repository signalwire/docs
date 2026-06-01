---
slug: "/reference/typescript/serverless-adapter/serverless-adapter/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ServerlessAdapter.ServerlessAdapter.constructor"
  parent: "ServerlessAdapter.ServerlessAdapter"
  module: "ServerlessAdapter"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts"
---
# `constructor`

Create a ServerlessAdapter for the given platform.

## Signature

```typescript
constructor(platform: ServerlessPlatform = 'auto'): ServerlessAdapter
```

## Parameters

| Name       | Type                 | Required | Default  | Description                                                                   |
| ---------- | -------------------- | -------- | -------- | ----------------------------------------------------------------------------- |
| `platform` | `ServerlessPlatform` | yes      | `'auto'` | Target platform; defaults to 'auto' which detects from environment variables. |

## Returns

`ServerlessAdapter`

## Source

[`src/ServerlessAdapter.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts)

Line 72.
