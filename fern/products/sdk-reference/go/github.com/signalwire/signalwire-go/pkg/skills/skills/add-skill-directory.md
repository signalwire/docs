---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/add-skill-directory"
title: "AddSkillDirectory"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.AddSkillDirectory"
  parent: "github.com/signalwire/signalwire-go/pkg/skills"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/registry.go"
---
# `AddSkillDirectory`

AddSkillDirectory is a package-level shim that delegates to the shared `globalRegistry.AddSkillDirectory`. It mirrors Python's `signalwire.add_skill_directory` (which delegates to the module singleton `signalwire.skills.registry.skill_registry`).

The path is validated (must exist and be a directory) and added (de-duplicated) to the global registry's external-paths list. Note that Go compiles to a static binary; dynamic on-disk skill loading is not implemented here, but the path-tracking surface is — so tools that introspect "what external directories has this agent registered?" get the same answer they'd get on the Python side.

## Signature

```go
func AddSkillDirectory(path string) error
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `path` | `string` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/skills/registry.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/registry.go)

Line 135.
