---
slug: "/reference/typescript/serverless-adapter/serverless-adapter/create-gcf-handler"
title: "createGcfHandler"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ServerlessAdapter.ServerlessAdapter.createGcfHandler"
  parent: "ServerlessAdapter.ServerlessAdapter"
  module: "ServerlessAdapter"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts"
---
# `createGcfHandler`

Create a Google Cloud Functions-compatible handler from a Hono app.

**Modifiers:** `static`

## Signature

```typescript
createGcfHandler(app: { ...1 fields }): (req: any, res: any) => Promise<void>
```

## Parameters

| Name        | Type                                                         | Required | Default | Description                                          |
| ----------- | ------------------------------------------------------------ | -------- | ------- | ---------------------------------------------------- |
| `app`       | `{ fetch: (req: Request) => Response \| Promise<Response> }` | yes      | —       | A Hono-compatible application with a `fetch` method. |
| `app.fetch` | `(req: Request) => Response \| Promise<Response>`            | yes      | —       | —                                                    |

## Returns

`(req: any, res: any) => Promise<void>` — A function that accepts GCF request/response objects.

## Source

[`src/ServerlessAdapter.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts)

Line 200.
