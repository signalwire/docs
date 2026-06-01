---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/update-skill-data"
title: "UpdateSkillData"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.BaseSkill.UpdateSkillData"
  parent: "github.com/signalwire/signalwire-go/pkg/skills.BaseSkill"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/skill_base.go"
---
# `UpdateSkillData`

UpdateSkillData writes this skill instance's namespaced state into result's global\_data via result.UpdateGlobalData(). Returns result for method chaining. Mirrors Python's update\_skill\_data(result, data).

## Signature

```go
func (*BaseSkill) UpdateSkillData(result *swaig.FunctionResult, data map[string]any) *swaig.FunctionResult
```

## Parameters

| Name     | Type                    | Required | Default | Description |
| -------- | ----------------------- | -------- | ------- | ----------- |
| `result` | `*swaig.FunctionResult` | yes      | —       | —           |
| `data`   | `map[string]any`        | yes      | —       | —           |

## Returns

`*swaig.FunctionResult`

## Source

[`pkg/skills/skill_base.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/skill_base.go)

Line 187.
