---
slug: "/reference/typescript/type-inference"
title: "TypeInference"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "TypeInference"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/TypeInference.ts"
---
# `TypeInference`

## Signature

```typescript
module TypeInference
```

## Functions

- [`createTypedHandlerWrapper`](/reference/typescript/type-inference/create-typed-handler-wrapper) — Create a wrapper function that adapts a typed handler to the standard `(args, rawData) => result` SWAIG handler signature.
- [`inferSchema`](/reference/typescript/type-inference/infer-schema) — Infer a JSON Schema from a function's parameters.
- [`parseFunctionParams`](/reference/typescript/type-inference/parse-function-params) — Parse function parameter names and default values from source code.

## Interfaces

- [`InferredSchema`](/reference/typescript/type-inference/inferred-schema) — Result of schema inference from a function.
- [`ParsedParam`](/reference/typescript/type-inference/parsed-param) — A parsed function parameter with optional default value.

## Source

[`src/TypeInference.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/TypeInference.ts)

Line 1.
