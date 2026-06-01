---
slug: "/reference/typescript/logger/logger/debug"
title: "debug"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "Logger.Logger.debug"
  parent: "Logger.Logger"
  module: "Logger"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts"
---
# `debug`

Log a message at the debug level.

## Signature

```typescript
debug(msg: string, data?: Record<string, unknown>): void
```

## Parameters

| Name   | Type                      | Required | Default | Description                          |
| ------ | ------------------------- | -------- | ------- | ------------------------------------ |
| `msg`  | `string`                  | yes      | —       | The log message.                     |
| `data` | `Record<string, unknown>` | no       | —       | Optional structured data to include. |

## Returns

`void`

## Source

[`src/Logger.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts)

Line 231.
