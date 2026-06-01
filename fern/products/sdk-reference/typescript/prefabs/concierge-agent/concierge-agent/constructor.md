---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.constructor"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/ConciergeAgent.ts"
---
# `constructor`

Create a ConciergeAgent for a venue with the given services, amenities, and hours.

## Signature

```typescript
constructor(config: ConciergeConfig): ConciergeAgent
```

## Parameters

| Name     | Type              | Required | Default | Description                                                                                       |
| -------- | ----------------- | -------- | ------- | ------------------------------------------------------------------------------------------------- |
| `config` | `ConciergeConfig` | yes      | —       | Configuration including venue name, services, amenities, and optional hours/instructions/welcome. |

## Returns

`ConciergeAgent`

## Source

[`src/prefabs/ConciergeAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/ConciergeAgent.ts)

Line 80.
