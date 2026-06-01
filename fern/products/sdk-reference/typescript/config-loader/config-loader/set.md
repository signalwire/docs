---
slug: "/reference/typescript/config-loader/config-loader/set"
title: "set"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ConfigLoader.ConfigLoader.set"
  parent: "ConfigLoader.ConfigLoader"
  module: "ConfigLoader"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts"
---
# `set`

Set a configuration value at the given dot-notation path, creating intermediate objects as needed.

## Signature

```typescript
set(path: string, value: unknown): this
```

## Parameters

| Name    | Type      | Required | Default | Description                                    |
| ------- | --------- | -------- | ------- | ---------------------------------------------- |
| `path`  | `string`  | yes      | —       | Dot-separated key path into the config object. |
| `value` | `unknown` | yes      | —       | The value to store.                            |

## Returns

`this` — This instance for chaining.

## Source

[`src/ConfigLoader.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts)

Line 205.
