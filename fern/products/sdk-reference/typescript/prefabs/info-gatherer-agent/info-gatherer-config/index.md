---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-config"
title: "InfoGathererConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererConfig"
  parent: "prefabs.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/InfoGathererAgent.ts"
---
# `InfoGathererConfig`

Configuration for the InfoGathererAgent.

## Signature

```typescript
interface InfoGathererConfig
```

## Properties

| Name               | Type                           | Required | Default | Description                                                                                                                                                                                        |
| ------------------ | ------------------------------ | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `agentOptions`     | `Partial<AgentOptions>`        | no       | —       | Additional AgentBase options forwarded to super().                                                                                                                                                 |
| `name`             | `string`                       | no       | —       | Agent display name (defaults to `"info_gatherer"`).                                                                                                                                                |
| `questionCallback` | `InfoGathererQuestionCallback` | no       | —       | Convenience alternative to calling `setQuestionCallback()` after construction. Only consulted when `questions` is not provided.                                                                    |
| `questions`        | `InfoGathererQuestion[]`       | no       | —       | Optional list of questions to ask. When omitted, the agent runs in dynamic mode and resolves questions via the callback registered with `setQuestionCallback()` (or via `questionCallback` below). |
| `route`            | `string`                       | no       | —       | HTTP route for this agent (defaults to `"/info_gatherer"`).                                                                                                                                        |

## Source

[`src/prefabs/InfoGathererAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/InfoGathererAgent.ts)

Line 38.
