---
slug: "/reference/rust/signalwire/rest/http-client/stub-transport/execute"
title: "execute"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::http_client::StubTransport::execute"
  parent: "signalwire::rest::http_client::StubTransport"
  module: "rest.http_client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs"
  visibility: "public"
---
# `execute`

## Signature

```rust
fn execute(
    &self,
    method: &str,
    url: &str,
    _headers: &?<?, ?>,
    body: ?<&str>
) -> ?<(u16, ?), ?>
```

## Parameters

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `method`   | `&str`     | yes      | —       | —           |
| `url`      | `&str`     | yes      | —       | —           |
| `_headers` | `&?<?, ?>` | yes      | —       | —           |
| `body`     | `?<&str>`  | yes      | —       | —           |

## Returns

`?<(u16, ?), ?>`

## Source

[`src/rest/http_client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/http_client.rs)

Line 143.
