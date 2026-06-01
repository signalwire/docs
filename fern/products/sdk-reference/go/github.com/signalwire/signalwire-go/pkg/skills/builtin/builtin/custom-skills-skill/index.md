---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/custom-skills-skill"
title: "CustomSkillsSkill"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills/builtin.CustomSkillsSkill"
  parent: "github.com/signalwire/signalwire-go/pkg/skills/builtin"
  module: "github.com.signalwire.signalwire-go.pkg.skills.builtin"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/custom_skills.go"
---
# `CustomSkillsSkill`

CustomSkillsSkill is a meta-skill that registers user-defined tools.

## Signature

```go
type CustomSkillsSkill struct
```

## Properties

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `BaseSkill` | `skills.BaseSkill` | yes      | —       | —           |

## Methods

- [`GetInstanceKey`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/custom-skills-skill/get-instance-key)
- [`GetParameterSchema`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/custom-skills-skill/get-parameter-schema)
- [`GetPromptSections`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/custom-skills-skill/get-prompt-sections)
- [`RegisterTools`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/custom-skills-skill/register-tools)
- [`Setup`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/custom-skills-skill/setup)
- [`SupportsMultipleInstances`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/custom-skills-skill/supports-multiple-instances)

## Source

[`pkg/skills/builtin/custom_skills.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/custom_skills.go)

Line 9.
