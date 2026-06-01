---
slug: "/reference/rust/signalwire/rest/pagination/paginated-iterator"
title: "PaginatedIterator"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::rest::pagination::PaginatedIterator"
  parent: "signalwire::rest::pagination"
  module: "rest.pagination"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/pagination.rs"
  visibility: "public"
---
# `PaginatedIterator`

Streaming iterator that walks a `links.next`-paginated REST endpoint.

Holds a borrowed reference to the \[`HttpClient`] for the duration of
iteration. Use the \[`Iterator`] impl (`for item in it { ... }`) or
step manually via \[`PaginatedIterator::next_item`].

## Signature

```rust
struct PaginatedIterator { /* fields */ }
```

## Inheritance

**Implements:** `Iterator`

## Methods

- [`data_key`](/reference/rust/signalwire/rest/pagination/paginated-iterator/data-key)
- [`http`](/reference/rust/signalwire/rest/pagination/paginated-iterator/http)
- [`index`](/reference/rust/signalwire/rest/pagination/paginated-iterator/index__2)
- [`is_done`](/reference/rust/signalwire/rest/pagination/paginated-iterator/is-done)
- [`items`](/reference/rust/signalwire/rest/pagination/paginated-iterator/items)
- [`new`](/reference/rust/signalwire/rest/pagination/paginated-iterator/new) — Construct a new iterator.
- [`next`](/reference/rust/signalwire/rest/pagination/paginated-iterator/next)
- [`next_item`](/reference/rust/signalwire/rest/pagination/paginated-iterator/next-item) — Fetch the next item, dispatching a new page request if needed. Returns `Ok(None)` when the cursor is exhausted.
- [`params`](/reference/rust/signalwire/rest/pagination/paginated-iterator/params)
- [`path`](/reference/rust/signalwire/rest/pagination/paginated-iterator/path)

## Type Aliases

- [`Item`](/reference/rust/signalwire/rest/pagination/paginated-iterator/item)

## Source

[`src/rest/pagination.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/pagination.rs)

Line 26.
