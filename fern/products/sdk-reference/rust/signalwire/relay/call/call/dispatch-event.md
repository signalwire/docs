---
slug: "/reference/rust/signalwire/relay/call/call/dispatch-event"
title: "dispatch_event"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::call::Call::dispatch_event"
  parent: "signalwire::relay::call::Call"
  module: "relay.call"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/call.rs"
  visibility: "public"
---
# `dispatch_event`

Central event router invoked by the Client whenever a server event
targets this call.

## Signature

```rust
fn dispatch_event(&self, event: &?)
```

## Parameters

| Name    | Type | Required | Default | Description |
| ------- | ---- | -------- | ------- | ----------- |
| `event` | `&?` | yes      | —       | —           |

## Source

[`src/relay/call.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/call.rs)

Line 108.
