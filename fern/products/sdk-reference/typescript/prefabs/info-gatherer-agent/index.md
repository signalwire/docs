---
slug: "/reference/typescript/prefabs/info-gatherer-agent"
title: "InfoGathererAgent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent"
  module: "prefabs"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/InfoGathererAgent.ts"
---
# `InfoGathererAgent`

## Signature

```typescript
module InfoGathererAgent
```

## Functions

- [`createInfoGathererAgent`](/reference/typescript/prefabs/info-gatherer-agent/create-info-gatherer-agent) — Factory function that creates and returns a new InfoGathererAgent.

## Type Aliases

- [`InfoGathererQuestionCallback`](/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-question-callback) — Callback invoked on each incoming SWML request to produce the list of questions for that request. Mirrors Python's `set_question_callback`.

## Classes

- [`InfoGathererAgent`](/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent) — Prefab agent that gathers caller information one question at a time.

## Interfaces

- [`InfoGathererConfig`](/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-config) — Configuration for the InfoGathererAgent.
- [`InfoGathererQuestion`](/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-question) — A single question in the information-gathering flow.

## Source

[`src/prefabs/InfoGathererAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/InfoGathererAgent.ts)

Line 1.
