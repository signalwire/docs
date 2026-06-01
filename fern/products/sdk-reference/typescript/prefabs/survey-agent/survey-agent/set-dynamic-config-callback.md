---
slug: "/reference/typescript/prefabs/survey-agent/survey-agent/set-dynamic-config-callback"
title: "setDynamicConfigCallback"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyAgent.setDynamicConfigCallback"
  parent: "prefabs.SurveyAgent.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `setDynamicConfigCallback`

Set a callback invoked on each SWML request to dynamically modify an ephemeral agent copy.

The callback receives a clone of this agent — mutations apply only to the current
request, so you can vary prompt, tools, languages, params, or global data per call
without affecting the long-lived agent instance.

## Signature

```typescript
setDynamicConfigCallback(cb: DynamicConfigCallback): this
```

## Parameters

| Name | Type                    | Required | Default | Description                                                                                                                             |
| ---- | ----------------------- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `cb` | `DynamicConfigCallback` | yes      | —       | Callback receiving `(queryParams, bodyParams, headers, agent)` where `agent` is the ephemeral `AgentBase` copy to mutate. May be async. |

## Returns

`this` — This agent instance for chaining.

## Examples

```typescript
agent.setDynamicConfigCallback((query, body, headers, agent) => {
  const lang = query.lang ?? 'en';
  if (lang === 'es') {
    (agent as AgentBase).setPromptText('Eres un asistente útil.');
  }
});
```

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1704.
