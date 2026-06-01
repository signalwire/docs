---
slug: "/reference/typescript/logger/strip-control-chars"
title: "stripControlChars"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "Logger.stripControlChars"
  parent: "Logger"
  module: "Logger"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts"
---
# `stripControlChars`

Strip control characters from all string values in a data record to prevent
log injection attacks. Mirrors Python SDK's `strip_control_chars` structlog
processor. Processes nested objects and arrays recursively.

## Signature

```typescript
stripControlChars<T>(data: T): T
```

## Type Parameters

| Name | Type                      | Required | Default | Description |
| ---- | ------------------------- | -------- | ------- | ----------- |
| `T`  | `Record<string, unknown>` | yes      | —       | —           |

## Parameters

| Name   | Type | Required | Default | Description                                         |
| ------ | ---- | -------- | ------- | --------------------------------------------------- |
| `data` | `T`  | yes      | —       | The record whose string values should be sanitized. |

## Returns

`T` — A shallow copy of `data` with control characters removed from strings.

## Source

[`src/Logger.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts)

Line 166.
