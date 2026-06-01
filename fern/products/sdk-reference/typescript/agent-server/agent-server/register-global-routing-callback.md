---
slug: "/reference/typescript/agent-server/agent-server/register-global-routing-callback"
title: "registerGlobalRoutingCallback"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentServer.AgentServer.registerGlobalRoutingCallback"
  parent: "AgentServer.AgentServer"
  module: "AgentServer"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts"
---
# `registerGlobalRoutingCallback`

Register a routing callback across all agents at the given path.

This allows unified routing logic to be applied to all agents from
a central server-level coordinator.

## Signature

```typescript
registerGlobalRoutingCallback(callbackFn: RoutingCallback, path: string): void
```

## Parameters

| Name         | Type              | Required | Default | Description                                                                                    |
| ------------ | ----------------- | -------- | ------- | ---------------------------------------------------------------------------------------------- |
| `callbackFn` | `RoutingCallback` | yes      | —       | The callback function that receives a request and body, returning a route string or undefined. |
| `path`       | `string`          | yes      | —       | The path to register the callback at.                                                          |

## Returns

`void`

## Source

[`src/AgentServer.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts)

Line 338.
