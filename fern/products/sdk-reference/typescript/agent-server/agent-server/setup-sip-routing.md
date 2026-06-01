---
slug: "/reference/typescript/agent-server/agent-server/setup-sip-routing"
title: "setupSipRouting"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentServer.AgentServer.setupSipRouting"
  parent: "AgentServer.AgentServer"
  module: "AgentServer"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts"
---
# `setupSipRouting`

Set up central SIP-based routing for the server.

This configures all agents to handle SIP requests at the specified path,
using a coordinated routing system where each agent checks if it can
handle SIP requests for specific usernames.

## Signature

```typescript
setupSipRouting(route: string = '/sip', autoMap: boolean = true): void
```

## Parameters

| Name      | Type      | Required | Default  | Description                                                                 |
| --------- | --------- | -------- | -------- | --------------------------------------------------------------------------- |
| `route`   | `string`  | yes      | `'/sip'` | The path for SIP routing (default: '/sip').                                 |
| `autoMap` | `boolean` | yes      | `true`   | Whether to automatically map SIP usernames to agent routes (default: true). |

## Returns

`void`

## Source

[`src/AgentServer.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts)

Line 254.
