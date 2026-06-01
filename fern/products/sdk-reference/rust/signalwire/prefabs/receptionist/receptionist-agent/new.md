---
slug: "/reference/rust/signalwire/prefabs/receptionist/receptionist-agent/new"
title: "new"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::prefabs::receptionist::ReceptionistAgent::new"
  parent: "signalwire::prefabs::receptionist::ReceptionistAgent"
  module: "prefabs.receptionist"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/receptionist.rs"
  visibility: "public"
---
# `new`

Create a new ReceptionistAgent.

## Signature

```rust
fn new(name: &str, departments: ?<?>, greeting: ?<&str>, route: ?<&str>) -> Self
```

## Parameters

| Name          | Type      | Required | Default | Description |
| ------------- | --------- | -------- | ------- | ----------- |
| `name`        | `&str`    | yes      | —       | —           |
| `departments` | `?<?>`    | yes      | —       | —           |
| `greeting`    | `?<&str>` | yes      | —       | —           |
| `route`       | `?<&str>` | yes      | —       | —           |

## Returns

`Self`

## Source

[`src/prefabs/receptionist.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/receptionist.rs)

Line 21.
