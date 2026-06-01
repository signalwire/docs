---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/get-skill-factory"
title: "GetSkillFactory"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.GetSkillFactory"
  parent: "github.com/signalwire/signalwire-go/pkg/skills"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/registry.go"
---
# `GetSkillFactory`

GetSkillFactory returns the factory function for a registered skill name. Returns nil if the skill is not registered.

## Signature

```go
func GetSkillFactory(name string) func(params map[string]any) SkillBase
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `name` | `string` | yes      | —       | —           |

## Returns

`func(params map[string]any) SkillBase`

## Source

[`pkg/skills/registry.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/registry.go)

Line 91.
