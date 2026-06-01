---
slug: "/reference/rust/signalwire/rest/http-client/http-transport"
title: "HttpTransport"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "interface"
  language: "rust"
  qualified_name: "signalwire::rest::http_client::HttpTransport"
  parent: "signalwire::rest::http_client"
  module: "rest.http_client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs"
  visibility: "public"
---
# `HttpTransport`

Trait for the HTTP transport layer.

Production code uses a real implementation (e.g. ureq), while
tests inject a mock.

## Signature

```rust
trait HttpTransport
```

## Inheritance

**Extends:** `?`, `?`

## Methods

- [`execute`](/reference/rust/signalwire/rest/http-client/http-transport/execute)

## Source

[`src/rest/http_client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs)

Line 13.
