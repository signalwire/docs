---
slug: "/reference/rust/signalwire/skills/skill-registry/skill-registry"
title: "SkillRegistry"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::skills::skill_registry::SkillRegistry"
  parent: "signalwire::skills::skill_registry"
  module: "skills.skill_registry"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/skills/skill_registry.rs"
  visibility: "public"
---
# `SkillRegistry`

Public interface to the global skill registry.

## Signature

```rust
struct SkillRegistry;
```

## Methods

- [`add_skill_directory`](/reference/rust/signalwire/skills/skill-registry/skill-registry/add-skill-directory) — Register an external directory containing third-party skill factories.
- [`external_paths`](/reference/rust/signalwire/skills/skill-registry/skill-registry/external-paths) — Read the list of external skill directories registered via \[`SkillRegistry::add_skill_directory`].
- [`get_factory`](/reference/rust/signalwire/skills/skill-registry/skill-registry/get-factory) — Get the factory for a skill by name.
- [`list_skills`](/reference/rust/signalwire/skills/skill-registry/skill-registry/list-skills) — List all registered skill names (sorted).
- [`register_skill`](/reference/rust/signalwire/skills/skill-registry/skill-registry/register-skill) — Register a custom skill factory.

## Source

[`src/skills/skill_registry.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/skills/skill_registry.rs)

Line 120.
