---
slug: "/reference/typescript/logger/logger/warn"
title: "warn"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "Logger.Logger.warn"
  parent: "Logger.Logger"
  module: "Logger"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts"
---
# `warn`

Log a message at the warn level.

## Signature

```typescript
warn(msg: string, data?: Record<string, unknown>): void
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

Line 249.
