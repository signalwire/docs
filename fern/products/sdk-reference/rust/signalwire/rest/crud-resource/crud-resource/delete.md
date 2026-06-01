---
slug: "/reference/rust/signalwire/rest/crud-resource/crud-resource/delete"
title: "delete"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::crud_resource::CrudResource::delete"
  parent: "signalwire::rest::crud_resource::CrudResource"
  module: "rest.crud_resource"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/crud_resource.rs"
  visibility: "public"
---
# `delete`

Delete a resource by ID (DELETE basePath/{id}).

## Signature

```rust
fn delete(&self, id: &str) -> ?<?, ?>
```

## Parameters

| Name | Type   | Required | Default | Description |
| ---- | ------ | -------- | ------- | ----------- |
| `id` | `&str` | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/rest/crud_resource.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/crud_resource.rs)

Line 62.
