---
slug: "/reference/typescript/config-loader/config-loader/load"
title: "load"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ConfigLoader.ConfigLoader.load"
  parent: "ConfigLoader.ConfigLoader"
  module: "ConfigLoader"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts"
---
# `load`

Load configuration from a JSON file, performing `${VAR|default}` env var interpolation on the raw text.

## Signature

```typescript
load(filePath: string): this
```

## Parameters

| Name       | Type     | Required | Default | Description                   |
| ---------- | -------- | -------- | ------- | ----------------------------- |
| `filePath` | `string` | yes      | —       | Path to the JSON config file. |

## Returns

`this` — This instance for chaining.

## Source

[`src/ConfigLoader.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts)

Line 65.
