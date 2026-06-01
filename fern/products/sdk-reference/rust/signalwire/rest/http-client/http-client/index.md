---
slug: "/reference/rust/signalwire/rest/http-client/http-client"
title: "HttpClient"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::rest::http_client::HttpClient"
  parent: "signalwire::rest::http_client"
  module: "rest.http_client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs"
  visibility: "public"
---
# `HttpClient`

Low-level HTTP client for SignalWire REST APIs.

Uses Basic Auth with project\_id:token and returns parsed JSON
responses as `serde_json::Value`.

## Signature

```rust
struct HttpClient { /* fields */ }
```

## Methods

- [`auth_header`](/reference/rust/signalwire/rest/http-client/http-client/auth-header)
- [`base_url`](/reference/rust/signalwire/rest/http-client/http-client/base-url)
- [`delete`](/reference/rust/signalwire/rest/http-client/http-client/delete)
- [`get`](/reference/rust/signalwire/rest/http-client/http-client/get)
- [`list_all`](/reference/rust/signalwire/rest/http-client/http-client/list-all) — Return all pages of results, following `links.next`.
- [`new`](/reference/rust/signalwire/rest/http-client/http-client/new)
- [`patch`](/reference/rust/signalwire/rest/http-client/http-client/patch)
- [`post`](/reference/rust/signalwire/rest/http-client/http-client/post)
- [`project_id`](/reference/rust/signalwire/rest/http-client/http-client/project-id)
- [`put`](/reference/rust/signalwire/rest/http-client/http-client/put)
- [`token`](/reference/rust/signalwire/rest/http-client/http-client/token)
- [`with_stub`](/reference/rust/signalwire/rest/http-client/http-client/with-stub) — Create with a stub transport for testing.

## Source

[`src/rest/http_client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs)

Line 164.
