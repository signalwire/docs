---
slug: "/reference/typescript/prefabs/survey-agent/survey-agent/reset-contexts"
title: "resetContexts"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyAgent.resetContexts"
  parent: "prefabs.SurveyAgent.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `resetContexts`

Remove all contexts, returning the agent to a no-contexts state.

This is a convenience wrapper around `defineContexts().reset()`.
Use it in a dynamic config callback when you need to rebuild
contexts from scratch for a specific request.

## Signature

```typescript
resetContexts(): this
```

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 624.
