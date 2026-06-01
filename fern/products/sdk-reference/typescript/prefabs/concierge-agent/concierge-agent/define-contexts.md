---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/define-contexts"
title: "defineContexts"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.defineContexts"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `defineContexts`

Define or replace the contexts configuration for the AI verb.

## Signature

```typescript
defineContexts(
  contexts?: Record<string, unknown> | ContextBuilder
): ContextBuilder
```

## Parameters

| Name       | Type                                        | Required | Default | Description                                                                                        |
| ---------- | ------------------------------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------- |
| `contexts` | `Record<string, unknown> \| ContextBuilder` | no       | —       | An existing ContextBuilder instance or a plain object; a new ContextBuilder is created if omitted. |

## Returns

`ContextBuilder` — The active ContextBuilder for further configuration.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 603.
