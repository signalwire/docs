---
slug: "/reference/rust/signalwire/skills/builtin/datasphere/datasphere"
title: "Datasphere"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::skills::builtin::datasphere::Datasphere"
  parent: "signalwire::skills::builtin::datasphere"
  module: "skills.builtin.datasphere"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/skills/builtin/datasphere.rs"
  visibility: "public"
---
# `Datasphere`

Search knowledge using SignalWire DataSphere RAG stack.

Mirrors Python's `signalwire.skills.datasphere`: real HTTP POST to
`https://{space_name}.signalwire.com/api/datasphere/documents/search`
with project-id/token Basic auth and a JSON body containing the
document ID, query, distance, and count.

The base URL can be overridden by setting `DATASPHERE_BASE_URL` —
`audit_skills_dispatch.py` uses this to point at its loopback
fixture. Token can also come from `DATASPHERE_TOKEN`.

## Signature

```rust
struct Datasphere { /* fields */ }
```

## Inheritance

**Implements:** `SkillBase`

## Methods

- [`description`](/reference/rust/signalwire/skills/builtin/datasphere/datasphere/description)
- [`get_global_data`](/reference/rust/signalwire/skills/builtin/datasphere/datasphere/get-global-data)
- [`get_prompt_sections`](/reference/rust/signalwire/skills/builtin/datasphere/datasphere/get-prompt-sections)
- [`name`](/reference/rust/signalwire/skills/builtin/datasphere/datasphere/name)
- [`new`](/reference/rust/signalwire/skills/builtin/datasphere/datasphere/new)
- [`params`](/reference/rust/signalwire/skills/builtin/datasphere/datasphere/params)
- [`register_tools`](/reference/rust/signalwire/skills/builtin/datasphere/datasphere/register-tools)
- [`setup`](/reference/rust/signalwire/skills/builtin/datasphere/datasphere/setup)
- [`supports_multiple_instances`](/reference/rust/signalwire/skills/builtin/datasphere/datasphere/supports-multiple-instances)

## Source

[`src/skills/builtin/datasphere.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/skills/builtin/datasphere.rs)

Line 19.
