---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-question"
title: "InfoGathererQuestion"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererQuestion"
  parent: "prefabs.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/InfoGathererAgent.ts"
---
# `InfoGathererQuestion`

A single question in the information-gathering flow.

## Signature

```typescript
interface InfoGathererQuestion
```

## Properties

| Name            | Type      | Required | Default | Description                                                         |
| --------------- | --------- | -------- | ------- | ------------------------------------------------------------------- |
| `confirm`       | `boolean` | no       | —       | When true, the agent insists the caller confirms before submitting. |
| `key_name`      | `string`  | yes      | —       | Identifier used as the key when storing the caller's answer.        |
| `question_text` | `string`  | yes      | —       | The question text to ask the caller.                                |

## Source

[`src/prefabs/InfoGathererAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/InfoGathererAgent.ts)

Line 17.
