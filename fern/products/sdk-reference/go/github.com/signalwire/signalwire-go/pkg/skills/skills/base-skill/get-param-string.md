---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/skills/base-skill/get-param-string"
title: "GetParamString"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills.BaseSkill.GetParamString"
  parent: "github.com/signalwire/signalwire-go/pkg/skills.BaseSkill"
  module: "github.com.signalwire.signalwire-go.pkg.skills"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/skill_base.go"
---
# `GetParamString`

GetParamString retrieves a string parameter, returning the default if not found.

## Signature

```go
func (*BaseSkill) GetParamString(key string, defaultVal string) string
```

## Parameters

| Name         | Type     | Required | Default | Description |
| ------------ | -------- | -------- | ------- | ----------- |
| `key`        | `string` | yes      | —       | —           |
| `defaultVal` | `string` | yes      | —       | —           |

## Returns

`string`

## Source

[`pkg/skills/skill_base.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/skill_base.go)

Line 204.
