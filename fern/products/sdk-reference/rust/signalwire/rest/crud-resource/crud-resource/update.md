---
slug: "/reference/rust/signalwire/rest/crud-resource/crud-resource/update"
title: "update"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::crud_resource::CrudResource::update"
  parent: "signalwire::rest::crud_resource::CrudResource"
  module: "rest.crud_resource"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/crud_resource.rs"
  visibility: "public"
---
# `update`

Update a resource by ID (PUT basePath/{id}).

## Signature

```rust
fn update(&self, id: &str, data: &?) -> ?<?, ?>
```

## Parameters

| Name   | Type   | Required | Default | Description |
| ------ | ------ | -------- | ------- | ----------- |
| `id`   | `&str` | yes      | —       | —           |
| `data` | `&?`   | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/rest/crud_resource.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/crud_resource.rs)

Line 57.
