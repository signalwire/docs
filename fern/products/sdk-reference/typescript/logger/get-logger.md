---
slug: "/reference/typescript/logger/get-logger"
title: "getLogger"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "Logger.getLogger"
  parent: "Logger"
  module: "Logger"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts"
---
# `getLogger`

Create or retrieve a cached Logger instance with the given name.

## Signature

```typescript
getLogger(name: string): Logger
```

## Parameters

| Name   | Type     | Required | Default | Description                      |
| ------ | -------- | -------- | ------- | -------------------------------- |
| `name` | `string` | yes      | —       | Logger name shown in log output. |

## Returns

`Logger` — A Logger instance (cached by name).

## Source

[`src/Logger.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts)

Line 330.
