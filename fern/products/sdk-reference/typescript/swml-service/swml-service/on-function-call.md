---
slug: "/reference/typescript/swml-service/swml-service/on-function-call"
title: "onFunctionCall"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLService.SWMLService.onFunctionCall"
  parent: "SWMLService.SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `onFunctionCall`

Dispatch a function call to the registered handler.
Returns null when the function isn't registered or has no handler.
Subclasses (AgentBase) override to add session-token validation
and FunctionResult-shape normalization. Return type is wide enough
to accommodate the agent override (which may also return void
shapes for fire-and-forget tool calls).

## Signature

```typescript
onFunctionCall(
  name: string,
  args: Record<string, unknown>,
  rawData: Record<string, unknown>
): string | void | Record<string, unknown> | FunctionResult | Promise<string | void | Record<string, unknown> | FunctionResult> | null | undefined
```

## Parameters

| Name      | Type                      | Required | Default | Description |
| --------- | ------------------------- | -------- | ------- | ----------- |
| `name`    | `string`                  | yes      | —       | —           |
| `args`    | `Record<string, unknown>` | yes      | —       | —           |
| `rawData` | `Record<string, unknown>` | yes      | —       | —           |

## Returns

`string | void | Record<string, unknown> | FunctionResult | Promise<string | void | Record<string, unknown> | FunctionResult> | null | undefined`

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 490.
