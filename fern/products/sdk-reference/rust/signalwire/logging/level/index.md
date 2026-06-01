---
slug: "/reference/rust/signalwire/logging/level"
title: "Level"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "enum"
  language: "rust"
  qualified_name: "signalwire::logging::Level"
  parent: "signalwire::logging"
  module: "logging"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/logging.rs"
  visibility: "public"
---
# `Level`

Log levels matching the SDK convention.

## Signature

```rust
enum Level
```

## Inheritance

**Implements:** `Debug`, `Clone`, `Copy`, `PartialEq`, `Eq`, `PartialOrd`, `Ord`

## Variants

| Name    | Type        | Required | Default | Description |
| ------- | ----------- | -------- | ------- | ----------- |
| `Debug` | `Debug = 0` | yes      | —       | —           |
| `Error` | `Error = 3` | yes      | —       | —           |
| `Info`  | `Info = 1`  | yes      | —       | —           |
| `Warn`  | `Warn = 2`  | yes      | —       | —           |

## Methods

- [`as_str`](/reference/rust/signalwire/logging/level/as-str)
- [`clone`](/reference/rust/signalwire/logging/level/clone)
- [`cmp`](/reference/rust/signalwire/logging/level/cmp)
- [`eq`](/reference/rust/signalwire/logging/level/eq)
- [`fmt`](/reference/rust/signalwire/logging/level/fmt)
- [`from_str`](/reference/rust/signalwire/logging/level/from-str)
- [`partial_cmp`](/reference/rust/signalwire/logging/level/partial-cmp)

## Source

[`src/logging.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/logging.rs)

Line 8.
