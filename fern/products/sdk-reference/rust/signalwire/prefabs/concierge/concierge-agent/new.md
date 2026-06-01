---
slug: "/reference/rust/signalwire/prefabs/concierge/concierge-agent/new"
title: "new"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::prefabs::concierge::ConciergeAgent::new"
  parent: "signalwire::prefabs::concierge::ConciergeAgent"
  module: "prefabs.concierge"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/concierge.rs"
  visibility: "public"
---
# `new`

Create a new ConciergeAgent.

## Signature

```rust
fn new(name: &str, venue_info: &?<?, ?>, route: ?<&str>) -> Self
```

## Parameters

| Name         | Type       | Required | Default | Description |
| ------------ | ---------- | -------- | ------- | ----------- |
| `name`       | `&str`     | yes      | —       | —           |
| `venue_info` | `&?<?, ?>` | yes      | —       | —           |
| `route`      | `?<&str>`  | yes      | —       | —           |

## Returns

`Self`

## Source

[`src/prefabs/concierge.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/concierge.rs)

Line 25.
