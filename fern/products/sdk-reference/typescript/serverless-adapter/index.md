---
slug: "/reference/typescript/serverless-adapter"
title: "ServerlessAdapter"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "ServerlessAdapter"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts"
---
# `ServerlessAdapter`

## Signature

```typescript
module ServerlessAdapter
```

## Type Aliases

- [`ServerlessPlatform`](/reference/typescript/serverless-adapter/serverless-platform) — Supported serverless platform identifiers, or 'auto' for environment-based detection.

## Classes

- [`ServerlessAdapter`](/reference/typescript/serverless-adapter/serverless-adapter) — Adapts a Hono application for deployment on AWS Lambda, Google Cloud Functions, Azure Functions, or CGI.

## Interfaces

- [`ServerlessEvent`](/reference/typescript/serverless-adapter/serverless-event) — Normalized incoming event from a serverless platform.
- [`ServerlessResponse`](/reference/typescript/serverless-adapter/serverless-response) — Normalized outgoing response returned to a serverless platform.

## Source

[`src/ServerlessAdapter.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts)

Line 1.
