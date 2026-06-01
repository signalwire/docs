---
slug: "/reference/typescript/data-map/data-map/register-with-agent"
title: "registerWithAgent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "DataMap.DataMap.registerWithAgent"
  parent: "DataMap.DataMap"
  module: "DataMap"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts"
---
# `registerWithAgent`

Register this DataMap tool with an AgentBase instance.

## Signature

```typescript
registerWithAgent(agent: { ...1 fields }): this
```

## Parameters

| Name                          | Type                                 | Required | Default | Description                                                             |
| ----------------------------- | ------------------------------------ | -------- | ------- | ----------------------------------------------------------------------- |
| `agent`                       | `{ registerSwaigFunction: unknown }` | yes      | —       | An object with a registerSwaigFunction method (typically an AgentBase). |
| `agent.registerSwaigFunction` | `?`                                  | yes      | —       | —                                                                       |

## Returns

`this` — This instance for chaining.

## Source

[`src/DataMap.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts)

Line 375.
