---
slug: "/reference/rust/signalwire/skills/skill-manager/skill-manager"
title: "SkillManager"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::skills::skill_manager::SkillManager"
  parent: "signalwire::skills::skill_manager"
  module: "skills.skill_manager"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/skills/skill_manager.rs"
  visibility: "public"
---
# `SkillManager`

Manages loaded skills for an agent — validates, sets up, and merges skill
contributions (tools, hints, global data, prompt sections) into the agent.

## Signature

```rust
struct SkillManager { /* fields */ }
```

## Inheritance

**Implements:** `Default`

## Methods

- [`default`](/reference/rust/signalwire/skills/skill-manager/skill-manager/default)
- [`get_skill`](/reference/rust/signalwire/skills/skill-manager/skill-manager/get-skill) — Get a reference to a loaded skill.
- [`has_skill`](/reference/rust/signalwire/skills/skill-manager/skill-manager/has-skill) — Check if a skill is loaded.
- [`list_skills`](/reference/rust/signalwire/skills/skill-manager/skill-manager/list-skills) — List all loaded skill instance keys.
- [`load_skill`](/reference/rust/signalwire/skills/skill-manager/skill-manager/load-skill) — Load a skill by registry name, creating it via the registry factory.
- [`load_skill_instance`](/reference/rust/signalwire/skills/skill-manager/skill-manager/load-skill-instance) — Load a skill from a pre-constructed instance.
- [`new`](/reference/rust/signalwire/skills/skill-manager/skill-manager/new)
- [`unload_skill`](/reference/rust/signalwire/skills/skill-manager/skill-manager/unload-skill) — Unload a skill by instance key.

## Source

[`src/skills/skill_manager.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/skills/skill_manager.rs)

Line 12.
