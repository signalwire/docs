---
slug: "/reference/typescript/function-result/function-result/switch-context"
title: "switchContext"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.switchContext"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `switchContext`

Switch the AI context with optional new prompts and reset options.

## Signature

```typescript
switchContext(opts?: { ...4 fields }): this
```

## Parameters

| Name                | Type                                                                                         | Required | Default | Description                                                           |
| ------------------- | -------------------------------------------------------------------------------------------- | -------- | ------- | --------------------------------------------------------------------- |
| `opts`              | `{ consolidate?: boolean; fullReset?: boolean; systemPrompt?: string; userPrompt?: string }` | no       | —       | Context switch options including system/user prompts and reset flags. |
| `opts.consolidate`  | `boolean`                                                                                    | no       | —       | —                                                                     |
| `opts.fullReset`    | `boolean`                                                                                    | no       | —       | —                                                                     |
| `opts.systemPrompt` | `string`                                                                                     | no       | —       | —                                                                     |
| `opts.userPrompt`   | `string`                                                                                     | no       | —       | —                                                                     |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 396.
