---
slug: "/reference/typescript/prefabs/survey-agent/survey-agent/set-on-request-callback"
title: "setOnRequestCallback"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyAgent.setOnRequestCallback"
  parent: "prefabs.SurveyAgent.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `setOnRequestCallback`

Set a callback invoked per-request to dynamically build SWML.
When set, the static SwmlBuilder is ignored and the callback's
returned SwmlBuilder is used instead.

## Signature

```typescript
setOnRequestCallback(cb: OnRequestCallback): this
```

## Parameters

| Name | Type                | Required | Default | Description                                                |
| ---- | ------------------- | -------- | ------- | ---------------------------------------------------------- |
| `cb` | `OnRequestCallback` | yes      | —       | Callback receiving query params, body params, and headers. |

## Returns

`this` — This service for chaining.

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 850.
