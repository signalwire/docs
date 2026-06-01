---
slug: "/reference/rust/signalwire/rest/namespaces/number-groups/number-groups/list-memberships"
title: "list_memberships"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::number_groups::NumberGroups::list_memberships"
  parent: "signalwire::rest::namespaces::number_groups::NumberGroups"
  module: "rest.namespaces.number_groups"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/number_groups.rs"
  visibility: "public"
---
# `list_memberships`

GET /api/relay/rest/number\_groups/{id}/number\_group\_memberships

## Signature

```rust
fn list_memberships(&self, group_id: &str, params: &?) -> ?<?, ?>
```

## Parameters

| Name       | Type   | Required | Default | Description |
| ---------- | ------ | -------- | ------- | ----------- |
| `group_id` | `&str` | yes      | —       | —           |
| `params`   | `&?`   | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/rest/namespaces/number_groups.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/number_groups.rs)

Line 75.
