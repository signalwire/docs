---
slug: "/reference/rust/signalwire/rest/crud-resource/crud-resource"
title: "CrudResource"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::rest::crud_resource::CrudResource"
  parent: "signalwire::rest::crud_resource"
  module: "rest.crud_resource"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/crud_resource.rs"
  visibility: "public"
---
# `CrudResource`

Generic CRUD wrapper around an HttpClient and a base API path.

Provides list / create / get / update / delete for any REST resource
that follows the standard SignalWire collection+item URL pattern.

## Signature

```rust
struct CrudResource { /* fields */ }
```

## Methods

- [`base_path`](/reference/rust/signalwire/rest/crud-resource/crud-resource/base-path)
- [`client`](/reference/rust/signalwire/rest/crud-resource/crud-resource/client)
- [`create`](/reference/rust/signalwire/rest/crud-resource/crud-resource/create) — Create a new resource (POST basePath).
- [`delete`](/reference/rust/signalwire/rest/crud-resource/crud-resource/delete) — Delete a resource by ID (DELETE basePath/{id}).
- [`get`](/reference/rust/signalwire/rest/crud-resource/crud-resource/get) — Retrieve a single resource by ID (GET basePath/{id}).
- [`list`](/reference/rust/signalwire/rest/crud-resource/crud-resource/list) — List resources (GET basePath).
- [`new`](/reference/rust/signalwire/rest/crud-resource/crud-resource/new)
- [`update`](/reference/rust/signalwire/rest/crud-resource/crud-resource/update) — Update a resource by ID (PUT basePath/{id}).

## Source

[`src/rest/crud_resource.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/crud_resource.rs)

Line 12.
