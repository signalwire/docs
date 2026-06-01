---
slug: "/reference/rust/signalwire/utils/schema-utils/schema-utils/validate-verb"
title: "validate_verb"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::utils::schema_utils::SchemaUtils::validate_verb"
  parent: "signalwire::utils::schema_utils::SchemaUtils"
  module: "utils.schema_utils"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/utils/schema_utils.rs"
  visibility: "public"
---
# `validate_verb`

Validate a verb config against the schema.  Mirrors Python's
`validate_verb(verb_name, verb_config)`.

## Signature

```rust
fn validate_verb(&self, verb_name: &str, verb_config: &?) -> (bool, ?<?>)
```

## Parameters

| Name          | Type   | Required | Default | Description |
| ------------- | ------ | -------- | ------- | ----------- |
| `verb_name`   | `&str` | yes      | —       | —           |
| `verb_config` | `&?`   | yes      | —       | —           |

## Returns

`(bool, ?<?>)`

## Source

[`src/utils/schema_utils.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/utils/schema_utils.rs)

Line 155.
