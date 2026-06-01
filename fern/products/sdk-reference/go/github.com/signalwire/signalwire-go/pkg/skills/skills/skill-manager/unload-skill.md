---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/skill-manager/unload-skill"
title: "UnloadSkill"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.SkillManager.UnloadSkill"
  parent: "github.com/signalwire/signalwire-go/pkg/skills.SkillManager"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/manager.go"
---
# `UnloadSkill`

UnloadSkill removes a skill by its instance key. Returns true if found and removed.

## Signature

```go
func (*SkillManager) UnloadSkill(key string) bool
```

## Parameters

| Name  | Type     | Required | Default | Description |
| ----- | -------- | -------- | ------- | ----------- |
| `key` | `string` | yes      | —       | —           |

## Returns

`bool`

## Source

[`pkg/skills/manager.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/manager.go)

Line 63.
