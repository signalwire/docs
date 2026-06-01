---
slug: "/reference/rust/signalwire/rest/http-client/ureq-transport"
title: "UreqTransport"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::rest::http_client::UreqTransport"
  parent: "signalwire::rest::http_client"
  module: "rest.http_client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs"
  visibility: "public"
---
# `UreqTransport`

Real HTTP transport backed by ureq.

This is the production transport — every REST namespace operation
goes through `ureq::Agent::request()` to a real HTTP endpoint. The
REST audit fixture (`audit_rest_transport.py`) drives the wire
shape (method, path, headers, body) end-to-end against this code,
so any regression in serialization is caught.

## Signature

```rust
struct UreqTransport { /* fields */ }
```

## Inheritance

**Implements:** `Default`, `HttpTransport`

## Methods

- [`default`](/reference/rust/signalwire/rest/http-client/ureq-transport/default)
- [`execute`](/reference/rust/signalwire/rest/http-client/ureq-transport/execute)
- [`new`](/reference/rust/signalwire/rest/http-client/ureq-transport/new)

## Source

[`src/rest/http_client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs)

Line 30.
