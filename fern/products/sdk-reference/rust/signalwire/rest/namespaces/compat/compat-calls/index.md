---
slug: "/reference/rust/signalwire/rest/namespaces/compat/compat-calls"
title: "CompatCalls"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::compat::CompatCalls"
  parent: "signalwire::rest::namespaces::compat"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/compat.rs"
  visibility: "public"
---
# `CompatCalls`

## Signature

```rust
struct CompatCalls { /* fields */ }
```

## Methods

- [`base_path`](/reference/rust/signalwire/rest/namespaces/compat/compat-calls/base-path)
- [`new`](/reference/rust/signalwire/rest/namespaces/compat/compat-calls/new)
- [`start_recording`](/reference/rust/signalwire/rest/namespaces/compat/compat-calls/start-recording) — POST /Calls/{sid}/Recordings — start a new recording on the call.
- [`start_stream`](/reference/rust/signalwire/rest/namespaces/compat/compat-calls/start-stream) — POST /Calls/{sid}/Streams — start a new stream on the call.
- [`stop_stream`](/reference/rust/signalwire/rest/namespaces/compat/compat-calls/stop-stream) — POST /Calls/{sid}/Streams/{stream\_sid} — stop / update a stream.
- [`update`](/reference/rust/signalwire/rest/namespaces/compat/compat-calls/update)
- [`update_recording`](/reference/rust/signalwire/rest/namespaces/compat/compat-calls/update-recording) — POST /Calls/{sid}/Recordings/{rec\_sid} — update a specific recording.

## Source

[`src/rest/namespaces/compat.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/compat.rs)

Line 161.
