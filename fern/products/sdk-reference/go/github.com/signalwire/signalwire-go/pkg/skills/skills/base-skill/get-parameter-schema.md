---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/get-parameter-schema"
title: "GetParameterSchema"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.BaseSkill.GetParameterSchema"
  parent: "github.com/signalwire/signalwire-go/pkg/skills.BaseSkill"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/skill_base.go"
---
# `GetParameterSchema`

GetParameterSchema returns the common parameters available to all skills. The "tool\_name" parameter is only included when SupportsMultipleInstances() returns true, matching Python's conditional inclusion in get\_parameter\_schema().

## Signature

```go
func (*BaseSkill) GetParameterSchema() map[string]map[string]any
```

## Returns

`map[string]map[string]any`

## Source

[`pkg/skills/skill_base.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/skill_base.go)

Line 129.
