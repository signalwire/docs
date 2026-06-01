---
slug: "/reference/rust/signalwire"
title: "signalwire"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "module"
  language: "rust"
  qualified_name: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/lib.rs"
  visibility: "public"
---
# `signalwire`

## Functions

- [`add_skill_directory`](/reference/rust/signalwire/add-skill-directory) — Add a directory to the global skill search path.
- [`list_skills`](/reference/rust/signalwire/list-skills) — Sorted list of every registered skill name.
- [`list_skills_with_params`](/reference/rust/signalwire/list-skills-with-params) — Per-skill schema map (parameter metadata) for every registered skill. Currently returns only the skill name as the key with an empty parameter map — Rust skills don't carry rich Python-style parameter introspection. The shape matches Python's contract so downstream tooling can iterate.
- [`register_skill`](/reference/rust/signalwire/register-skill) — Register a custom skill class.
- [`RestClient`](/reference/rust/signalwire/rest-client) — Construct a \[`RestClient`] from positional or keyword credentials.
- [`run_agent`](/reference/rust/signalwire/run-agent) — Run the supplied \[`AgentBase`] directly (without an \[`AgentServer`]) on its configured host/port. Blocking call.
- [`start_agent`](/reference/rust/signalwire/start-agent) — Construct an \[`AgentServer`] containing a single \[`AgentBase`] and run it on the configured `host:port`. Blocking call.

## Classes

- [`SkillSpec`](/reference/rust/signalwire/skill-spec) — Skill registration descriptor — Rust's analogue of a Python skill class. Bundles a skill's registration name with its factory closure into a single value so \[`register_skill`] can mirror Python's one-argument signature.

## Modules

- [`agent`](/reference/rust/signalwire/agent)
- [`contexts`](/reference/rust/signalwire/contexts)
- [`core`](/reference/rust/signalwire/core)
- [`datamap`](/reference/rust/signalwire/datamap)
- [`logging`](/reference/rust/signalwire/logging)
- [`pom`](/reference/rust/signalwire/pom) — Prompt Object Model (POM)
- [`prefabs`](/reference/rust/signalwire/prefabs)
- [`relay`](/reference/rust/signalwire/relay)
- [`rest`](/reference/rust/signalwire/rest)
- [`security`](/reference/rust/signalwire/security)
- [`server`](/reference/rust/signalwire/server)
- [`serverless`](/reference/rust/signalwire/serverless)
- [`skills`](/reference/rust/signalwire/skills)
- [`swaig`](/reference/rust/signalwire/swaig)
- [`swml`](/reference/rust/signalwire/swml)
- [`utils`](/reference/rust/signalwire/utils)

## Source

[`src/lib.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/lib.rs)

Line 1.
