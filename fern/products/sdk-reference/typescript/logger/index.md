---
slug: "/reference/typescript/logger"
title: "Logger"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "Logger"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts"
---
# `Logger`

## Signature

```typescript
module Logger
```

## Functions

- [`getExecutionMode`](/reference/typescript/logger/get-execution-mode) — Detect the execution environment, matching Python SDK's detection logic.
- [`getLogger`](/reference/typescript/logger/get-logger) — Create or retrieve a cached Logger instance with the given name.
- [`resetLoggingConfiguration`](/reference/typescript/logger/reset-logging-configuration) — Reset all logging settings to their environment-variable-based defaults.
- [`setGlobalLogColor`](/reference/typescript/logger/set-global-log-color) — Enable or disable ANSI color codes in text-format output.
- [`setGlobalLogFormat`](/reference/typescript/logger/set-global-log-format) — Set the output format for all loggers.
- [`setGlobalLogLevel`](/reference/typescript/logger/set-global-log-level) — Set the minimum log level for all loggers.
- [`setGlobalLogStream`](/reference/typescript/logger/set-global-log-stream) — Set the output stream for all loggers.
- [`stripControlChars`](/reference/typescript/logger/strip-control-chars) — Strip control characters from all string values in a data record to prevent log injection attacks. Mirrors Python SDK's `strip_control_chars` structlog processor. Processes nested objects and arrays recursively.
- [`suppressAllLogs`](/reference/typescript/logger/suppress-all-logs) — Suppress or unsuppress all log output globally.

## Classes

- [`Logger`](/reference/typescript/logger/logger) — Structured logger that respects global level, format, and color settings.

## Source

[`src/Logger.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/Logger.ts)

Line 1.
