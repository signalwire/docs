---
slug: "/reference/rust/signalwire/rest/pagination/paginated-iterator/next-item"
title: "next_item"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::pagination::PaginatedIterator::next_item"
  parent: "signalwire::rest::pagination::PaginatedIterator"
  module: "rest.pagination"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/pagination.rs"
  visibility: "public"
---
# `next_item`

Fetch the next item, dispatching a new page request if needed.
Returns `Ok(None)` when the cursor is exhausted.

## Signature

```rust
fn next_item(&mut self) -> ?<?<?>, ?>
```

## Returns

`?<?<?>, ?>`

## Source

[`src/rest/pagination.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/pagination.rs)

Line 97.
