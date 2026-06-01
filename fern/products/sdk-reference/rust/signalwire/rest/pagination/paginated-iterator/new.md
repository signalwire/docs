---
slug: "/reference/rust/signalwire/rest/pagination/paginated-iterator/new"
title: "new"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::pagination::PaginatedIterator::new"
  parent: "signalwire::rest::pagination::PaginatedIterator"
  module: "rest.pagination"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/pagination.rs"
  visibility: "public"
---
# `new`

Construct a new iterator.

`params` and `data_key` mirror the Python signature: the body field
containing the items array is named `data_key` (typically `"data"`),
and `params` is forwarded on the first GET.

## Signature

```rust
fn new(http: &'a ?, path: &str, params: ?<?, ?>, data_key: &str) -> Self
```

## Parameters

| Name       | Type      | Required | Default | Description |
| ---------- | --------- | -------- | ------- | ----------- |
| `http`     | `&'a ?`   | yes      | —       | —           |
| `path`     | `&str`    | yes      | —       | —           |
| `params`   | `?<?, ?>` | yes      | —       | —           |
| `data_key` | `&str`    | yes      | —       | —           |

## Returns

`Self`

## Source

[`src/rest/pagination.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/pagination.rs)

Line 48.
