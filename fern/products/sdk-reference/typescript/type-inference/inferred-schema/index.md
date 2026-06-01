---
slug: "/reference/typescript/type-inference/inferred-schema"
title: "InferredSchema"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "TypeInference.InferredSchema"
  parent: "TypeInference"
  module: "TypeInference"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/TypeInference.ts"
---
# `InferredSchema`

Result of schema inference from a function.

## Signature

```typescript
interface InferredSchema
```

## Properties

| Name         | Type                                                     | Required | Default | Description                                                |
| ------------ | -------------------------------------------------------- | -------- | ------- | ---------------------------------------------------------- |
| `hasRawData` | `boolean`                                                | yes      | —       | Whether the function accepts a rawData parameter.          |
| `parameters` | `Record<string, { description?: string; type: string }>` | yes      | —       | JSON Schema properties keyed by parameter name.            |
| `paramNames` | `string[]`                                               | yes      | —       | Ordered parameter names (excluding rawData).               |
| `required`   | `string[]`                                               | yes      | —       | List of required parameter names (those without defaults). |

## Source

[`src/TypeInference.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/TypeInference.ts)

Line 18.
