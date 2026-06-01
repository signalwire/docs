---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/render-swml"
title: "renderSwml"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.renderSwml"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `renderSwml`

Render the complete SWML document by assembling all 5 phases: pre-answer, answer,
post-answer, AI, and post-AI verbs.

## Signature

```typescript
renderSwml(callId?: string, modifications?: Record<string, unknown>): string
```

## Parameters

| Name            | Type                      | Required | Default | Description                                                                                                                                                                                                                            |
| --------------- | ------------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `callId`        | `string`                  | no       | —       | Optional call ID to use for session tokens; auto-generated if omitted.                                                                                                                                                                 |
| `modifications` | `Record<string, unknown>` | no       | —       | Optional dict returned from `onSwmlRequest` to merge into the AI verb config before rendering. Matches Python's `_render_swml(modifications)` semantics: `global_data` is deep-merged; all other keys override the AI config directly. |

## Returns

`string` — The rendered SWML document as a JSON string.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 2000.
