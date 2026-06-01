---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills"
title: "skills"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
---
# `skills`

Package skills provides the skills system for SignalWire AI agents. Skills are modular capabilities that can be loaded into agents to provide tools, prompt sections, speech hints, and global data.

## Signature

```go
package skills
```

## Functions

- [`AddSkillDirectory`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/add-skill-directory) — AddSkillDirectory is a package-level shim that delegates to the shared `globalRegistry.AddSkillDirectory`. It mirrors Python's `signalwire.add_skill_directory` (which delegates to the module singleton `signalwire.skills.registry.skill_registry`).
- [`GetSkillFactory`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/get-skill-factory) — GetSkillFactory returns the factory function for a registered skill name. Returns nil if the skill is not registered.
- [`ListSkills`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/list-skills) — ListSkills returns sorted names of all registered skills.
- [`ListSkillsWithParams`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/list-skills-with-params) — ListSkillsWithParams returns the complete parameter schema for all registered skills. It instantiates each skill with nil params to obtain its GetParameterSchema output. This mirrors Python's skill\_registry.get\_all\_skills\_schema(). The returned map has skill names as keys and their parameter schemas as values.
- [`NewSkillManager`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/new-skill-manager) — NewSkillManager creates a new SkillManager.
- [`NewSkillRegistry`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/new-skill-registry) — NewSkillRegistry constructs a new SkillRegistry. The Python reference uses a singleton-per-module (`skill_registry`); Go callers can either construct their own via NewSkillRegistry() or use the global `globalRegistry` accessed through the package-level helpers.
- [`RegisterSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/register-skill) — RegisterSkill registers a skill factory function by name. This is typically called from init() functions in builtin skill packages.

## Classes

- [`BaseSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill) — BaseSkill provides default implementations for the SkillBase interface. Concrete skills should embed this struct and override methods as needed.
- [`SkillManager`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-manager) — SkillManager manages the lifecycle of loaded skill instances.
- [`SkillRegistry`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-registry) — SkillRegistry is the per-instance Python-parity surface mirroring `signalwire.skills.registry.SkillRegistry`. Each instance owns its own list of external skill directories, validated and de-duplicated on insert. The package-level `RegisterSkill` / `GetSkillFactory` / `ListSkills` functions remain the canonical Go API for static compile-time skill registration; `SkillRegistry` exists so the `add_skill_directory` parity case has a real owning object the audit and downstream callers can hold.
- [`ToolRegistration`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/tool-registration) — ToolRegistration describes a tool that a skill wants to register with the agent.

## Interfaces

- [`SkillBase`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-base) — SkillBase defines the interface that all skills must implement.
