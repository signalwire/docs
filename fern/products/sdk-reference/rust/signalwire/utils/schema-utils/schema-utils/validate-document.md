---
slug: "/reference/rust/signalwire/utils/schema-utils/schema-utils/validate-document"
title: "validate_document"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::utils::schema_utils::SchemaUtils::validate_document"
  parent: "signalwire::utils::schema_utils::SchemaUtils"
  module: "utils.schema_utils"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/utils/schema_utils.rs"
  visibility: "public"
---
# `validate_document`

Validate a complete SWML document.  Mirrors Python's
`validate_document(document)`.  Returns
`(false, ["Schema validator not initialized"])` when no full
validator is wired in.

## Signature

```rust
fn validate_document(&self, _document: &?) -> (bool, ?<?>)
```

## Parameters

| Name        | Type | Required | Default | Description |
| ----------- | ---- | -------- | ------- | ----------- |
| `_document` | `&?` | yes      | —       | —           |

## Returns

`(bool, ?<?>)`

## Source

[`src/utils/schema_utils.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/utils/schema_utils.rs)

Line 192.
