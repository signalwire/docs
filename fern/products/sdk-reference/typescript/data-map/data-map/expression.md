---
slug: "/reference/typescript/data-map/data-map/expression"
title: "expression"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "DataMap.DataMap.expression"
  parent: "DataMap.DataMap"
  module: "DataMap"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts"
---
# `expression`

Add a pattern-matching expression that evaluates a test value against a regex.

## Signature

```typescript
expression(
  testValue: string,
  pattern: string | RegExp,
  output: FunctionResult,
  nomatchOutput?: FunctionResult
): this
```

## Parameters

| Name            | Type               | Required | Default | Description                                                |
| --------------- | ------------------ | -------- | ------- | ---------------------------------------------------------- |
| `testValue`     | `string`           | yes      | —       | The string or template variable to test.                   |
| `pattern`       | `string \| RegExp` | yes      | —       | A regex pattern (string or RegExp) to match against.       |
| `output`        | `FunctionResult`   | yes      | —       | The result to return when the pattern matches.             |
| `nomatchOutput` | `FunctionResult`   | no       | —       | Optional result to return when the pattern does not match. |

## Returns

`this` — This instance for chaining.

## Source

[`src/DataMap.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts)

Line 231.
