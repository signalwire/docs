---
slug: "/reference/typescript/agent-base"
title: "AgentBase"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "AgentBase"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `AgentBase`

## Signature

```typescript
module AgentBase
```

## Type Aliases

- [`RoutingCallback`](/reference/typescript/agent-base/routing-callback) — Callback invoked at a registered routing endpoint to determine how to handle an incoming request. Return a route string to redirect to that agent route, or null / undefined to let normal SWML processing continue.

## Classes

- [`AgentBase`](/reference/typescript/agent-base/agent-base) — Core agent class that composes an HTTP server, prompt management, session handling, SWAIG tool registry, and 5-phase SWML rendering into a single deployable unit.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1.
