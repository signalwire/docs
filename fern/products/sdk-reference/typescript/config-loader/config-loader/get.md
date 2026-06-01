---
slug: "/reference/typescript/config-loader/config-loader/get"
title: "get"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ConfigLoader.ConfigLoader.get"
  parent: "ConfigLoader.ConfigLoader"
  module: "ConfigLoader"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts"
---
# `get`

Retrieve a configuration value using a dot-notation path (e.g. `'server.port'`).

## Signature

```typescript
get<T>(path: string, defaultValue?: T): T
```

## Type Parameters

| Name | Type | Required | Default   | Description |
| ---- | ---- | -------- | --------- | ----------- |
| `T`  | —    | yes      | `unknown` | —           |

## Parameters

| Name           | Type     | Required | Default | Description                                    |
| -------------- | -------- | -------- | ------- | ---------------------------------------------- |
| `path`         | `string` | yes      | —       | Dot-separated key path into the config object. |
| `defaultValue` | `T`      | no       | —       | Value returned when the path does not exist.   |

## Returns

`T` — The resolved value, or defaultValue if not found.

## Source

[`src/ConfigLoader.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts)

Line 182.
