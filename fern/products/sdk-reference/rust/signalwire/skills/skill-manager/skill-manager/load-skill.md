---
slug: "/reference/rust/signalwire/skills/skill-manager/skill-manager/load-skill"
title: "load_skill"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::skills::skill_manager::SkillManager::load_skill"
  parent: "signalwire::skills::skill_manager::SkillManager"
  module: "skills.skill_manager"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/skills/skill_manager.rs"
  visibility: "public"
---
# `load_skill`

Load a skill by registry name, creating it via the registry factory.

Returns `(true, "")` on success, or `(false, reason)` on failure.

## Signature

```rust
fn load_skill(
    &mut self,
    skill_name: &str,
    params: ?<?, ?>,
    agent: &mut ?
) -> (bool, ?)
```

## Parameters

| Name         | Type      | Required | Default | Description |
| ------------ | --------- | -------- | ------- | ----------- |
| `skill_name` | `&str`    | yes      | —       | —           |
| `params`     | `?<?, ?>` | yes      | —       | —           |
| `agent`      | `&mut ?`  | yes      | —       | —           |

## Returns

`(bool, ?)`

## Source

[`src/skills/skill_manager.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/skills/skill_manager.rs)

Line 26.
