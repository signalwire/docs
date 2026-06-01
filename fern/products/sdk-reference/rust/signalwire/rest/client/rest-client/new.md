---
slug: "/reference/rust/signalwire/rest/client/rest-client/new"
title: "new"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::client::RestClient::new"
  parent: "signalwire::rest::client::RestClient"
  module: "rest.client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/client.rs"
  visibility: "public"
---
# `new`

Create a new REST client with explicit credentials. The base URL
resolves to `https://{space}`. Use \[`with_base_url`] to override
(e.g. for fixture-driven tests pointed at `http://127.0.0.1:N`).

## Signature

```rust
fn new(project_id: &str, token: &str, space: &str) -> ?<Self, ?>
```

## Parameters

| Name         | Type   | Required | Default | Description |
| ------------ | ------ | -------- | ------- | ----------- |
| `project_id` | `&str` | yes      | —       | —           |
| `token`      | `&str` | yes      | —       | —           |
| `space`      | `&str` | yes      | —       | —           |

## Returns

`?<Self, ?>`

## Source

[`src/rest/client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/client.rs)

Line 26.
