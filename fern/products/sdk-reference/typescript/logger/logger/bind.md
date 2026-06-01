---
slug: "/reference/typescript/logger/logger/bind"
title: "bind"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "Logger.Logger.bind"
  parent: "Logger.Logger"
  module: "Logger"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts"
---
# `bind`

Create a child logger with additional bound context fields merged into the parent's context.

## Signature

```typescript
bind(context: Record<string, unknown>): Logger
```

## Parameters

| Name      | Type                      | Required | Default | Description                                               |
| --------- | ------------------------- | -------- | ------- | --------------------------------------------------------- |
| `context` | `Record<string, unknown>` | yes      | —       | Key-value pairs to merge into the child logger's context. |

## Returns

`Logger` — A new Logger instance with the merged context.

## Source

[`src/Logger.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts)

Line 222.
