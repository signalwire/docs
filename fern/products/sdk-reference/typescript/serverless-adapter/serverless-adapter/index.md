---
slug: "/reference/typescript/serverless-adapter/serverless-adapter"
title: "ServerlessAdapter"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "ServerlessAdapter.ServerlessAdapter"
  parent: "ServerlessAdapter"
  module: "ServerlessAdapter"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts"
---
# `ServerlessAdapter`

Adapts a Hono application for deployment on AWS Lambda, Google Cloud Functions, Azure Functions, or CGI.

Accepts the provider's native event shape (`APIGatewayProxyEvent`, Google Functions `Request`,
Azure function arguments, CGI env + stdin) and returns a provider-native response.

## Signature

```typescript
class ServerlessAdapter
```

## Examples

```typescript
import { AgentBase, ServerlessAdapter } from '@signalwire/sdk';

const agent = new AgentBase({ name: 'lambda', route: '/' });
agent.setPromptText('You are a helpful assistant.');

const adapter = new ServerlessAdapter('aws');

export const handler = async (event: any) => {
  return adapter.handleRequest(agent.asRouter(), event);
};
```

## Methods

- [`constructor`](/reference/typescript/serverless-adapter/serverless-adapter/constructor) — Create a ServerlessAdapter for the given platform.
- [`createAzureHandler`](/reference/typescript/serverless-adapter/serverless-adapter/create-azure-handler) — Create an Azure Functions-compatible handler from a Hono app.
- [`createGcfHandler`](/reference/typescript/serverless-adapter/serverless-adapter/create-gcf-handler) — Create a Google Cloud Functions-compatible handler from a Hono app.
- [`createLambdaHandler`](/reference/typescript/serverless-adapter/serverless-adapter/create-lambda-handler) — Create an AWS Lambda-compatible handler function from a Hono app.
- [`detectPlatform`](/reference/typescript/serverless-adapter/serverless-adapter/detect-platform) — Detect the serverless platform by inspecting well-known environment variables.
- [`generateUrl`](/reference/typescript/serverless-adapter/serverless-adapter/generate-url) — Generate the platform-specific invocation URL for a deployed function.
- [`getPlatform`](/reference/typescript/serverless-adapter/serverless-adapter/get-platform) — Get the resolved platform identifier.
- [`handleRequest`](/reference/typescript/serverless-adapter/serverless-adapter/handle-request) — Convert a serverless event into a standard Request, route it through the Hono app, and return a normalized response.

## Source

[`src/ServerlessAdapter.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ServerlessAdapter.ts)

Line 65.
