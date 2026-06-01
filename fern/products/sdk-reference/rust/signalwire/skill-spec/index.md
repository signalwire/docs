---
slug: "/reference/rust/signalwire/skill-spec"
title: "SkillSpec"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::SkillSpec"
  parent: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/lib.rs"
  visibility: "public"
---
# `SkillSpec`

Skill registration descriptor — Rust's analogue of a Python skill
class. Bundles a skill's registration name with its factory closure
into a single value so \[`register_skill`] can mirror Python's
one-argument signature.

## Signature

```rust
struct SkillSpec { /* fields */ }
```

## Properties

| Name      | Type | Required | Default | Description                                                                          |
| --------- | ---- | -------- | ------- | ------------------------------------------------------------------------------------ |
| `factory` | `?`  | yes      | —       | Factory closure that constructs a \[`skills::SkillBase`] from a JSON parameters map. |
| `name`    | `?`  | yes      | —       | Snake-case skill name used as the registry key.                                      |

## Methods

- [`new`](/reference/rust/signalwire/skill-spec/new) — Convenience constructor.

## Source

[`src/lib.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/lib.rs)

Line 131.
