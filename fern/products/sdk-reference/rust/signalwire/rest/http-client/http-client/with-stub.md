---
slug: "/reference/rust/signalwire/rest/http-client/http-client/with-stub"
title: "with_stub"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::http_client::HttpClient::with_stub"
  parent: "signalwire::rest::http_client::HttpClient"
  module: "rest.http_client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs"
  visibility: "public"
---
# `with_stub`

Create with a stub transport for testing.

## Signature

```rust
fn with_stub(project_id: &str, token: &str, base_url: &str) -> (Self, ?<?>)
```

## Parameters

| Name         | Type   | Required | Default | Description |
| ------------ | ------ | -------- | ------- | ----------- |
| `project_id` | `&str` | yes      | —       | —           |
| `token`      | `&str` | yes      | —       | —           |
| `base_url`   | `&str` | yes      | —       | —           |

## Returns

`(Self, ?<?>)`

## Source

[`src/rest/http_client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs)

Line 195.
