---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/on-summary"
title: "onSummary"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.onSummary"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/ConciergeAgent.ts"
---
# `onSummary`

Process the interaction summary returned at the end of a call.
Logs structured summaries as JSON. Subclasses may override to persist or process.

## Signature

```typescript
onSummary(
  summary: Record<string, unknown> | null,
  _rawData: Record<string, unknown>
): void | Promise<void>
```

## Parameters

| Name       | Type                              | Required | Default | Description |
| ---------- | --------------------------------- | -------- | ------- | ----------- |
| `summary`  | `Record<string, unknown> \| null` | yes      | —       | —           |
| `_rawData` | `Record<string, unknown>`         | yes      | —       | —           |

## Returns

`void | Promise<void>`

## Source

[`src/prefabs/ConciergeAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/ConciergeAgent.ts)

Line 282.
