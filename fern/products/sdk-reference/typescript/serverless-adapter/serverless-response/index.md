---
slug: "/reference/typescript/serverless-adapter/serverless-response"
title: "ServerlessResponse"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "ServerlessAdapter.ServerlessResponse"
  parent: "ServerlessAdapter"
  module: "ServerlessAdapter"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts"
---
# `ServerlessResponse`

Normalized outgoing response returned to a serverless platform.

## Signature

```typescript
interface ServerlessResponse
```

## Properties

| Name         | Type                     | Required | Default | Description                          |
| ------------ | ------------------------ | -------- | ------- | ------------------------------------ |
| `body`       | `string`                 | yes      | —       | Response body as a string.           |
| `headers`    | `Record<string, string>` | yes      | —       | Response headers as key-value pairs. |
| `statusCode` | `number`                 | yes      | —       | HTTP status code.                    |

## Source

[`src/ServerlessAdapter.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts)

Line 36.
