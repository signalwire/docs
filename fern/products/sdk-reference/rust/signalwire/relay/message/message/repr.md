---
slug: "/reference/rust/signalwire/relay/message/message/repr"
title: "repr"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::message::Message::repr"
  parent: "signalwire::relay::message::Message"
  module: "relay.message"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/message.rs"
  visibility: "public"
---
# `repr`

Python-style `__repr__` (mirrors `Message.__repr__` in the
signalwire-python reference). Returns a string of the form
`Message(message_id=..., from=..., to=..., state=...)`.

## Signature

```rust
fn repr(&self) -> ?
```

## Returns

`?`

## Source

[`src/relay/message.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/message.rs)

Line 121.
