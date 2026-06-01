---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/set-question-callback"
title: "setQuestionCallback"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.setQuestionCallback"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/InfoGathererAgent.ts"
---
# `setQuestionCallback`

Register a callback for dynamic question configuration. The callback is
invoked on each incoming SWML request with the query params, body, and
headers, and must return the list of questions to ask on that call.
Mirrors Python `set_question_callback`.

## Signature

```typescript
setQuestionCallback(callback: InfoGathererQuestionCallback): this
```

## Parameters

| Name       | Type                           | Required | Default | Description |
| ---------- | ------------------------------ | -------- | ------- | ----------- |
| `callback` | `InfoGathererQuestionCallback` | yes      | —       | —           |

## Returns

`this`

## Source

[`src/prefabs/InfoGathererAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/InfoGathererAgent.ts)

Line 159.
