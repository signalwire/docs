---
slug: "/reference/rust/signalwire/pom/pom/prompt-object-model/add-section-with"
title: "add_section_with"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::pom::pom::PromptObjectModel::add_section_with"
  parent: "signalwire::pom::pom::PromptObjectModel"
  module: "pom.pom"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/pom/pom.rs"
  visibility: "public"
---
# `add_section_with`

Append a top-level section with title + body in one call.
Convenience wrapper that mirrors Python's keyword-style
`add_section(title=..., body=...)`.

## Signature

```rust
fn add_section_with<impl Into<String>: ?<?>>(
    &mut self,
    title: ?<?>,
    body: impl ?<?>
) -> ?<&mut ?, ?>
```

## Type Parameters

| Name                | Type   | Required | Default | Description |
| ------------------- | ------ | -------- | ------- | ----------- |
| `impl Into<String>` | `?<?>` | yes      | —       | —           |

## Parameters

| Name    | Type        | Required | Default | Description |
| ------- | ----------- | -------- | ------- | ----------- |
| `title` | `?<?>`      | yes      | —       | —           |
| `body`  | `impl ?<?>` | yes      | —       | —           |

## Returns

`?<&mut ?, ?>`

## Source

[`src/pom/pom.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/pom/pom.rs)

Line 107.
