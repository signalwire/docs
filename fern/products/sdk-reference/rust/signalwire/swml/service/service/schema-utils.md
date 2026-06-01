---
slug: "/reference/rust/signalwire/swml/service/service/schema-utils"
title: "schema_utils"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service::schema_utils"
  parent: "signalwire::swml::service::Service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `schema_utils`

SchemaUtils helper bound to this Service.  Mirrors Python's
`self.schema_utils` instance attribute on `SWMLService`.
Returns a freshly-built helper each call — the underlying
schema is `LazyLock`-cached, so this is cheap.

## Signature

```rust
fn schema_utils(&self) -> ?
```

## Returns

`?`

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 317.
