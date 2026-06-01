---
slug: "/reference/typescript/serverless-adapter/serverless-adapter/handle-request"
title: "handleRequest"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ServerlessAdapter.ServerlessAdapter.handleRequest"
  parent: "ServerlessAdapter.ServerlessAdapter"
  module: "ServerlessAdapter"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts"
---
# `handleRequest`

Convert a serverless event into a standard Request, route it through the Hono app, and return a normalized response.

## Signature

```typescript
handleRequest(
  app: { ...1 fields },
  event: ServerlessEvent
): Promise<ServerlessResponse>
```

## Parameters

| Name        | Type                                                         | Required | Default | Description                                          |
| ----------- | ------------------------------------------------------------ | -------- | ------- | ---------------------------------------------------- |
| `app`       | `{ fetch: (req: Request) => Response \| Promise<Response> }` | yes      | —       | A Hono-compatible application with a `fetch` method. |
| `app.fetch` | `(req: Request) => Response \| Promise<Response>`            | yes      | —       | —                                                    |
| `event`     | `ServerlessEvent`                                            | yes      | —       | The incoming serverless event to process.            |

## Returns

`Promise<ServerlessResponse>` — The normalized serverless response.

## Source

[`src/ServerlessAdapter.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts)

Line 102.
