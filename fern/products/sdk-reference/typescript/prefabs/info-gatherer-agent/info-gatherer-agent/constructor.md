---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.constructor"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/InfoGathererAgent.ts"
---
# `constructor`

Create an InfoGathererAgent.

## Signature

```typescript
constructor(config: InfoGathererConfig = {}): InfoGathererAgent
```

## Parameters

| Name     | Type                 | Required | Default | Description                                                                                                            |
| -------- | -------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------- |
| `config` | `InfoGathererConfig` | yes      | `{}`    | Either `questions` (static mode) or leave omitted and use `questionCallback` / `setQuestionCallback()` (dynamic mode). |

## Returns

`InfoGathererAgent`

## Source

[`src/prefabs/InfoGathererAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/InfoGathererAgent.ts)

Line 116.
