---
slug: "/reference/typescript/config-loader/config-loader/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ConfigLoader.ConfigLoader.constructor"
  parent: "ConfigLoader.ConfigLoader"
  module: "ConfigLoader"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts"
---
# `constructor`

Create a new ConfigLoader, optionally loading a JSON file immediately.

Accepts a single file path or an array of paths. When given an array,
the loader iterates in order and loads the first file that exists
(mirroring Python's ordered-search behaviour).

## Signature

```typescript
constructor(filePaths?: string | string[]): ConfigLoader
```

## Parameters

| Name        | Type                 | Required | Default | Description                                            |
| ----------- | -------------------- | -------- | ------- | ------------------------------------------------------ |
| `filePaths` | `string \| string[]` | no       | —       | Path(s) to a JSON config file to load on construction. |

## Returns

`ConfigLoader`

## Source

[`src/ConfigLoader.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts)

Line 33.
