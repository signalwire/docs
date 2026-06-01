---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/logging/logging"
title: "logging"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/logging"
  module: "github.com.signalwire.signalwire-go.pkg.logging"
---
# `logging`

Package logging provides structured logging for the SignalWire AI Agents SDK.

It supports log levels (debug, info, warn, error), named loggers per component, and can be suppressed globally for CLI tools or testing.

## Signature

```go
package logging
```

## Constants

| Name         | Type               | Required | Default | Description |
| ------------ | ------------------ | -------- | ------- | ----------- |
| `LevelDebug` | `LevelDebug Level` | yes      | —       | —           |
| `LevelError` | `LevelError`       | yes      | —       | —           |
| `LevelInfo`  | `LevelInfo`        | yes      | —       | —           |
| `LevelOff`   | `LevelOff`         | yes      | —       | —           |
| `LevelWarn`  | `LevelWarn`        | yes      | —       | —           |

## Functions

- [`GetGlobalLevel`](/reference/go/github.com/signalwire/signalwire-go/pkg/logging/logging/get-global-level) — GetGlobalLevel returns the current global log level.
- [`IsSuppressed`](/reference/go/github.com/signalwire/signalwire-go/pkg/logging/logging/is-suppressed) — IsSuppressed returns whether logging is currently suppressed.
- [`New`](/reference/go/github.com/signalwire/signalwire-go/pkg/logging/logging/new) — New creates a new Logger with the given component name.
- [`ParseLevel`](/reference/go/github.com/signalwire/signalwire-go/pkg/logging/logging/parse-level) — ParseLevel converts a string level name to a Level. Returns LevelInfo if the string is not recognized.
- [`ResetLoggingConfiguration`](/reference/go/github.com/signalwire/signalwire-go/pkg/logging/logging/reset-logging-configuration) — ResetLoggingConfiguration re-reads SIGNALWIRE\_LOG\_LEVEL and SIGNALWIRE\_LOG\_MODE from the environment and resets globalLevel and suppressed to the env-derived defaults. It is the Go equivalent of Python's reset\_logging\_configuration() and is intended for test teardown and env-var-driven reconfiguration at runtime.
- [`SetGlobalLevel`](/reference/go/github.com/signalwire/signalwire-go/pkg/logging/logging/set-global-level) — SetGlobalLevel sets the minimum log level for all loggers.
- [`Suppress`](/reference/go/github.com/signalwire/signalwire-go/pkg/logging/logging/suppress) — Suppress disables all log output.
- [`Unsuppress`](/reference/go/github.com/signalwire/signalwire-go/pkg/logging/logging/unsuppress) — Unsuppress re-enables log output.

## Type Aliases

- [`Level`](/reference/go/github.com/signalwire/signalwire-go/pkg/logging/logging/level) — Level represents a log severity level.

## Classes

- [`Logger`](/reference/go/github.com/signalwire/signalwire-go/pkg/logging/logging/logger) — Logger is a named logger that respects global log level settings.
