---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-registry"
title: "SkillRegistry"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.SkillRegistry"
  parent: "github.com/signalwire/signalwire-go/pkg/skills"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/registry.go"
---
# `SkillRegistry`

SkillRegistry is the per-instance Python-parity surface mirroring `signalwire.skills.registry.SkillRegistry`. Each instance owns its own list of external skill directories, validated and de-duplicated on insert. The package-level `RegisterSkill` / `GetSkillFactory` / `ListSkills` functions remain the canonical Go API for static compile-time skill registration; `SkillRegistry` exists so the `add_skill_directory` parity case has a real owning object the audit and downstream callers can hold.

## Signature

```go
type SkillRegistry struct
```

## Methods

- [`AddSkillDirectory`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-registry/add-skill-directory) — AddSkillDirectory adds a directory to search for skills. Mirrors Python's `SkillRegistry.add_skill_directory`: validates that the path exists and is a directory, then appends it (de-duplicated) to the registry's external paths list. Returns an error (the Go analog of Python's `ValueError`) for non-existent paths or non-directories.
- [`ExternalPaths`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-registry/external-paths) — ExternalPaths returns a copy of the registered external skill directories. Parity surface for Python's `_external_paths`.

## Source

[`pkg/skills/registry.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/registry.go)

Line 25.
