---
slug: "/reference/rust/signalwire/utils/url-validator/validate-url"
title: "validate_url"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "function"
  language: "rust"
  qualified_name: "signalwire::utils::url_validator::validate_url"
  parent: "signalwire::utils::url_validator"
  module: "utils.url_validator"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/utils/url_validator.rs"
  visibility: "public"
---
# `validate_url`

Validate that a URL is safe to fetch.

Mirrors Python's `validate_url(url, allow_private=False) -> bool`.

## Signature

```rust
fn validate_url(url: &str, allow_private: bool) -> bool
```

## Parameters

| Name            | Type   | Required | Default | Description |
| --------------- | ------ | -------- | ------- | ----------- |
| `url`           | `&str` | yes      | —       | —           |
| `allow_private` | `bool` | yes      | —       | —           |

## Returns

`bool`

## Source

[`src/utils/url_validator.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/utils/url_validator.rs)

Line 116.
