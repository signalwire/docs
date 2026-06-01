---
slug: "/reference/typescript/function-result/function-result/swml-user-event"
title: "swmlUserEvent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.swmlUserEvent"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `swmlUserEvent`

Emit a custom user event via SWML.

## Signature

```typescript
swmlUserEvent(eventData: Record<string, unknown>): this
```

## Parameters

| Name        | Type                      | Required | Default | Description        |
| ----------- | ------------------------- | -------- | ------- | ------------------ |
| `eventData` | `Record<string, unknown>` | yes      | —       | The event payload. |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 384.
