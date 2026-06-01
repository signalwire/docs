---
slug: "/reference/rust/signalwire/skills/skill-base/skill-base"
title: "SkillBase"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "interface"
  language: "rust"
  qualified_name: "signalwire::skills::skill_base::SkillBase"
  parent: "signalwire::skills::skill_base"
  module: "skills.skill_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/skills/skill_base.rs"
  visibility: "public"
---
# `SkillBase`

Trait implemented by all skills (both builtin and custom).

A skill encapsulates tools, hints, global data, and prompt sections that can
be loaded into an `AgentBase` via the `SkillManager`.

## Signature

```rust
trait SkillBase
```

## Inheritance

**Extends:** `?`, `?`

## Methods

- [`cleanup`](/reference/rust/signalwire/skills/skill-base/skill-base/cleanup) — Called when the skill is unloaded.
- [`description`](/reference/rust/signalwire/skills/skill-base/skill-base/description) — Human-readable description.
- [`get_global_data`](/reference/rust/signalwire/skills/skill-base/skill-base/get-global-data) — Key/value pairs merged into the agent's global data.
- [`get_hints`](/reference/rust/signalwire/skills/skill-base/skill-base/get-hints) — Speech recognition hints.
- [`get_instance_key`](/reference/rust/signalwire/skills/skill-base/skill-base/get-instance-key) — Instance key used to track loaded skills (allows tool\_name overrides).
- [`get_parameter_schema`](/reference/rust/signalwire/skills/skill-base/skill-base/get-parameter-schema) — JSON-Schema describing accepted parameters.
- [`get_prompt_sections`](/reference/rust/signalwire/skills/skill-base/skill-base/get-prompt-sections) — POM sections merged into the agent's prompt.
- [`get_swaig_fields`](/reference/rust/signalwire/skills/skill-base/skill-base/get-swaig-fields) — Get the SWAIG fields to merge into tool definitions.
- [`get_tool_name`](/reference/rust/signalwire/skills/skill-base/skill-base/get-tool-name) — Get the tool name, falling back to `default` if no override is set.
- [`name`](/reference/rust/signalwire/skills/skill-base/skill-base/name) — Unique snake\_case name of this skill (e.g. `"datetime"`).
- [`params`](/reference/rust/signalwire/skills/skill-base/skill-base/params) — Access the skill's configuration parameters.
- [`register_tools`](/reference/rust/signalwire/skills/skill-base/skill-base/register-tools) — Register tools on the agent.
- [`required_env_vars`](/reference/rust/signalwire/skills/skill-base/skill-base/required-env-vars) — Environment variables that must be set before `setup` is called.
- [`setup`](/reference/rust/signalwire/skills/skill-base/skill-base/setup) — One-time setup. Return `true` on success.
- [`supports_multiple_instances`](/reference/rust/signalwire/skills/skill-base/skill-base/supports-multiple-instances) — Whether multiple instances of this skill can be loaded simultaneously.
- [`validate_env_vars`](/reference/rust/signalwire/skills/skill-base/skill-base/validate-env-vars) — Validate that all required env vars are set. Returns missing var names.
- [`version`](/reference/rust/signalwire/skills/skill-base/skill-base/version) — Semantic version string.

## Source

[`src/skills/skill_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/skills/skill_base.rs)

Line 9.
