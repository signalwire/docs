---
slug: "/reference/typescript/function-result/function-result/add-action"
title: "addAction"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.addAction"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `addAction`

Append a single named action to the action list.

## Signature

```typescript
addAction(name: string, data: unknown): this
```

## Parameters

| Name   | Type      | Required | Default | Description                              |
| ------ | --------- | -------- | ------- | ---------------------------------------- |
| `name` | `string`  | yes      | —       | The action name (e.g., "hangup", "say"). |
| `data` | `unknown` | yes      | —       | The action payload.                      |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 122.
