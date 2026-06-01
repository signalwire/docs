---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/add-function-include"
title: "addFunctionInclude"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.addFunctionInclude"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addFunctionInclude`

Add a remote SWAIG function include reference.

## Signature

```typescript
addFunctionInclude(
  url: string,
  functions: string[],
  metaData?: Record<string, unknown>
): this
```

## Parameters

| Name        | Type                      | Required | Default | Description                                 |
| ----------- | ------------------------- | -------- | ------- | ------------------------------------------- |
| `url`       | `string`                  | yes      | —       | URL of the remote SWAIG endpoint.           |
| `functions` | `string[]`                | yes      | —       | Function names available at that endpoint.  |
| `metaData`  | `Record<string, unknown>` | no       | —       | Optional metadata to attach to the include. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 965.
