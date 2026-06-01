---
slug: "/reference/rust/signalwire/skills/skill-registry/skill-registry/register-skill"
title: "register_skill"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::skills::skill_registry::SkillRegistry::register_skill"
  parent: "signalwire::skills::skill_registry::SkillRegistry"
  module: "skills.skill_registry"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/skills/skill_registry.rs"
  visibility: "public"
---
# `register_skill`

Register a custom skill factory.

## Signature

```rust
fn register_skill(name: &str, factory: ?)
```

## Parameters

| Name      | Type   | Required | Default | Description |
| --------- | ------ | -------- | ------- | ----------- |
| `name`    | `&str` | yes      | —       | —           |
| `factory` | `?`    | yes      | —       | —           |

## Source

[`src/skills/skill_registry.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/skills/skill_registry.rs)

Line 124.
