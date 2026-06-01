---
slug: "/reference/rust/signalwire/rest/http-client/stub-transport"
title: "StubTransport"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::rest::http_client::StubTransport"
  parent: "signalwire::rest::http_client"
  module: "rest.http_client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs"
  visibility: "public"
---
# `StubTransport`

A stub transport that records requests and returns canned responses.
Useful for unit testing without network access.

## Signature

```rust
struct StubTransport { /* fields */ }
```

## Inheritance

**Implements:** `HttpTransport`

## Properties

| Name       | Type                 | Required | Default | Description                             |
| ---------- | -------------------- | -------- | ------- | --------------------------------------- |
| `requests` | `?<?<(?, ?, ?<?>)>>` | yes      | —       | Recorded requests: (method, url, body). |
| `response` | `?<(u16, ?)>`        | yes      | —       | Canned response: (status\_code, body).  |

## Methods

- [`execute`](/reference/rust/signalwire/rest/http-client/stub-transport/execute)
- [`new`](/reference/rust/signalwire/rest/http-client/stub-transport/new)
- [`set_response`](/reference/rust/signalwire/rest/http-client/stub-transport/set-response)

## Source

[`src/rest/http_client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs)

Line 122.
