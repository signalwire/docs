---
slug: "/reference/typescript/agent-server/agent-server/unregister"
title: "unregister"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentServer.AgentServer.unregister"
  parent: "AgentServer.AgentServer"
  module: "AgentServer"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts"
---
# `unregister`

Remove an agent registration by route.

## Signature

```typescript
unregister(route: string): boolean
```

## Parameters

| Name    | Type     | Required | Default | Description                     |
| ------- | -------- | -------- | ------- | ------------------------------- |
| `route` | `string` | yes      | —       | The route prefix to unregister. |

## Returns

`boolean` — True if the agent was found and removed, false if not found.

## Source

[`src/AgentServer.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts)

Line 172.
