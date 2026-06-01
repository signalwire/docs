---
slug: "/reference/rust/signalwire/logging/logger"
title: "Logger"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::logging::Logger"
  parent: "signalwire::logging"
  module: "logging"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/logging.rs"
  visibility: "public"
---
# `Logger`

Logger with level filtering and suppression via environment variables.

- `SIGNALWIRE_LOG_LEVEL` — sets the minimum level (debug/info/warn/error)
- `SIGNALWIRE_LOG_MODE=off` — suppresses all output

## Signature

```rust
struct Logger { /* fields */ }
```

## Properties

| Name         | Type   | Required | Default | Description |
| ------------ | ------ | -------- | ------- | ----------- |
| `level`      | `?`    | yes      | —       | —           |
| `name`       | `?`    | yes      | —       | —           |
| `suppressed` | `bool` | yes      | —       | —           |

## Methods

- [`debug`](/reference/rust/signalwire/logging/logger/debug)
- [`error`](/reference/rust/signalwire/logging/logger/error)
- [`info`](/reference/rust/signalwire/logging/logger/info)
- [`log`](/reference/rust/signalwire/logging/logger/log)
- [`new`](/reference/rust/signalwire/logging/logger/new)
- [`should_log`](/reference/rust/signalwire/logging/logger/should-log)
- [`warn`](/reference/rust/signalwire/logging/logger/warn)

## Source

[`src/logging.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/logging.rs)

Line 40.
