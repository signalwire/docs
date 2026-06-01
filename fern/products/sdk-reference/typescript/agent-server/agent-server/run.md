---
slug: "/reference/typescript/agent-server/agent-server/run"
title: "run"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentServer.AgentServer.run"
  parent: "AgentServer.AgentServer"
  module: "AgentServer"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts"
---
# `run`

Start the HTTP server and begin listening for requests.

This method handles server mode only. For serverless deployments
(AWS Lambda, Google Cloud Functions, Azure Functions), use
[ServerlessAdapter](/reference/typescript/serverless-adapter) instead. When `SWAIG_CLI_MODE=true` is set in
the environment, the call is a no-op so agent config can be inspected
without starting a server.

## Signature

```typescript
run(host?: string, port?: number): Promise<void>
```

## Parameters

| Name   | Type     | Required | Default | Description                                                          |
| ------ | -------- | -------- | ------- | -------------------------------------------------------------------- |
| `host` | `string` | no       | —       | Override the configured hostname. Defaults to the constructor value. |
| `port` | `number` | no       | —       | Override the configured port. Defaults to the constructor value.     |

## Returns

`Promise<void>` — Resolves once the underlying Hono server has begun listening.

## Source

[`src/AgentServer.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts)

Line 420.
