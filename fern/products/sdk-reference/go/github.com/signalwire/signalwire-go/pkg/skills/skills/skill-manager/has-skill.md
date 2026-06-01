---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-manager/has-skill"
title: "HasSkill"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.SkillManager.HasSkill"
  parent: "github.com/signalwire/signalwire-go/pkg/skills.SkillManager"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/manager.go"
---
# `HasSkill`

HasSkill returns true if a skill with the given instance key is loaded.

## Signature

```go
func (*SkillManager) HasSkill(key string) bool
```

## Parameters

| Name  | Type     | Required | Default | Description |
| ----- | -------- | -------- | ------- | ----------- |
| `key` | `string` | yes      | —       | —           |

## Returns

`bool`

## Source

[`pkg/skills/manager.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/manager.go)

Line 90.
