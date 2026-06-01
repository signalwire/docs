---
slug: "/reference/dotnet/signal-wire.skills/skill-registry"
title: "SkillRegistry"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Skills.SkillRegistry"
  parent: "SignalWire.Skills"
  module: "SignalWire.Skills"
  visibility: "public"
---
# `SkillRegistry`

Thread-safe singleton that maps snake\_case skill names to factory delegates.
All 18 built-in skills are registered lazily on first access.

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class SkillRegistry
```

## Properties

| Name            | Type                                                  | Required | Default | Description                                                                                                                                                     |
| --------------- | ----------------------------------------------------- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ExternalPaths` | `public IReadOnlyList<string> ExternalPaths { get; }` | yes      | —       | External skill-source paths added via <xref href="SignalWire.Skills.SkillRegistry.AddSkillDirectory(System.String)" data-throw-if-not-resolved="false"></xref>. |
| `Instance`      | `public static SkillRegistry Instance { get; }`       | yes      | —       | —                                                                                                                                                               |
| `Logger`        | `public Logger Logger { get; }`                       | yes      | —       | The skill\_registry logger. (Python parity: `SkillRegistry.logger` instance attribute.)                                                                         |

## Methods

- [`AddSkillDirectory(string)`](/reference/dotnet/signal-wire.skills/skill-registry/add-skill-directory-string) — Add a directory to the external skill-source path list. .NET ports loading skills from disk SHOULD consult this list. Throws when the path does not exist or is not a directory. (Python parity: `SkillRegistry.add_skill_directory(path)`.)
- [`DiscoverSkills()`](/reference/dotnet/signal-wire.skills/skill-registry/discover-skills) — Deprecated no-op: skills are loaded on-demand. (Python parity: `SkillRegistry.discover_skills` — kept for backwards compatibility; the Python doc says exactly this.)
- [`GetFactory(string)`](/reference/dotnet/signal-wire.skills/skill-registry/get-factory-string) — Get the factory for a skill name. Checks custom registrations first, then falls back to built-in factories.
- [`ListSkills()`](/reference/dotnet/signal-wire.skills/skill-registry/list-skills) — Return all known skill names (builtins + custom), sorted.
- [`RegisterSkill(string, Func<SkillBase>)`](/reference/dotnet/signal-wire.skills/skill-registry/register-skill-string-func-skill-base) — Register a custom skill factory.
- [`Reset()`](/reference/dotnet/signal-wire.skills/skill-registry/reset) — Reset the singleton (for testing).
