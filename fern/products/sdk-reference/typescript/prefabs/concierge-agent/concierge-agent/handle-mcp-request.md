---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/handle-mcp-request"
title: "handleMcpRequest"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.handleMcpRequest"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `handleMcpRequest`

Handle an MCP JSON-RPC 2.0 request. Returns the response object.

## Signature

```typescript
handleMcpRequest(
  body: Record<string, unknown>
): Promise<Record<string, unknown>>
```

## Parameters

| Name   | Type                      | Required | Default | Description |
| ------ | ------------------------- | -------- | ------- | ----------- |
| `body` | `Record<string, unknown>` | yes      | —       | —           |

## Returns

`Promise<Record<string, unknown>>`

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1203.
