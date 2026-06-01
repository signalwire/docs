---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-question-callback"
title: "InfoGathererQuestionCallback"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "type_alias"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererQuestionCallback"
  parent: "prefabs.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/InfoGathererAgent.ts"
---
# `InfoGathererQuestionCallback`

Callback invoked on each incoming SWML request to produce the list of
questions for that request. Mirrors Python's `set_question_callback`.

## Signature

```typescript
type InfoGathererQuestionCallback = (queryParams: Record<string, string>, bodyParams: Record<string, unknown>, headers: Record<string, string>) => InfoGathererQuestion[] | Promise<InfoGathererQuestion[]>
```

## Source

[`src/prefabs/InfoGathererAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/InfoGathererAgent.ts)

Line 31.
