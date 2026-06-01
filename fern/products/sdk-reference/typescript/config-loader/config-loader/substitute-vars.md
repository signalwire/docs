---
slug: "/reference/typescript/config-loader/config-loader/substitute-vars"
title: "substituteVars"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ConfigLoader.ConfigLoader.substituteVars"
  parent: "ConfigLoader.ConfigLoader"
  module: "ConfigLoader"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts"
---
# `substituteVars`

Recursively substitute `${VAR|default}` environment variables in any value.

Walks strings, objects, and arrays. Coerces result strings to boolean
(`"true"` / `"false"`) or number when appropriate.

## Signature

```typescript
substituteVars(value: unknown, maxDepth: number = 10): unknown
```

## Parameters

| Name       | Type      | Required | Default | Description                                                      |
| ---------- | --------- | -------- | ------- | ---------------------------------------------------------------- |
| `value`    | `unknown` | yes      | —       | The value to process (string, object, array, or primitive).      |
| `maxDepth` | `number`  | yes      | `10`    | Maximum recursion depth to prevent infinite loops (default: 10). |

## Returns

`unknown` — The value with all environment variables substituted.

## Source

[`src/ConfigLoader.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts)

Line 316.
