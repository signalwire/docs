---
slug: "/reference/typescript/config-loader/config-loader/interpolate-env-vars"
title: "interpolateEnvVars"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ConfigLoader.ConfigLoader.interpolateEnvVars"
  parent: "ConfigLoader.ConfigLoader"
  module: "ConfigLoader"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts"
---
# `interpolateEnvVars`

Interpolate ${VAR|default} patterns in a raw string.

## Signature

```typescript
interpolateEnvVars(input: string): string
```

## Parameters

| Name    | Type     | Required | Default | Description                               |
| ------- | -------- | -------- | ------- | ----------------------------------------- |
| `input` | `string` | yes      | —       | The string containing env var references. |

## Returns

`string` — The string with all env var references resolved.

## Source

[`src/ConfigLoader.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts)

Line 439.
