---
slug: "/reference/rust/signalwire/rest/namespaces/compat/compat-queues/dequeue-member"
title: "dequeue_member"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::compat::CompatQueues::dequeue_member"
  parent: "signalwire::rest::namespaces::compat::CompatQueues"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/compat.rs"
  visibility: "public"
---
# `dequeue_member`

## Signature

```rust
fn dequeue_member(&self, queue_sid: &str, call_sid: &str, params: &?) -> ?<?, ?>
```

## Parameters

| Name        | Type   | Required | Default | Description |
| ----------- | ------ | -------- | ------- | ----------- |
| `queue_sid` | `&str` | yes      | —       | —           |
| `call_sid`  | `&str` | yes      | —       | —           |
| `params`    | `&?`   | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/rest/namespaces/compat.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/compat.rs)

Line 727.
