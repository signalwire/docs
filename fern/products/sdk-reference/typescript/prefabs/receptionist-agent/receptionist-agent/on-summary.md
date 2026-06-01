---
slug: "/reference/typescript/prefabs/receptionist-agent/receptionist-agent/on-summary"
title: "onSummary"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ReceptionistAgent.ReceptionistAgent.onSummary"
  parent: "prefabs.ReceptionistAgent.ReceptionistAgent"
  module: "prefabs.ReceptionistAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/ReceptionistAgent.ts"
---
# `onSummary`

Python-style receptionist summary hook. Default is a no-op; subclasses
may override to persist the summary. Mirrors Python `on_summary`
(receptionist.py lines 278–287).

## Signature

```typescript
onSummary(
  _summary: Record<string, unknown> | null,
  _rawData: Record<string, unknown>
): void | Promise<void>
```

## Parameters

| Name       | Type                              | Required | Default | Description |
| ---------- | --------------------------------- | -------- | ------- | ----------- |
| `_summary` | `Record<string, unknown> \| null` | yes      | —       | —           |
| `_rawData` | `Record<string, unknown>`         | yes      | —       | —           |

## Returns

`void | Promise<void>`

## Source

[`src/prefabs/ReceptionistAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/ReceptionistAgent.ts)

Line 376.
