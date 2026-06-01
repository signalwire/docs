---
slug: "/reference/rust/signalwire/skills/skill-registry/skill-registry/add-skill-directory"
title: "add_skill_directory"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::skills::skill_registry::SkillRegistry::add_skill_directory"
  parent: "signalwire::skills::skill_registry::SkillRegistry"
  module: "skills.skill_registry"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/skills/skill_registry.rs"
  visibility: "public"
---
# `add_skill_directory`

Register an external directory containing third-party skill
factories.

Mirrors Python's
`signalwire.skills.registry.SkillRegistry.add_skill_directory`.
Rust cannot dynamically load `.rs` files the way Python loads
`.py` modules from a directory; in Rust, third-party skills
must call \[`SkillRegistry::register_skill`] at startup. The
path is recorded for introspection / logging purposes (matching
the Python `_external_paths` field) so the surface contract
matches.

**Errors:**

Returns an error string if the directory does not exist or is
not a directory.

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

[`src/skills/skill_registry.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/skills/skill_registry.rs)

Line 172.
