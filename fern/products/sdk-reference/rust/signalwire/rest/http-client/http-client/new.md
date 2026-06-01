---
slug: "/reference/rust/signalwire/rest/http-client/http-client/new"
title: "new"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::http_client::HttpClient::new"
  parent: "signalwire::rest::http_client::HttpClient"
  module: "rest.http_client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs"
  visibility: "public"
---
# `new`

## Signature

```rust
fn new(
    project_id: &str,
    token: &str,
    base_url: &str,
    transport: ?<dyn ?>
) -> Self
```

## Parameters

| Name         | Type       | Required | Default | Description |
| ------------ | ---------- | -------- | ------- | ----------- |
| `project_id` | `&str`     | yes      | —       | —           |
| `token`      | `&str`     | yes      | —       | —           |
| `base_url`   | `&str`     | yes      | —       | —           |
| `transport`  | `?<dyn ?>` | yes      | —       | —           |

## Returns

`Self`

## Source

[`src/rest/http_client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs)

Line 174.
