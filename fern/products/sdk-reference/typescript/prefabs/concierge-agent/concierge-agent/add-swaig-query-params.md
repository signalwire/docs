---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/add-swaig-query-params"
title: "addSwaigQueryParams"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.addSwaigQueryParams"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addSwaigQueryParams`

Add extra query parameters appended to all SWAIG webhook URLs.

## Signature

```typescript
addSwaigQueryParams(params: Record<string, string>): this
```

## Parameters

| Name     | Type                     | Required | Default | Description                                    |
| -------- | ------------------------ | -------- | ------- | ---------------------------------------------- |
| `params` | `Record<string, string>` | yes      | —       | Key-value pairs to append as query parameters. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1714.
