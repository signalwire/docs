---
slug: "/reference/typescript/type-inference/infer-schema"
title: "inferSchema"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "TypeInference.inferSchema"
  parent: "TypeInference"
  module: "TypeInference"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/TypeInference.ts"
---
# `inferSchema`

Infer a JSON Schema from a function's parameters.

Extracts parameter names and infers JSON Schema types from default-value
literals:

- Number literals → `"integer"` (whole numbers) or `"number"` (decimals)
- String literals → `"string"`
- Boolean literals → `"boolean"`
- No default → `"string"` (and the parameter is marked required)

## Signature

```typescript
inferSchema(fn: Function): InferredSchema | null
```

## Parameters

| Name | Type       | Required | Default | Description                                                                                 |
| ---- | ---------- | -------- | ------- | ------------------------------------------------------------------------------------------- |
| `fn` | `Function` | yes      | —       | The function to inspect. Arrow functions, regular functions, and method shorthand all work. |

## Returns

`InferredSchema | null` — An [InferredSchema](/reference/typescript/type-inference/inferred-schema) describing the parameters, or `null` when the function looks like an old-style `(args, rawData)` SWAIG handler (in which case no inference is attempted).

## Source

[`src/TypeInference.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/TypeInference.ts)

Line 111.
