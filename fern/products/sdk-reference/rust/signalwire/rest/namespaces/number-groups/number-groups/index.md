---
slug: "/reference/rust/signalwire/rest/namespaces/number-groups/number-groups"
title: "NumberGroups"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::number_groups::NumberGroups"
  parent: "signalwire::rest::namespaces::number_groups"
  module: "rest.namespaces.number_groups"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/number_groups.rs"
  visibility: "public"
---
# `NumberGroups`

Number Groups namespace.

Mirrors `signalwire.rest.namespaces.number_groups.NumberGroupsResource`.
Provides standard CRUD over `/api/relay/rest/number_groups` plus the
membership endpoints rooted at the same collection and at the
project-scoped `/api/relay/rest/number_group_memberships` collection.

## Signature

```rust
struct NumberGroups { /* fields */ }
```

## Methods

- [`add_membership`](/reference/rust/signalwire/rest/namespaces/number-groups/number-groups/add-membership)
- [`base_path`](/reference/rust/signalwire/rest/namespaces/number-groups/number-groups/base-path)
- [`create`](/reference/rust/signalwire/rest/namespaces/number-groups/number-groups/create)
- [`delete`](/reference/rust/signalwire/rest/namespaces/number-groups/number-groups/delete)
- [`delete_membership`](/reference/rust/signalwire/rest/namespaces/number-groups/number-groups/delete-membership)
- [`get`](/reference/rust/signalwire/rest/namespaces/number-groups/number-groups/get)
- [`get_membership`](/reference/rust/signalwire/rest/namespaces/number-groups/number-groups/get-membership)
- [`list`](/reference/rust/signalwire/rest/namespaces/number-groups/number-groups/list)
- [`list_memberships`](/reference/rust/signalwire/rest/namespaces/number-groups/number-groups/list-memberships) — GET /api/relay/rest/number\_groups/{id}/number\_group\_memberships
- [`new`](/reference/rust/signalwire/rest/namespaces/number-groups/number-groups/new)
- [`update`](/reference/rust/signalwire/rest/namespaces/number-groups/number-groups/update)

## Source

[`src/rest/namespaces/number_groups.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/number_groups.rs)

Line 14.
