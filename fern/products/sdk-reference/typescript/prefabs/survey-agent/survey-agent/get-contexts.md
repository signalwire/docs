---
slug: "/reference/typescript/prefabs/survey-agent/survey-agent/get-contexts"
title: "getContexts"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyAgent.getContexts"
  parent: "prefabs.SurveyAgent.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `getContexts`

Get the contexts dictionary as serialised SWML, or null when no
contexts have been defined yet.

Matches Python `PromptManager.get_contexts()` which returns the
contexts dict or `None`.

## Signature

```typescript
getContexts(): Record<string, unknown> | null
```

## Returns

`Record<string, unknown> | null` — Contexts dict, or null when no contexts are defined.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 640.
