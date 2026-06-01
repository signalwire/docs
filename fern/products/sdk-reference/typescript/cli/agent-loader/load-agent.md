---
slug: "/reference/typescript/cli/agent-loader/load-agent"
title: "loadAgent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "cli.agent-loader.loadAgent"
  parent: "cli.agent-loader"
  module: "cli.agent-loader"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/cli/agent-loader.ts"
---
# `loadAgent`

Dynamically import an agent file and resolve an AgentBase instance using duck-typing heuristics.

## Signature

```typescript
loadAgent(agentPath: string, agentClass?: string): Promise<unknown>
```

## Parameters

| Name         | Type     | Required | Default | Description                                                    |
| ------------ | -------- | -------- | ------- | -------------------------------------------------------------- |
| `agentPath`  | `string` | yes      | —       | Path to the agent module file.                                 |
| `agentClass` | `string` | no       | —       | Optional name of a specific exported class or instance to use. |

## Returns

`Promise<unknown>` — The resolved AgentBase instance.

## Source

[`src/cli/agent-loader.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/cli/agent-loader.ts)

Line 86.
