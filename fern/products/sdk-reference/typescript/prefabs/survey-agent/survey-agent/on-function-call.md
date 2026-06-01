---
slug: "/reference/typescript/prefabs/survey-agent/survey-agent/on-function-call"
title: "onFunctionCall"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyAgent.onFunctionCall"
  parent: "prefabs.SurveyAgent.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `onFunctionCall`

Hook called before each SWAIG function execution. Override in subclasses.

**Behavioral note:** In the Python SDK, `on_function_call` IS the dispatcher
— it retrieves and executes the function, returning the result. In TypeScript,
`fn.execute()` is called separately after this hook. However, if this method
returns a non-void value, it is used as the result and the default execution
is skipped, enabling dispatch interception parity with Python.

## Signature

```typescript
onFunctionCall(
  _name: string,
  _args: Record<string, unknown>,
  _rawData: Record<string, unknown>
): void | Record<string, unknown> | Promise<void | Record<string, unknown>>
```

## Parameters

| Name       | Type                      | Required | Default | Description                            |
| ---------- | ------------------------- | -------- | ------- | -------------------------------------- |
| `_name`    | `string`                  | yes      | —       | Name of the function about to execute. |
| `_args`    | `Record<string, unknown>` | yes      | —       | Parsed arguments for the function.     |
| `_rawData` | `Record<string, unknown>` | yes      | —       | The full raw SWAIG request payload.    |

## Returns

`void | Record<string, unknown> | Promise<void | Record<string, unknown>>` — Optionally a result dict to short-circuit default execution, or void/undefined to proceed normally.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1980.
