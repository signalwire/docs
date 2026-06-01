---
slug: "/reference/typescript/logger/logger/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "Logger.Logger.constructor"
  parent: "Logger.Logger"
  module: "Logger"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts"
---
# `constructor`

Create a new Logger instance.

## Signature

```typescript
constructor(name: string, context?: Record<string, unknown>): Logger
```

## Parameters

| Name      | Type                      | Required | Default | Description                                           |
| --------- | ------------------------- | -------- | ------- | ----------------------------------------------------- |
| `name`    | `string`                  | yes      | —       | Logger name shown in log output.                      |
| `context` | `Record<string, unknown>` | no       | —       | Optional key-value pairs included in every log entry. |

## Returns

`Logger`

## Source

[`src/Logger.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts)

Line 212.
