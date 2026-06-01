---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/add-pronunciation"
title: "addPronunciation"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.addPronunciation"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addPronunciation`

Add a pronunciation override rule for the TTS engine.

## Signature

```typescript
addPronunciation(rule: PronunciationRule): this
```

## Parameters

| Name   | Type                | Required | Default | Description                                                           |
| ------ | ------------------- | -------- | ------- | --------------------------------------------------------------------- |
| `rule` | `PronunciationRule` | yes      | —       | Pronunciation rule specifying the text to replace and its substitute. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 773.
