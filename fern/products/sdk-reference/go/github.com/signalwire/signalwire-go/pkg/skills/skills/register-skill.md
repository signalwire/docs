---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/register-skill"
title: "RegisterSkill"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.RegisterSkill"
  parent: "github.com/signalwire/signalwire-go/pkg/skills"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/registry.go"
---
# `RegisterSkill`

RegisterSkill registers a skill factory function by name. This is typically called from init() functions in builtin skill packages.

## Signature

```go
func RegisterSkill(name string, factory func(params map[string]any) SkillBase)
```

## Parameters

| Name      | Type                                    | Required | Default | Description |
| --------- | --------------------------------------- | -------- | ------- | ----------- |
| `name`    | `string`                                | yes      | —       | —           |
| `factory` | `func(params map[string]any) SkillBase` | yes      | —       | —           |

## Source

[`pkg/skills/registry.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/registry.go)

Line 83.
