---
slug: "/reference/typescript/prefabs/survey-agent/survey-agent/add-mcp-server"
title: "addMcpServer"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyAgent.addMcpServer"
  parent: "prefabs.SurveyAgent.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addMcpServer`

Add an external MCP server for tool discovery and invocation.
Tools are discovered via MCP protocol at session start and added to the AI's tool list.

## Signature

```typescript
addMcpServer(url: string, opts?: { ...3 fields }): this
```

## Parameters

| Name                | Type                                                                                               | Required | Default | Description                                              |
| ------------------- | -------------------------------------------------------------------------------------------------- | -------- | ------- | -------------------------------------------------------- |
| `url`               | `string`                                                                                           | yes      | —       | MCP server HTTP endpoint URL                             |
| `opts`              | `{ headers?: Record<string, string>; resources?: boolean; resourceVars?: Record<string, string> }` | no       | —       | Optional configuration: headers, resources, resourceVars |
| `opts.headers`      | `Record<string, string>`                                                                           | no       | —       | —                                                        |
| `opts.resources`    | `boolean`                                                                                          | no       | —       | —                                                        |
| `opts.resourceVars` | `Record<string, string>`                                                                           | no       | —       | —                                                        |

## Returns

`this` — This agent instance for chaining

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1145.
