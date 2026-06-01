---
slug: "/reference/rust/signalwire/rest/http-client/http-client/list-all"
title: "list_all"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::http_client::HttpClient::list_all"
  parent: "signalwire::rest::http_client::HttpClient"
  module: "rest.http_client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs"
  visibility: "public"
---
# `list_all`

Return all pages of results, following `links.next`.

## Signature

```rust
fn list_all(&self, path: &str, params: &?<?, ?>) -> ?<?<?>, ?>
```

## Parameters

| Name     | Type       | Required | Default | Description |
| -------- | ---------- | -------- | ------- | ----------- |
| `path`   | `&str`     | yes      | —       | —           |
| `params` | `&?<?, ?>` | yes      | —       | —           |

## Returns

`?<?<?>, ?>`

## Source

[`src/rest/http_client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs)

Line 252.
