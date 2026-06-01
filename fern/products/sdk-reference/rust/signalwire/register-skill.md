---
slug: "/reference/rust/signalwire/register-skill"
title: "register_skill"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "function"
  language: "rust"
  qualified_name: "signalwire::register_skill"
  parent: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/lib.rs"
  visibility: "public"
---
# `register_skill`

Register a custom skill class.

Mirrors Python's `signalwire.register_skill(skill_class)`. Python's
`skill_class` carries both the name (via `SKILL_NAME` attribute) and
the factory (via the class itself); Rust packages the same pair as
a \[`SkillSpec`] tuple — the canonical "skill class" descriptor in
Rust.

## Signature

```rust
fn register_skill(skill_class: ?)
```

## Parameters

| Name          | Type | Required | Default | Description                                                                                                                                                                                                                                   |
| ------------- | ---- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `skill_class` | `?`  | yes      | —       | A \[`SkillSpec`] describing the skill's name and factory function. To preserve the older two-argument call style, \[`SkillRegistry::register_skill`] remains available as `signalwire::skills::SkillRegistry::register_skill(name, factory)`. |

## Source

[`src/lib.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/lib.rs)

Line 123.
