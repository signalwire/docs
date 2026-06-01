---
slug: "/reference/rust/signalwire/add-skill-directory"
title: "add_skill_directory"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "function"
  language: "rust"
  qualified_name: "signalwire::add_skill_directory"
  parent: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/lib.rs"
  visibility: "public"
---
# `add_skill_directory`

Add a directory to the global skill search path.

Mirrors `signalwire.add_skill_directory(path)`. In Rust the
directory contents cannot be loaded at runtime — third-party
skills must call \[`skills::SkillRegistry::register_skill`] at
startup — but the registered path is recorded for introspection.

**Errors:**

Returns an error string if the directory does not exist or is not
a directory.

## Signature

```rust
fn add_skill_directory(path: &str) -> ?<(), ?>
```

## Parameters

| Name   | Type   | Required | Default | Description |
| ------ | ------ | -------- | ------- | ----------- |
| `path` | `&str` | yes      | —       | —           |

## Returns

`?<(), ?>`

## Source

[`src/lib.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/lib.rs)

Line 52.
