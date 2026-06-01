---
slug: "/reference/typescript/serverless-adapter/serverless-event"
title: "ServerlessEvent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "ServerlessAdapter.ServerlessEvent"
  parent: "ServerlessAdapter"
  module: "ServerlessAdapter"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts"
---
# `ServerlessEvent`

Normalized incoming event from a serverless platform.

## Signature

```typescript
interface ServerlessEvent
```

## Properties

| Name                    | Type                                | Required | Default | Description                                            |
| ----------------------- | ----------------------------------- | -------- | ------- | ------------------------------------------------------ |
| `body`                  | `string \| Record<string, unknown>` | no       | —       | Request body, either raw JSON string or parsed object. |
| `headers`               | `Record<string, string>`            | no       | —       | Request headers as key-value pairs.                    |
| `httpMethod`            | `string`                            | no       | —       | HTTP method (AWS Lambda style).                        |
| `method`                | `string`                            | no       | —       | HTTP method (GCF/Azure style).                         |
| `path`                  | `string`                            | no       | —       | Request path.                                          |
| `queryStringParameters` | `Record<string, string>`            | no       | —       | Query string parameters as key-value pairs.            |
| `rawPath`               | `string`                            | no       | —       | Raw request path (AWS API Gateway v2).                 |
| `requestContext`        | `Record<string, unknown>`           | no       | —       | Platform-specific request context metadata.            |

## Source

[`src/ServerlessAdapter.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts)

Line 16.
