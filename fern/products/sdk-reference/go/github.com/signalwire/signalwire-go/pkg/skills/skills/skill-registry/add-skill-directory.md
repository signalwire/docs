---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-registry/add-skill-directory"
title: "AddSkillDirectory"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.SkillRegistry.AddSkillDirectory"
  parent: "github.com/signalwire/signalwire-go/pkg/skills.SkillRegistry"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/registry.go"
---
# `AddSkillDirectory`

AddSkillDirectory adds a directory to search for skills. Mirrors Python's `SkillRegistry.add_skill_directory`: validates that the path exists and is a directory, then appends it (de-duplicated) to the registry's external paths list. Returns an error (the Go analog of Python's `ValueError`) for non-existent paths or non-directories.

## Signature

```go
func (*SkillRegistry) AddSkillDirectory(path string) error
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `path` | `string` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/skills/registry.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/registry.go)

Line 49.
