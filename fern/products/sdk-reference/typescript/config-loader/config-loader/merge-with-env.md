---
slug: "/reference/typescript/config-loader/config-loader/merge-with-env"
title: "mergeWithEnv"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ConfigLoader.ConfigLoader.mergeWithEnv"
  parent: "ConfigLoader.ConfigLoader"
  module: "ConfigLoader"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts"
---
# `mergeWithEnv`

Merge configuration with environment variables that match a prefix.

Config file values take precedence over environment variables. Matching
env var keys are stripped of the prefix, lowercased, split on `_`, and
written into a nested object (e.g. `SWML_FOO_BAR` → `{ foo: { bar: v } }`).
Mirrors Python's `merge_with_env` in
`signalwire/signalwire/core/config_loader.py`.

## Signature

```typescript
mergeWithEnv(envPrefix: string = 'SWML_'): Record<string, unknown>
```

## Parameters

| Name        | Type     | Required | Default   | Description                                                        |
| ----------- | -------- | -------- | --------- | ------------------------------------------------------------------ |
| `envPrefix` | `string` | yes      | `'SWML_'` | Prefix for environment variables to consider (default: `'SWML_'`). |

## Returns

`Record<string, unknown>` — Merged configuration dictionary.

## Source

[`src/ConfigLoader.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts)

Line 367.
