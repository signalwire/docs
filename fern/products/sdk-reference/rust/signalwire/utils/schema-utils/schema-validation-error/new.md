---
slug: "/reference/rust/signalwire/utils/schema-utils/schema-validation-error/new"
title: "new"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::utils::schema_utils::SchemaValidationError::new"
  parent: "signalwire::utils::schema_utils::SchemaValidationError"
  module: "utils.schema_utils"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/utils/schema_utils.rs"
  visibility: "public"
---
# `new`

Construct a SchemaValidationError. Mirrors Python's
`SchemaValidationError(verb_name, errors)`.

## Signature

```rust
fn new(verb_name: ?, errors: ?<?>) -> Self
```

## Parameters

| Name        | Type   | Required | Default | Description |
| ----------- | ------ | -------- | ------- | ----------- |
| `verb_name` | `?`    | yes      | —       | —           |
| `errors`    | `?<?>` | yes      | —       | —           |

## Returns

`Self`

## Source

[`src/utils/schema_utils.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/utils/schema_utils.rs)

Line 35.
