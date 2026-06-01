---
slug: "/reference/rust/signalwire/pom/section/section/add-subsection-full"
title: "add_subsection_full"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::pom::section::Section::add_subsection_full"
  parent: "signalwire::pom::section::Section"
  module: "pom.section"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/pom/section.rs"
  visibility: "public"
---
# `add_subsection_full`

Add a fully-specified subsection. Convenience that mirrors
Python's keyword-argument form
`add_subsection(title=..., body=..., bullets=..., numbered=..., numberedBullets=...)`.

## Signature

```rust
fn add_subsection_full<impl Into<String>: ?<?>, impl Into<String>: ?<?>>(
    &mut self,
    title: impl ?<?>,
    body: impl ?<?>,
    bullets: ?<?>,
    numbered: ?<bool>,
    numbered_bullets: bool
) -> &mut ?
```

## Type Parameters

| Name                | Type   | Required | Default | Description |
| ------------------- | ------ | -------- | ------- | ----------- |
| `impl Into<String>` | `?<?>` | yes      | —       | —           |
| `impl Into<String>` | `?<?>` | yes      | —       | —           |

## Parameters

| Name               | Type        | Required | Default | Description |
| ------------------ | ----------- | -------- | ------- | ----------- |
| `title`            | `impl ?<?>` | yes      | —       | —           |
| `body`             | `impl ?<?>` | yes      | —       | —           |
| `bullets`          | `?<?>`      | yes      | —       | —           |
| `numbered`         | `?<bool>`   | yes      | —       | —           |
| `numbered_bullets` | `bool`      | yes      | —       | —           |

## Returns

`&mut ?`

## Source

[`src/pom/section.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/pom/section.rs)

Line 106.
