---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/new-skill-registry"
title: "NewSkillRegistry"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.NewSkillRegistry"
  parent: "github.com/signalwire/signalwire-go/pkg/skills"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/registry.go"
---
# `NewSkillRegistry`

NewSkillRegistry constructs a new SkillRegistry. The Python reference uses a singleton-per-module (`skill_registry`); Go callers can either construct their own via NewSkillRegistry() or use the global `globalRegistry` accessed through the package-level helpers.

## Signature

```go
func NewSkillRegistry() *SkillRegistry
```

## Returns

`*SkillRegistry`

## Source

[`pkg/skills/registry.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/registry.go)

Line 34.
