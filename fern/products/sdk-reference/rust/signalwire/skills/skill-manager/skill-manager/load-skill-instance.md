---
slug: "/reference/rust/signalwire/skills/skill-manager/skill-manager/load-skill-instance"
title: "load_skill_instance"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::skills::skill_manager::SkillManager::load_skill_instance"
  parent: "signalwire::skills::skill_manager::SkillManager"
  module: "skills.skill_manager"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/skills/skill_manager.rs"
  visibility: "public"
---
# `load_skill_instance`

Load a skill from a pre-constructed instance.

## Signature

```rust
fn load_skill_instance(
    &mut self,
    instance: ?<dyn ?>,
    agent: &mut ?
) -> (bool, ?)
```

## Parameters

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `instance` | `?<dyn ?>` | yes      | —       | —           |
| `agent`    | `&mut ?`   | yes      | —       | —           |

## Returns

`(bool, ?)`

## Source

[`src/skills/skill_manager.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/skills/skill_manager.rs)

Line 113.
