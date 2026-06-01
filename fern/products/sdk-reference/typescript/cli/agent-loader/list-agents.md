---
slug: "/reference/typescript/cli/agent-loader/list-agents"
title: "listAgents"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "cli.agent-loader.listAgents"
  parent: "cli.agent-loader"
  module: "cli.agent-loader"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/cli/agent-loader.ts"
---
# `listAgents`

List all exported agent instances and classes in a module.

## Signature

```typescript
listAgents(agentPath: string): Promise<string[]>
```

## Parameters

| Name        | Type     | Required | Default | Description                    |
| ----------- | -------- | -------- | ------- | ------------------------------ |
| `agentPath` | `string` | yes      | —       | Path to the agent module file. |

## Returns

`Promise<string[]>` — Array of export names that are AgentBase instances or subclasses.

## Source

[`src/cli/agent-loader.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/cli/agent-loader.ts)

Line 157.
