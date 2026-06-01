---
slug: "/reference/typescript/logger/set-global-log-level"
title: "setGlobalLogLevel"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "Logger.setGlobalLogLevel"
  parent: "Logger"
  module: "Logger"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts"
---
# `setGlobalLogLevel`

Set the minimum log level for all loggers.

## Signature

```typescript
setGlobalLogLevel(level: "debug" | "info" | "warn" | "error"): void
```

## Parameters

| Name    | Type                                     | Required | Default | Description                         |
| ------- | ---------------------------------------- | -------- | ------- | ----------------------------------- |
| `level` | `"debug" \| "info" \| "warn" \| "error"` | yes      | —       | The minimum severity level to emit. |

## Returns

`void`

## Source

[`src/Logger.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts)

Line 89.
