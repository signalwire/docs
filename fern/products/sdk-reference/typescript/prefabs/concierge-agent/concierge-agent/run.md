---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/run"
title: "run"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.run"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `run`

Alias for [serve](/reference/typescript/prefabs/concierge-agent/concierge-agent/serve). Starts the HTTP server.

## Signature

```typescript
run(opts?: { ...2 fields }): Promise<void>
```

## Parameters

| Name        | Type                               | Required | Default | Description                       |
| ----------- | ---------------------------------- | -------- | ------- | --------------------------------- |
| `opts`      | `{ host?: string; port?: number }` | no       | —       | Optional host and port overrides. |
| `opts.host` | `string`                           | no       | —       | —                                 |
| `opts.port` | `number`                           | no       | —       | —                                 |

## Returns

`Promise<void>` — A promise that resolves once the server is running.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 2683.
