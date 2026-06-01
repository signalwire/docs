---
slug: "/reference/typescript/serverless-adapter/serverless-adapter/create-lambda-handler"
title: "createLambdaHandler"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ServerlessAdapter.ServerlessAdapter.createLambdaHandler"
  parent: "ServerlessAdapter.ServerlessAdapter"
  module: "ServerlessAdapter"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts"
---
# `createLambdaHandler`

Create an AWS Lambda-compatible handler function from a Hono app.

**Modifiers:** `static`

## Signature

```typescript
createLambdaHandler(
  app: { ...1 fields }
): (event: ServerlessEvent) => Promise<ServerlessResponse>
```

## Parameters

| Name        | Type                                                         | Required | Default | Description                                          |
| ----------- | ------------------------------------------------------------ | -------- | ------- | ---------------------------------------------------- |
| `app`       | `{ fetch: (req: Request) => Response \| Promise<Response> }` | yes      | —       | A Hono-compatible application with a `fetch` method. |
| `app.fetch` | `(req: Request) => Response \| Promise<Response>`            | yes      | —       | —                                                    |

## Returns

`(event: ServerlessEvent) => Promise<ServerlessResponse>` — A function that accepts a Lambda event and returns a promise of a serverless response.

## Source

[`src/ServerlessAdapter.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts)

Line 190.
