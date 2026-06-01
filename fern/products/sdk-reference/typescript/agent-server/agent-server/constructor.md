---
slug: "/reference/typescript/agent-server/agent-server/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentServer.AgentServer.constructor"
  parent: "AgentServer.AgentServer"
  module: "AgentServer"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts"
---
# `constructor`

Create an AgentServer.

## Signature

```typescript
constructor(opts?: { ...3 fields }): AgentServer
```

## Parameters

| Name            | Type                                                  | Required | Default | Description                                                                             |
| --------------- | ----------------------------------------------------- | -------- | ------- | --------------------------------------------------------------------------------------- |
| `opts`          | `{ host?: string; logLevel?: string; port?: number }` | no       | —       | Optional host, port, and logLevel overrides; defaults to 0.0.0.0:3000, logLevel 'info'. |
| `opts.host`     | `string`                                              | no       | —       | —                                                                                       |
| `opts.logLevel` | `string`                                              | no       | —       | —                                                                                       |
| `opts.port`     | `number`                                              | no       | —       | —                                                                                       |

## Returns

`AgentServer`

## Source

[`src/AgentServer.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts)

Line 97.
