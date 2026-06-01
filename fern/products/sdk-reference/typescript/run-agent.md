---
slug: "/reference/typescript/run-agent"
title: "runAgent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "runAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/index.ts"
---
# `runAgent`

Run an agent's HTTP server.

Alias for [startAgent](/reference/typescript/start-agent) — equivalent to Python's `run_agent(agent)`.
Delegates to `agent.serve(options)`.

## Signature

```typescript
runAgent(agent: AgentBase, options?: { ...2 fields }): Promise<void>
```

## Parameters

| Name           | Type                               | Required | Default | Description                                                                                                                        |
| -------------- | ---------------------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `agent`        | `AgentBase`                        | yes      | —       | The [AgentBase](/reference/typescript/agent-base) instance to run.                                                                 |
| `options`      | `{ host?: string; port?: number }` | no       | —       | Optional host / port overrides. When omitted, values come from the agent's constructor options or the `PORT` environment variable. |
| `options.host` | `string`                           | no       | —       | —                                                                                                                                  |
| `options.port` | `number`                           | no       | —       | —                                                                                                                                  |

## Returns

`Promise<void>` — Resolves once the HTTP server has begun listening.

## See Also

- \[[startAgent](/reference/typescript/start-agent)]\(xref://[startAgent](/reference/typescript/start-agent))

## Source

[`src/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/index.ts)

Line 353.
