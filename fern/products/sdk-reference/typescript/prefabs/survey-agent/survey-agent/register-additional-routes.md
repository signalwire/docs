---
slug: "/reference/typescript/prefabs/survey-agent/survey-agent/register-additional-routes"
title: "registerAdditionalRoutes"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyAgent.registerAdditionalRoutes"
  parent: "prefabs.SurveyAgent.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
  visibility: "protected"
---
# `registerAdditionalRoutes`

Extension point: register additional Hono routes after SWMLService
mounts /health, /ready, /swaig, and the main route. AgentBase uses
this to add /post\_prompt, /check\_for\_input, /debug\_events, /mcp.

## Signature

```typescript
registerAdditionalRoutes(_app: Hono): void
```

## Parameters

| Name   | Type   | Required | Default | Description |
| ------ | ------ | -------- | ------- | ----------- |
| `_app` | `Hono` | yes      | —       | —           |

## Returns

`void`

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 604.
