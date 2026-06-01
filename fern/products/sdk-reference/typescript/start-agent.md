---
slug: "/reference/typescript/start-agent"
title: "startAgent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "startAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/index.ts"
---
# `startAgent`

Start an agent's HTTP server.

Equivalent to Python's `start_agent(agent)`. Delegates to `agent.serve(options)`.

## Signature

```typescript
startAgent(agent: AgentBase, options?: { ...2 fields }): Promise<void>
```

## Parameters

| Name           | Type                               | Required | Default | Description                                                                                                                        |
| -------------- | ---------------------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `agent`        | `AgentBase`                        | yes      | —       | The [AgentBase](/reference/typescript/agent-base) instance to start.                                                               |
| `options`      | `{ host?: string; port?: number }` | no       | —       | Optional host / port overrides. When omitted, values come from the agent's constructor options or the `PORT` environment variable. |
| `options.host` | `string`                           | no       | —       | —                                                                                                                                  |
| `options.port` | `number`                           | no       | —       | —                                                                                                                                  |

## Returns

`Promise<void>` — Resolves once the HTTP server has begun listening.

## Examples

```typescript
import { AgentBase, startAgent } from '@signalwire/sdk';

const agent = new AgentBase({ name: 'demo' });
await startAgent(agent, { port: 3000 });
```

## Source

[`src/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/index.ts)

Line 333.
