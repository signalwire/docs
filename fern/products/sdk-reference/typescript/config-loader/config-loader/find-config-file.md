---
slug: "/reference/typescript/config-loader/config-loader/find-config-file"
title: "findConfigFile"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ConfigLoader.ConfigLoader.findConfigFile"
  parent: "ConfigLoader.ConfigLoader"
  module: "ConfigLoader"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts"
---
# `findConfigFile`

Find a config file path without loading it.

Searches service-specific filenames, additional paths, and default paths.
Returns the first found path string or null.

**Modifiers:** `static`

## Signature

```typescript
findConfigFile(serviceName?: string, additionalPaths?: string[]): string | null
```

## Parameters

| Name              | Type       | Required | Default | Description                                                  |
| ----------------- | ---------- | -------- | ------- | ------------------------------------------------------------ |
| `serviceName`     | `string`   | no       | —       | Optional service name for service-specific config filenames. |
| `additionalPaths` | `string[]` | no       | —       | Additional file paths to check.                              |

## Returns

`string | null` — Path to the first config file found, or null.

## Source

[`src/ConfigLoader.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ConfigLoader.ts)

Line 109.
