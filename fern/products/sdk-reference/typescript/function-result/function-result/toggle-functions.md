---
slug: "/reference/typescript/function-result/function-result/toggle-functions"
title: "toggleFunctions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.toggleFunctions"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `toggleFunctions`

Enable or disable SWAIG functions by name.

## Signature

```typescript
toggleFunctions(toggles: { active: boolean; function: string }[]): this
```

## Parameters

| Name      | Type                                      | Required | Default | Description                                    |
| --------- | ----------------------------------------- | -------- | ------- | ---------------------------------------------- |
| `toggles` | `{ active: boolean; function: string }[]` | yes      | —       | Array of function name and active state pairs. |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 425.
