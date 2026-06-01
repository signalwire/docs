---
slug: "/reference/typescript/prefabs/survey-agent/survey-agent/on-debug-event"
title: "onDebugEvent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyAgent.onDebugEvent"
  parent: "prefabs.SurveyAgent.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `onDebugEvent`

Lifecycle hook called when a debug event webhook is received. Override in subclasses.

## Signature

```typescript
onDebugEvent(_event: Record<string, unknown>): void | Promise<void>
```

## Parameters

| Name     | Type                      | Required | Default | Description              |
| -------- | ------------------------- | -------- | ------- | ------------------------ |
| `_event` | `Record<string, unknown>` | yes      | —       | The debug event payload. |

## Returns

`void | Promise<void>`

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1951.
