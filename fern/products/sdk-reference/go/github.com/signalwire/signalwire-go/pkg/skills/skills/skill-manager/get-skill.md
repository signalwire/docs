---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-manager/get-skill"
title: "GetSkill"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.SkillManager.GetSkill"
  parent: "github.com/signalwire/signalwire-go/pkg/skills.SkillManager"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/manager.go"
---
# `GetSkill`

GetSkill returns the skill with the given instance key, or nil if not found.

## Signature

```go
func (*SkillManager) GetSkill(key string) SkillBase
```

## Parameters

| Name  | Type     | Required | Default | Description |
| ----- | -------- | -------- | ------- | ----------- |
| `key` | `string` | yes      | —       | —           |

## Returns

`SkillBase`

## Source

[`pkg/skills/manager.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/manager.go)

Line 98.
