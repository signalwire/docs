---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/claude-skills-skill/register-tools"
title: "RegisterTools"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills/builtin.ClaudeSkillsSkill.RegisterTools"
  parent: "github.com/signalwire/signalwire-go/pkg/skills/builtin.ClaudeSkillsSkill"
  module: "github.com.signalwire.signalwire-go.pkg.skills.builtin"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/claude_skills.go"
---
# `RegisterTools`

RegisterTools returns one ToolRegistration per discovered SKILL.md that is not flagged to skip.

## Signature

```go
func (*ClaudeSkillsSkill) RegisterTools() []skills.ToolRegistration
```

## Returns

`[]skills.ToolRegistration`

## Source

[`pkg/skills/builtin/claude_skills.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/skills/builtin/claude_skills.go)

Line 612.
