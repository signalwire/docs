---
slug: "/reference/dotnet/signal-wire.logging/logger"
title: "Logger"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Logging.Logger"
  parent: "SignalWire.Logging"
  module: "SignalWire.Logging"
  visibility: "public"
---
# `Logger`

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class Logger
```

## Properties

| Name         | Type                                   | Required | Default | Description |
| ------------ | -------------------------------------- | -------- | ------- | ----------- |
| `Level`      | `public LogLevel Level { get; set; }`  | yes      | —       | —           |
| `Name`       | `public string Name { get; }`          | yes      | —       | —           |
| `Suppressed` | `public bool Suppressed { get; set; }` | yes      | —       | —           |

## Methods

- [`Debug(string)`](/reference/dotnet/signal-wire.logging/logger/debug-string)
- [`Error(string)`](/reference/dotnet/signal-wire.logging/logger/error-string)
- [`GetLogger(string)`](/reference/dotnet/signal-wire.logging/logger/get-logger-string)
- [`Info(string)`](/reference/dotnet/signal-wire.logging/logger/info-string)
- [`Reset()`](/reference/dotnet/signal-wire.logging/logger/reset) — Reset all logger instances (for testing).
- [`ShouldLog(LogLevel)`](/reference/dotnet/signal-wire.logging/logger/should-log-log-level)
- [`Warn(string)`](/reference/dotnet/signal-wire.logging/logger/warn-string)
