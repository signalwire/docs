---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/get-tools"
title: "getTools"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.getTools"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `getTools`

Public access to the list of registered tools.

In Python, `define_tools()` is public and returns `List[SWAIGFunction]`.
In TypeScript, `defineTools()` is a protected setup hook (void). This
method provides the equivalent public "get all tools" capability.

## Signature

```typescript
getTools(): SwaigFunction[]
```

## Returns

`SwaigFunction[]` — Array of all registered SwaigFunction instances.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 370.
