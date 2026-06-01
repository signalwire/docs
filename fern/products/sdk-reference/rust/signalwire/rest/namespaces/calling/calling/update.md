---
slug: "/reference/rust/signalwire/rest/namespaces/calling/calling/update"
title: "update"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::calling::Calling::update"
  parent: "signalwire::rest::namespaces::calling::Calling"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/calling.rs"
  visibility: "public"
---
# `update`

POST /api/calling/calls with `command="update"` — mirrors the Python
`client.calling.update(id=..., state=...)` shape: caller-supplied
`id` lives **inside** params, not as the top-level body field.

## Signature

```rust
fn update(&self, params: ?) -> ?<?, ?>
```

## Parameters

| Name     | Type | Required | Default | Description |
| -------- | ---- | -------- | ------- | ----------- |
| `params` | `?`  | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/rest/namespaces/calling.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/calling.rs)

Line 70.
