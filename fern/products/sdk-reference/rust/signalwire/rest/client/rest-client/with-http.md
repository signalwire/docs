---
slug: "/reference/rust/signalwire/rest/client/rest-client/with-http"
title: "with_http"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::client::RestClient::with_http"
  parent: "signalwire::rest::client::RestClient"
  module: "rest.client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/client.rs"
  visibility: "public"
---
# `with_http`

Create a REST client with a specific HTTP client (for testing).

## Signature

```rust
fn with_http(project_id: &str, token: &str, space: &str, http: ?) -> ?<Self, ?>
```

## Parameters

| Name         | Type   | Required | Default | Description |
| ------------ | ------ | -------- | ------- | ----------- |
| `project_id` | `&str` | yes      | —       | —           |
| `token`      | `&str` | yes      | —       | —           |
| `space`      | `&str` | yes      | —       | —           |
| `http`       | `?`    | yes      | —       | —           |

## Returns

`?<Self, ?>`

## Source

[`src/rest/client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/client.rs)

Line 90.
