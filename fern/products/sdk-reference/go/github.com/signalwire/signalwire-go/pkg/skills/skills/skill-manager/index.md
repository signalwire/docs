---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-manager"
title: "SkillManager"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.SkillManager"
  parent: "github.com/signalwire/signalwire-go/pkg/skills"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/manager.go"
---
# `SkillManager`

SkillManager manages the lifecycle of loaded skill instances.

## Signature

```go
type SkillManager struct
```

## Methods

- [`GetSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-manager/get-skill) — GetSkill returns the skill with the given instance key, or nil if not found.
- [`HasSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-manager/has-skill) — HasSkill returns true if a skill with the given instance key is loaded.
- [`ListLoadedSkills`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-manager/list-loaded-skills) — ListLoadedSkills returns the instance keys of all loaded skills.
- [`LoadSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-manager/load-skill) — LoadSkill validates environment variables, calls Setup, and registers the skill. Returns (success bool, errorMessage string).
- [`UnloadSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-manager/unload-skill) — UnloadSkill removes a skill by its instance key. Returns true if found and removed.

## Source

[`pkg/skills/manager.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/manager.go)

Line 10.
