---
slug: "/reference/typescript/agent-server/agent-server/register-sip-username"
title: "registerSipUsername"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentServer.AgentServer.registerSipUsername"
  parent: "AgentServer.AgentServer"
  module: "AgentServer"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts"
---
# `registerSipUsername`

Register a mapping from a SIP username to an agent route at the server level.

Allows callers to manually route an arbitrary SIP username to any already-registered
agent route, independent of the automatic mapping performed by `setupSipRouting`.

## Signature

```typescript
registerSipUsername(username: string, route: string): void
```

## Parameters

| Name       | Type     | Required | Default | Description                                                                                       |
| ---------- | -------- | -------- | ------- | ------------------------------------------------------------------------------------------------- |
| `username` | `string` | yes      | —       | The SIP username to map (stored lowercase).                                                       |
| `route`    | `string` | yes      | —       | The agent route to map the username to (leading `/` added if missing; trailing slashes stripped). |

## Returns

`void`

## Source

[`src/AgentServer.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentServer.ts)

Line 310.
